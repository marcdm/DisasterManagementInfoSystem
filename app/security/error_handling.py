"""
Error Handling and Logging Configuration for DMIS
Provides production-safe error pages and comprehensive server-side logging
"""
import logging
import sys
from flask import render_template, request
from werkzeug.exceptions import HTTPException


def configure_logging(app):
    """
    Configure application logging for production and development
    
    In production (DEBUG=False):
    - Errors logged to stderr and optionally to file
    - Detailed stack traces logged server-side only
    - Never shown to users
    
    In development (DEBUG=True):
    - Errors shown in browser with stack traces
    - Also logged to console
    
    Args:
        app: Flask application instance
    """
    if not app.debug and not app.testing:
        if app.config.get('LOG_TO_STDOUT'):
            stream_handler = logging.StreamHandler(sys.stdout)
            stream_handler.setLevel(logging.INFO)
        else:
            stream_handler = logging.StreamHandler(sys.stderr)
            stream_handler.setLevel(logging.ERROR)
        
        formatter = logging.Formatter(
            '[%(asctime)s] %(levelname)s in %(module)s: %(message)s'
        )
        stream_handler.setFormatter(formatter)
        
        app.logger.addHandler(stream_handler)
        app.logger.setLevel(logging.INFO)
        
        app.logger.info('DMIS application startup (Production Mode)')
    else:
        app.logger.info('DMIS application startup (Development Mode)')


def register_error_handlers(app):
    """
    Register global error handlers for common HTTP errors
    
    Provides user-friendly error pages that hide technical details
    while logging full error information server-side.
    
    Error handlers registered:
    - 400 Bad Request
    - 403 Forbidden
    - 404 Not Found
    - 405 Method Not Allowed
    - 500 Internal Server Error
    - Generic exception handler
    
    Args:
        app: Flask application instance
    """
    
    @app.errorhandler(400)
    def bad_request_error(error):
        """Handle 400 Bad Request errors"""
        app.logger.warning(f'Bad Request: {request.url} - {error}')
        return render_template('errors/400.html'), 400
    
    @app.errorhandler(403)
    def forbidden_error(error):
        """Handle 403 Forbidden errors"""
        app.logger.warning(f'Forbidden Access: {request.url} - User: {getattr(request, "user", "Anonymous")}')
        return render_template('errors/403.html'), 403
    
    @app.errorhandler(404)
    def not_found_error(error):
        """Handle 404 Not Found errors"""
        app.logger.warning(f'Page Not Found: {request.url}')
        return render_template('errors/404.html'), 404
    
    @app.errorhandler(405)
    def method_not_allowed_error(error):
        """Handle 405 Method Not Allowed errors"""
        app.logger.warning(f'Method Not Allowed: {request.method} {request.url}')
        return render_template('errors/405.html'), 405
    
    @app.errorhandler(500)
    def internal_error(error):
        """
        Handle 500 Internal Server Error
        
        Critical: Logs full stack trace server-side
        Shows generic error page to users
        """
        app.logger.error(f'Internal Server Error: {request.url}', exc_info=True)
        
        from app.db import db
        try:
            db.session.rollback()
        except Exception:
            pass
        
        return render_template('errors/500.html'), 500
    
    @app.errorhandler(Exception)
    def handle_exception(error):
        """
        Global exception handler for uncaught exceptions
        
        Logs detailed error information server-side
        Returns appropriate error page based on exception type
        
        Args:
            error: Exception instance
            
        Returns:
            Tuple of (error template, HTTP status code)
        """
        if isinstance(error, HTTPException):
            app.logger.warning(f'HTTP Exception: {error.code} - {request.url}')
            return error
        
        app.logger.error(
            f'Unhandled Exception: {request.url}\n'
            f'Exception Type: {type(error).__name__}\n'
            f'Exception Message: {str(error)}',
            exc_info=True
        )
        
        from app.db import db
        try:
            db.session.rollback()
        except Exception:
            pass
        
        return render_template('errors/500.html'), 500


def init_error_handling(app):
    """
    Initialize error handling and logging for Flask application
    
    Sets up:
    1. Production-safe logging configuration
    2. Global error handlers for all HTTP error codes
    3. Generic exception handler for uncaught errors
    
    In production (DEBUG=False):
    - Users see friendly error pages
    - Technical details logged server-side only
    - Database rollback on errors
    
    In development (DEBUG=True):
    - Flask's default debug page with stack traces
    - Errors also logged to console
    
    Args:
        app: Flask application instance
    """
    configure_logging(app)
    register_error_handlers(app)
    
    app.logger.info(f'Error handling initialized (DEBUG={app.debug})')
