import os
from dotenv import load_dotenv

load_dotenv()


_keycloak = {
    'realm': os.getenv('KEYCLOAK_REALM', 'drims'),
    'server_url': os.getenv('KEYCLOAK_AUTH_SERVER_URL', 'http://localhost:8082'),
    'client_id': os.getenv('KEYCLOAK_CLIENT_ID','drims-web'),
    'client_secret': os.getenv('KEYCLOAK_CREDENTIALS_SECRET'),
    'admin_client': os.getenv('KEYCLOAK_ADMIN_CLI_ID', 'drims-web-admin'),
    'admin_secret': os.getenv('KEYCLOAK_ADMIN_CLI_SECRET', 'drims-web-admin-secret'),
    'metadata_url': '/realms/%(realm)s/.well-known/openid-configuration',
    'logout_url': '',
    'token_url': '/realms/%(realm)s/protocol/openid-connect/token'
}
_keycloak.update(
    metadata_url='%(server_url)s/realms/%(realm)s/.well-known/openid-configuration' % _keycloak,
)


class Config:
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'dev-secret-key-change-in-production'
    DATABASE_URL = os.environ.get('DATABASE_URL')
    SQLALCHEMY_DATABASE_URI = DATABASE_URL
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    WORKFLOW_MODE = os.environ.get('WORKFLOW_MODE', 'AIDMGMT')
    
    TIMEZONE = 'America/Jamaica'
    TIMEZONE_OFFSET = -5
    
    GOJ_GREEN = '#006B3E'
    GOJ_GOLD = '#FFD100'
    
    MAX_CONTENT_LENGTH = 16 * 1024 * 1024    
    KEYCLOAK_REG = {
        'client_id': _keycloak['client_id'],
        'client_secret': _keycloak['client_secret'],
        'server_metadata_url': _keycloak['metadata_url'],
        'client_kwargs':{'scope': 'openid profile email'}
    }
