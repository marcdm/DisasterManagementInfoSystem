
from flask import current_app
from flask import session
from flask_login import login_user, logout_user
from keycloak import KeycloakOpenID, KeycloakAuthenticationError
from keycloak.exceptions import KeycloakAuthenticationError, KeycloakConnectionError
from ..db.models import User
from .timezone import now

__all__ = [
    'check_refresh_token', 'keycloak_login', 'keycloak_logout',
    'create_keycloak_user'
]

def get_keycloak_client():
    # ToDo: Handle Connection error
    app_conf = current_app.config
    kc_client = KeycloakOpenID(**app_conf['KEYCLOAK_CONF'])
    return kc_client

def trim_keycloak_token(token):
    '''returns a slimmed down token dict for storing in the session'''
    keys_to_keep = ['refresh_token', 'expires_in', 'refresh_expires_in']
    return dict([(x, token.get(x, None)) for x in keys_to_keep])

def check_refresh_token() -> bool:
    '''Checks if the token in the session has expired and tries to refresh.
    Returns True if token has not expired or was successfully refreshed.
    '''
    token = session.get('_user_token')
    token_time = session.get('_token_time')
    # ToDo: Decide how/why to check access token
    if token and token_time:
        token_age = now().timestamp() - token_time
        if token_age > (token['expires_in']*0.95):
            # try refresh token if it expire or soon expire
            if token_age > token['refresh_expires_in']:
                # refresh token expired.
                # Logout any user and return none
                keycloak_logout()
                return False

            kc = get_keycloak_client()
            token = kc.refresh_token(token['refresh_token'])
            print(f'refreshing token to get \n\n{token}')
            session['_user_token'] = trim_keycloak_token(token)
            session['_token_time'] = now().timestamp()
        return True
    return False


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
        return None
    # token has keys: access_token, refresh_token, id_token, session_state, scope
    login_time = now()
    user_info = keycloak_openid.userinfo(token['access_token'])
    user = User.query.filter_by(email=user_info.get('email', '@fake-email')).first()
    user.last_login_at = login_time
    user.failed_login_count = 0
    # ToDo: remove this before production??
    if user.user_uuid is None:
        user.user_uuid = user_info['sub']
    # /this
    db.session.commit()    
    session_token = trim_keycloak_token(token)
    session['_user_token'] = session_token
    session['_token_time'] = login_time.timestamp()
    login_user(user)
    return user_info

def keycloak_logout():
    '''Logout user and delete custom session values'''
    session.pop('_user_token', None)
    session.pop('_token_time', None)
    logout_user()

def create_keycloak_user(new_user):
    '''
    Creates a user in keycloak using the admin account then returns a
    dict with user details as returned by the login 
    '''
    return True