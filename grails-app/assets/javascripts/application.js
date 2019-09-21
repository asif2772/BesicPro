
//= require jquery.min
//= require bootstrap.min
//= require bootstrap-timepicker
//= requirebootstrap-timepicker.min
//= require_tree .
//= require_self


if (typeof jQuery !== 'undefined') {
    (function($) {
        $('#spinner').ajaxStart(function() {
            $(this).fadeIn();
        }).ajaxStop(function() {
            $(this).fadeOut();
        });
    })(jQuery);
}

