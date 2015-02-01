(function($) {
    jQuery.fn.exists = function() {
        return jQuery(this).length;
    };

    //	Phone Mask
    $(function() {
        if (!is_mobile()) {
            // form .form_contacts
            if ($('#user_phone').exists()) {
                $('#user_phone').each(function() {
                    $(this).mask("+7(999) 999-99-99");
                });
                $('#user_phone')
                        .addClass('rfield')
                        .removeAttr('required')
                        .removeAttr('pattern')
                        .removeAttr('title')
                        .attr({'placeholder': '+7(___) ___ __ __'});
            }
            // form .form_footer
            if ($('#user_phone2').exists()) {
                $('#user_phone2').each(function() {
                    $(this).mask("+7(999) 999-99-99");
                });
                $('#user_phone2')
                        .addClass('rfield')
                        .removeAttr('required')
                        .removeAttr('pattern')
                        .removeAttr('title')
                        .attr({'placeholder': '+7(___) ___ __ __'});
            }

            //form .form_phone
            if ($('#user_phone3').exists()) {
                $('#user_phone3').each(function() {
                    $(this).mask("+7(999) 999-99-99");
                });
                $('#user_phone3')
                        .addClass('rfield')
                        .removeAttr('required')
                        .removeAttr('pattern')
                        .removeAttr('title')
                        .attr({'placeholder': '+7(___) ___ __ __'});
            }

            //form .form_uslugi
            if ($('#user_phone4').exists()) {
                $('#user_phone4').each(function() {
                    $(this).mask("+7(999) 999-99-99");
                });
                $('#user_phone4')
                        .addClass('rfield')
                        .removeAttr('required')
                        .removeAttr('pattern')
                        .removeAttr('title')
                        .attr({'placeholder': '+7(___) ___ __ __'});
            }

            if ($('#user_phone5').exists()) {
                $('#user_phone5').each(function() {
                    $(this).mask("+7(999) 999-99-99");
                });
                $('#user_phone5')
                        .addClass('rfield')
                        .removeAttr('required')
                        .removeAttr('pattern')
                        .removeAttr('title')
                        .attr({'placeholder': '+7(___) ___ __ __'});
            }

            if ($('#user_phone6').exists()) {
                $('#user_phone6').each(function() {
                    $(this).mask("+7(999) 999-99-99");
                });
                $('#user_phone6')
                        .addClass('rfield')
                        .removeAttr('required')
                        .removeAttr('pattern')
                        .removeAttr('title')
                        .attr({'placeholder': '+7(___) ___ __ __'});
            }

            if ($('#user_phone7').exists()) {
                $('#user_phone7').each(function() {
                    $(this).mask("+7(999) 999-99-99");
                });
                $('#user_phone7')
                        .addClass('rfield')
                        .removeAttr('required')
                        .removeAttr('pattern')
                        .removeAttr('title')
                        .attr({'placeholder': '+7(___) ___ __ __'});
            }

            if ($('#user_phone8').exists()) {
                $('#user_phone8').each(function() {
                    $(this).mask("+7(999) 999-99-99");
                });
                $('#user_phone8')
                        .addClass('rfield')
                        .removeAttr('required')
                        .removeAttr('pattern')
                        .removeAttr('title')
                        .attr({'placeholder': '+7(___) ___ __ __'});
            }
        }

    });

})(jQuery);