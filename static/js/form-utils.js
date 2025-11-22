/**
 * Form Utilities - CSP-compliant event handlers
 * Common patterns for auto-submit, confirmations, print, etc.
 */

document.addEventListener('DOMContentLoaded', function() {
    
    // Auto-submit forms when select changes
    const autoSubmitSelects = document.querySelectorAll('select[data-auto-submit="true"]');
    autoSubmitSelects.forEach(function(select) {
        select.addEventListener('change', function() {
            this.form.submit();
        });
    });
    
    // Print buttons
    const printButtons = document.querySelectorAll('[data-action="print"]');
    printButtons.forEach(function(btn) {
        btn.addEventListener('click', function() {
            window.print();
        });
    });
    
    // Confirmation dialogs for forms
    const confirmForms = document.querySelectorAll('form[data-confirm]');
    confirmForms.forEach(function(form) {
        form.addEventListener('submit', function(e) {
            const message = this.dataset.confirm;
            if (!confirm(message)) {
                e.preventDefault();
                return false;
            }
        });
    });
    
    // Confirmation dialogs for buttons
    const confirmButtons = document.querySelectorAll('[data-confirm]');
    confirmButtons.forEach(function(btn) {
        // Skip forms (handled above)
        if (btn.tagName === 'FORM') return;
        
        btn.addEventListener('click', function(e) {
            const message = this.dataset.confirm;
            if (!confirm(message)) {
                e.preventDefault();
                return false;
            }
        });
    });
});
