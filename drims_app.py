"""
DRIMS - Disaster Relief Inventory Management System
Main Flask Application
"""
import os
from flask import Flask, abort, render_template, redirect, url_for, flash, request, session
from flask_login import LoginManager, login_user, logout_user, login_required, current_user
from keycloak import KeycloakOpenID, KeycloakAuthenticationError
from keycloak.exceptions import KeycloakAuthenticationError, KeycloakConnectionError


from app.db import db, init_db
from app.db.models import User, Role, Event, Warehouse, Item, Inventory, Agency, ReliefRqst
from settings import Config
from app.security.csp import init_csp
from app.security.cache_control import init_cache_control
from app.security.header_sanitization import init_header_sanitization
from app.security.error_handling import init_error_handling
from app.security.query_string_protection import init_query_string_protection

app = Flask(__name__)
app.config.from_object(Config)

init_db(app)
init_csp(app)
init_cache_control(app)
init_header_sanitization(app)
init_error_handling(app)
init_query_string_protection(app)

login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = 'login'

def get_keycloak_client():
    # ToDo: Handle Connection error
    kc_client = KeycloakOpenID(**app.config['KEYCLOAK_CONF'])
    return kc_client

def trim_keycloak_token(token):
    '''returns a slimmed down token dict for storing in the session'''
    keys_to_keep = ['refresh_token', 'expires_in', 'refresh_expires_in']
    return dict([(x, token.get(x, None)) for x in keys_to_keep])

@login_manager.user_loader
def load_user(user_id):
    ''' use the token refresh process to determine if the user is still
    signed in. But, we will only refresh if the access token has expired
    If the refresh token has expired, the user will be signed out.
    '''
    token = session.get('_user_token')
    token_time = session.get('_token_time')
    if token and token_time:
        token_age = now().timestamp() - token_time
        print(f'Is {token["expires_in"]} (time) > {token_age} (age)?')
        if token_age > (token['expires_in']*0.95):
            # try refresh token if it expire or soon expire
            if token_age > token['refresh_expires_in']:
                # refresh token expired. Logout any user and return none
                keycloak_logout()
                return None

            kc = get_keycloak_client()
            token = kc.refresh_token(token['refresh_token'])
            print(f'refreshing token to get \n\n{token}')
            session['_user_token'] = trim_keycloak_token(token)
            session['_token_time'] = now().timestamp()
            
        user_q = User.query.filter_by(user_uuid=user_id)
        return user_q.first()
    return None


from app.features.events import events_bp
from app.features.warehouses import warehouses_bp
from app.features.items import items_bp
from app.features.item_categories import item_categories_bp
from app.features.uom import uom_bp
from app.features.inventory import inventory_bp
from app.features.requests_aidmgmt import requests_bp
from app.features.packaging import packaging_bp
from app.features.donations import donations_bp
from app.features.donation_intake import donation_intake_bp
from app.features.intake_aidmgmt import bp as intake_bp
from app.features.user_admin import user_admin_bp
from app.features.donors import donors_bp
from app.features.agencies import agencies_bp
from app.features.custodians import custodians_bp
from app.features.dashboard import dashboard_bp
from app.features.transfers import transfers_bp
from app.features.notifications import notifications_bp
from app.features.reports import reports_bp
from app.features.account_requests import account_requests_bp
from app.features.eligibility import eligibility_bp
from app.features.odpem_director import director_bp
from app.features.profile import profile_bp
from app.features.operations_dashboard import operations_dashboard_bp
from app.core.status import get_status_label, get_status_badge_class
from app.core.rbac import (
    has_role, has_all_roles, has_warehouse_access,
    is_admin, is_logistics_manager, is_logistics_officer, is_director_level,
    can_manage_users, can_view_reports, has_permission
)
from app.core.feature_registry import FeatureRegistry

def get_feature_details(feature_key):
    """Get complete feature details from registry for templates."""
    if feature_key in FeatureRegistry.FEATURES:
        return {
            'key': feature_key,
            **FeatureRegistry.FEATURES[feature_key]
        }
    return None

app.jinja_env.globals.update(
    has_role=has_role,
    has_all_roles=has_all_roles,
    has_warehouse_access=has_warehouse_access,
    is_admin=is_admin,
    is_logistics_manager=is_logistics_manager,
    is_logistics_officer=is_logistics_officer,
    is_director_level=is_director_level,
    can_manage_users=can_manage_users,
    can_view_reports=can_view_reports,
    has_permission=has_permission,
    has_feature=lambda feature_key: FeatureRegistry.has_access(current_user, feature_key),
    get_dashboard_features=lambda: FeatureRegistry.get_dashboard_features(current_user),
    get_navigation_features=lambda group=None: FeatureRegistry.get_navigation_features(current_user, group),
    get_user_features=lambda: FeatureRegistry.get_accessible_features(current_user),
    get_user_primary_role=lambda: FeatureRegistry.get_primary_role(current_user),
    get_role_display_name=FeatureRegistry.get_role_display_name,
    get_feature_details=get_feature_details
)

# Date formatting filter moved below to use timezone utilities

app.register_blueprint(dashboard_bp, url_prefix='/dashboard')
app.register_blueprint(events_bp)
app.register_blueprint(warehouses_bp)
app.register_blueprint(items_bp)
app.register_blueprint(item_categories_bp)
app.register_blueprint(uom_bp)
app.register_blueprint(inventory_bp)
app.register_blueprint(requests_bp)
app.register_blueprint(packaging_bp)
app.register_blueprint(donations_bp)
app.register_blueprint(donation_intake_bp)
app.register_blueprint(intake_bp)
app.register_blueprint(user_admin_bp, url_prefix='/users')
app.register_blueprint(donors_bp, url_prefix='/donors')
app.register_blueprint(agencies_bp, url_prefix='/agencies')
app.register_blueprint(custodians_bp, url_prefix='/custodians')
app.register_blueprint(transfers_bp, url_prefix='/transfers')
app.register_blueprint(notifications_bp, url_prefix='/notifications')
app.register_blueprint(reports_bp, url_prefix='/reports')
app.register_blueprint(account_requests_bp)
app.register_blueprint(eligibility_bp)
app.register_blueprint(director_bp)
app.register_blueprint(profile_bp)
app.register_blueprint(operations_dashboard_bp)

@app.template_filter('status_badge')
def status_badge_filter(status_code, entity_type):
    """Return Bootstrap badge color class for status codes"""
    return get_status_badge_class(status_code, entity_type)

@app.template_filter('status_label')
def status_label_filter(status_code, entity_type):
    """Return human-readable label for status codes"""
    return get_status_label(status_code, entity_type)

@app.context_processor
def inject_now():
    """Inject current datetime for footer year and other templates"""
    from app.utils.timezone import now
    return {'now': now()}

# Register timezone-aware Jinja filters
from app.utils.timezone import format_datetime, datetime_to_jamaica, now

@app.template_filter('format_datetime')
def format_datetime_filter(dt, format_str='%Y-%m-%d %H:%M:%S'):
    """Format datetime in Jamaica timezone"""
    return format_datetime(dt, format_str)

@app.template_filter('format_date')
def format_date_filter(dt):
    """Format date only"""
    return format_datetime(dt, '%Y-%m-%d')

@app.template_filter('to_jamaica')
def to_jamaica_filter(dt):
    """Convert datetime to Jamaica timezone"""
    return datetime_to_jamaica(dt)

@app.route('/static/')
@app.route('/static')
def block_static_directory():
    """
    Prevent directory browsing of /static/ folder
    Returns 404 to hide directory existence for security
    Individual static files are still accessible via Flask's built-in static serving
    """
    abort(404)

@app.route('/')
@login_required
def index():
    """Redirect to role-based dashboard"""
   
def keycloak_login(email, pwd, totp=None):
    """Handles authentication by passing un/pw to keycloak and processing
    the response

    Args:
        email (string): user email as username
        pwd (string): password
        totp (string, optional): Temporary 1-time password if any. Defaults to None.

    Returns:
        dict: user info from keycloak or None
    """
    keycloak_openid = get_keycloak_client()
    try:
        if (totp is None):
            token = keycloak_openid.token(email, pwd)
        else:
            token = keycloak_openid.token(email, pwd, totp=totp)
    except KeycloakAuthenticationError:
        # ToDo: Log authentication failure
        return False
    # token has keys: access_token, refresh_token, id_token, session_state, scope
    user_info = keycloak_openid.userinfo(token['access_token'])
    user = User.query.filter_by(email=user_info.get('email', '@fake-email')).first()
    # ToDo: remove this before production??
    # if user.user_uuid is None:
    #     user.user_uuid = user_info['sub']
    session_token = trim_keycloak_token(token)
    session['_user_token'] = session_token
    session['_token_time'] = now().timestamp()
    login_user(user)
    return True

def keycloak_logout():
    '''Logout user and delete custom session values'''
    session.pop('_user_token', None)
    session.pop('_token_time', None)
    logout_user()

@app.route('/login', methods=['GET', 'POST'])
def login():
    """User login"""
    if current_user.is_authenticated:
        return redirect(url_for('dashboard.index'))
    
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')
        
        succes = keycloak_login(email, password)
        if succes:
            next_page = request.args.get('next')
            return redirect(next_page if next_page else url_for('dashboard.index'))
        else:
            flash('Invalid email or password', 'danger')
    
    return render_template('login.html')

@app.route('/test-feature-components')
@login_required
def test_feature_components():
    """Test feature registry components"""
    return render_template('test_feature_components.html')

@app.route('/logout')
@login_required
def logout():
    """User logout"""
    keycloak_logout()
    flash('You have been logged out', 'info')
    return redirect(url_for('login'))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=app.config['DEBUG'])
