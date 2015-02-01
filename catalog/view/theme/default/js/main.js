$(document).ready(function() {
    // popup Usluga
    $(".time_c_button").click(function(event) {
        event.preventDefault();
        $(".popupOverlay").css('display', 'block');
        $(".popupUsluga").css('display', 'block');
    })
    $(".popupOverlay").click(function() {
        $(this).css('display', 'none');
        $('.popupUsluga').css('display', 'none');
    })
    $(".popupClose").click(function() {
        $(".popupUsluga").css('display', 'none');
        $(".popupOverlay").css('display', 'none');
    })

    // popup Success
    $(".popupOverlay").click(function() {
        $(this).css('display', 'none');
        $('.popupSuccess').css('display', 'none');
    });
    $(".popupClose").click(function() {
        $(".popupSuccess").css('display', 'none');
        $(".popupOverlay").css('display', 'none');
    });

    // popup Usluga (END)

    // popup heder
    $(".show_popup").click(function(event) {
        event.preventDefault();
        $(".popupOverlay").css('display', 'block');
        $(".popupMain").css('display', 'block');
    })
    $(".popupOverlay").click(function() {
        $(this).css('display', 'none');
        $('.popupMain').css('display', 'none');
    })
    $(".popupClose").click(function() {
        $(".popupMain").css('display', 'none');
        $(".popupOverlay").css('display', 'none');
    })
    // popup heder (END)

    // input placeholder 
    $(function() {
        $('input[placeholder]').placeholder();
    });
    // input placeholder (END)

    $('.popupSentSubmit').click(function(e) {
        e.preventDefault();
        var error = true;

        if ($('.contact-name').val().length > 3) {
            $('.contact-name').css({'border': '1px solid #4aace8'});
            error = true;
        } else {
            $('.contact-name').css({'border': '1px solid red'});
            error = false;
        }
        ///
        if ($('.contact-telephone').val().length > 3) {
            $('.contact-telephone').css({'border': '1px solid #4aace8'});
        } else {
            $('.contact-telephone').css({'border': '1px solid red'});
            error = false;
        }
        ///
        if ($('.contact-time').val().length > 3) {
            $('.contact-time').css({'border': '1px solid #4aace8'});
        } else {
            $('.contact-time').css({'border': '1px solid red'});
            error = false;
        }

        if (error) {
            $.ajax({
                url: 'index.php?route=product/product/sentformemail',
                type: 'post',
                data: {p: $('.contact-name').val(), p1: $('.contact-telephone').val(), p2: $('.contact-time').val()},
                dataType: 'json',
                success: function(json) {

                }
            });
        }
    });

    // form contacts

    function IsEmail(email) {
        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        return regex.test(email);
    }

    $('#sendContacts').click(function() {
        var name = $('.form_contacts input[name="name"]');
        var mail = $('.form_contacts input[name="mail"]');
        var phone = $('.form_contacts input[name="phone"]');
        var comment = $('.form_contacts textarea[name="comment"]');

        var error = true;

        if (name.val().length >= 2 && name.val().length <= 40) {
            name.css({'border': '1px solid  #4aace8'});
        } else {
            name.css({'border': '1px solid red'});
            error = false;  
        }

        if (IsEmail(mail.val())) {
            mail.css({'border': '1px solid  #4aace8'});
        } else {
            mail.css({'border': '1px solid red'});
            error = false;   
        }

        if (phone.val().length >= 5) {
            phone.css({'border': '1px solid  #4aace8'});
        } else {
            phone.css({'border': '1px solid red'});
            error = false;   
        }


        if (comment.val().length >= 2 && comment.val().length <= 256) {
            comment.css({'border': '1px solid  #4aace8'});
        } else {
            comment.css({'border': '1px solid red'});
            error = false;   
        }

        // send ajax
        if (error) {
            $.ajax({
                url: 'index.php?route=information/contact/sendMail',
                type: 'post',
                data: $('.form_contacts').serialize(),
                dataType: 'json',
                success: function(json) {
                    name.val("");
                    mail.val("");
                    phone.val("");
                    comment.val("");
                    $('.popupSuccess, .popupOverlay').show();
                    $('.popupSuccess .popupTitle').html("Отправлено");
                    $('.popupSuccess .popupDescr').html("Ваше сообщение отправлено");
                }
            });
        }
    });


    // form home callback

    $('#form_callback').click(function() {
        var name = $('.form_contacts input[name="name"]');
        var mail = $('.form_contacts input[name="mail"]');
        var phone = $('.form_contacts input[name="phone"]');
        var comment = $('.form_contacts textarea[name="comment"]');

        var error = true;

        if (name.val().length >= 2 && name.val().length <= 100) {
            name.css({'border': '1px solid  #4aace8'});
        } else {
            //alert('Некоректное количество символов в поле "Ваше имя" ');
            name.css({'border': '1px solid red'});
            error = false;  
        }

        if (IsEmail(mail.val())) {
            mail.css({'border': '1px solid  #4aace8'});
        } else {
            mail.css({'border': '1px solid red'});
            error = false;   
        }

        if (phone.val().length >= 5) {
            phone.css({'border': '1px solid  #4aace8'});
        } else {
            phone.css({'border': '1px solid red'});
            error = false;   
        }


        if (comment.val().length >= 2 && comment.val().length <= 256) {
            comment.css({'border': '1px solid  #4aace8'});
        } else {
            comment.css({'border': '1px solid red'});
            error = false;   
        }

        // send ajax
        if (error) {
            $.ajax({
                url: 'index.php?route=information/contact/sendMail',
                type: 'post',
                data: $('.form_contacts').serialize(),
                dataType: 'json',
                success: function(json) {
                    name.val("");
                    mail.val("");
                    phone.val("");
                    comment.val("");


                    $('.popupSuccess, .popupOverlay').show();
                    $('.popupSuccess .popupTitle').html("Отправлено");
                    $('.popupSuccess .popupDescr').html("Ваш комментарий успешно отправлен");
                }
            });
        }

    });

    //form footer

    $('#form_footer').click(function(e) {
        e.preventDefault();
        var name = $('.form_footer input[name="name"]');
        var mail = $('.form_footer input[name="mail"]');
        var phone = $('.form_footer input[name="phone"]');
        var comment = $('.form_footer input[name="comment"]');
        var check = $('.form_footer input[name="check"]');

        var error = true;

        if (name.val().length >= 2 && name.val().length <= 100) {
            name.css({'border': '1px solid  #4aace8'});
        } else {
            //alert('Некоректное количество символов в поле "Ваше имя" ');
            name.css({'border': '1px solid red'});
            error = false;  
        }

        if (IsEmail(mail.val())) {
            mail.css({'border': '1px solid  #4aace8'});
        } else {
            mail.css({'border': '1px solid red'});
            error = false;   
        }

        if (phone.val().length >= 5) {
            phone.css({'border': '1px solid  #4aace8'});
        } else {
            phone.css({'border': '1px solid red'});
            error = false;   
        }


        // send ajax
        if (error) {
            $.ajax({
                url: 'index.php?route=information/contact/sendMailFooter',
                type: 'post',
                data: $('.form_footer').serialize(),
                dataType: 'json',
                success: function(json) {
                    name.val("");
                    mail.val("");
                    phone.val("");
                    comment.val("");
                    check.val("");
                    $('.popupSuccess, .popupOverlay').show();
                    $('.popupSuccess .popupTitle').html("Отправлено");
                    $('.popupSuccess .popupDescr').html("Ваш запрос успешно отправлен");
                }
            });
        }

    });

    // form home phone

    $('#form_phone').click(function() {
        var name = $('.form_phone input[name="name"]');
        var phone = $('.form_phone input[name="phone"]');

        var error = true;

        if (name.val().length >= 2 && name.val().length <= 100) {
            name.css({'border': '1px solid  #4aace8'});
        } else {
            //alert('Некоректное количество символов в поле "Ваше имя" ');
            name.css({'border': '1px solid red'});
            error = false;  
        }

        if (phone.val().length >= 5) {
            phone.css({'border': '1px solid  #4aace8'});
        } else {
            phone.css({'border': '1px solid red'});
            error = false;   
        }


        // send ajax
        if (error) {
            $.ajax({
                url: 'index.php?route=information/contact/sendPhone',
                type: 'post',
                data: $('.form_phone').serialize(),
                dataType: 'json',
                success: function(json) {
                    name.val("");
                    phone.val("");
                    $('.popupSuccess, .popupOverlay').show();
                    $('.popupSuccess .popupTitle').html("Отправлено");
                    $('.popupSuccess .popupDescr').html("В ближайшие мы с вами свяжемся");
                }
            });
        }

    });

    //form uslugi

    $('#sendUsluga').click(function() {
        var name = $('.form_contacts input[name="name"]');
        var mail = $('.form_contacts input[name="mail"]');
        var phone = $('.form_contacts input[name="phone"]');
        var comment = $('.form_contacts textarea[name="comment"]');

        var error = true;

        if (name.val().length >= 2 && name.val().length <= 40) {
            name.css({'border': '1px solid  #4aace8'});
        } else {
            name.css({'border': '1px solid red'});
            error = false;  
        }

        if (IsEmail(mail.val())) {
            mail.css({'border': '1px solid  #4aace8'});
        } else {
            mail.css({'border': '1px solid red'});
            error = false;   
        }

        if (phone.val().length >= 5) {
            phone.css({'border': '1px solid  #4aace8'});
        } else {
            phone.css({'border': '1px solid red'});
            error = false;   
        }


        if (comment.val().length >= 2 && comment.val().length <= 256) {
            comment.css({'border': '1px solid  #4aace8'});
        } else {
            comment.css({'border': '1px solid red'});
            error = false;   
        }

        // send ajax
        if (error) {
            $.ajax({
                url: 'index.php?route=information/contact/sendMail',
                type: 'post',
                data: $('.form_contacts').serialize(),
                dataType: 'json',
                success: function(json) {
                    name.val("");
                    mail.val("");
                    phone.val("");
                    comment.val("");

                    $('.popupSuccess, .popupOverlay').show();
                    $('.popupSuccess .popupTitle').html("Отправлено");
                    $('.popupSuccess .popupDescr').html("Ваш комментарий успешно отправлен");
                }
            });
        }

    });

    // form returnCall

    $('#returnCall').click(function() {
        var name = $('.form_call input[name="name"]');
        var mail = $('.form_call input[name="mail"]');
        var phone = $('.form_call input[name="phone"]');
        var check1 = $('.form_call input[name="check1"]');
        var check2 = $('.form_call input[name="check2"]');
        var check3 = $('.form_call input[name="check3"]');
        var check4 = $('.form_call input[name="check4"]');


        var error = true;

        if (name.val().length >= 2 && name.val().length <= 40) {
            name.css({'border': '1px solid  #4aace8'});
        } else {
            name.css({'border': '1px solid red'});
            error = false;  
        }

        if (IsEmail(mail.val())) {
            mail.css({'border': '1px solid  #4aace8'});
        } else {
            mail.css({'border': '1px solid red'});
            error = false;   
        }

        if (phone.val().length >= 5) {
            phone.css({'border': '1px solid  #4aace8'});
        } else {
            phone.css({'border': '1px solid red'});
            error = false;   
        }

        if (check1.prop('checked') || check2.prop('checked') || check3.prop('checked') || check4.prop('checked')) {
            $('.error_u').css({'display':'none'});
        } else {
            $('.error_u').css({'display':'block'});
            error = false;
        }

        // send ajax
        if (error) {
            $.ajax({
                url: 'index.php?route=information/contact/sendMailCall',
                type: 'post',
                data: $('.form_call').serialize(),
                dataType: 'json',
                success: function(json) {
                    name.val("");
                    mail.val("");
                    phone.val("");
                    check1.val("");
                    check2.val("");
                    check3.val("");
                    check4.val("");
                    $('.popupUsluga').hide();
                    $('.popupSuccess, .popupOverlay').show();
                    $('.popupSuccess .popupTitle').html("Отправлено");
                    $('.popupSuccess .popupDescr').html("Ваша заявка успешно отправлена");
                }
            });
        }

    });

    // form faq

    $('#sendFAQ').click(function() {
        var name = $('.form_contacts input[name="name"]');
        var mail = $('.form_contacts input[name="mail"]');
        var phone = $('.form_contacts input[name="phone"]');
        var comment = $('.form_contacts textarea[name="comment"]');

        var error = true;

        if (name.val().length >= 2 && name.val().length <= 100) {
            name.css({'border': '1px solid  #4aace8'});
        } else {
            name.css({'border': '1px solid red'});
            error = false;  
        }

        if (IsEmail(mail.val())) {
            mail.css({'border': '1px solid  #4aace8'});
        } else {
            mail.css({'border': '1px solid red'});
            error = false;   
        }

        if (phone.val().length >= 5) {
            phone.css({'border': '1px solid  #4aace8'});
        } else {
            phone.css({'border': '1px solid red'});
            error = false;   
        }


        if (comment.val().length >= 2 && comment.val().length <= 256) {
            comment.css({'border': '1px solid  #4aace8'});
        } else {
            comment.css({'border': '1px solid red'});
            error = false;   
        }

        // send ajax
        if (error) {
            $.ajax({
                url: 'index.php?route=information/contact/sendMail',
                type: 'post',
                data: $('.form_contacts').serialize(),
                dataType: 'json',
                success: function(json) {
                    name.val("");
                    mail.val("");
                    phone.val("");
                    comment.val("");
                    $('.popupSuccess, .popupOverlay').show();
                    $('.popupSuccess  .popupTitle').html("Отправлено");
                    $('.popupSuccess  .popupDescr').html("Ваш комментарий успешно отправлен");
                }
            });
        }

    });

    // form Jobs

    $('#sendJobs').click(function() {
        var name = $('.form_contacts input[name="name"]');
        var mail = $('.form_contacts input[name="mail"]');
        var phone = $('.form_contacts input[name="phone"]');
        var comment = $('.form_contacts textarea[name="comment"]');

        var error = true;

        if (name.val().length >= 2 && name.val().length <= 100) {
            name.css({'border': '1px solid  #4aace8'});
        } else {
            name.css({'border': '1px solid red'});
            error = false;  
        }

        if (IsEmail(mail.val())) {
            mail.css({'border': '1px solid  #4aace8'});
        } else {
            mail.css({'border': '1px solid red'});
            error = false;   
        }

        if (phone.val().length >= 5) {
            phone.css({'border': '1px solid  #4aace8'});
        } else {
            phone.css({'border': '1px solid red'});
            error = false;   
        }


        if (comment.val().length >= 2 && comment.val().length <= 256) {
            comment.css({'border': '1px solid  #4aace8'});
        } else {
            comment.css({'border': '1px solid red'});
            error = false;   
        }

        // send ajax
        if (error) {
            $.ajax({
                url: 'index.php?route=information/contact/sendMail',
                type: 'post',
                data: $('.form_contacts').serialize(),
                dataType: 'json',
                success: function(json) {
                    name.val("");
                    mail.val("");
                    phone.val("");
                    comment.val("");
                    $('.popupSuccess, .popupOverlay').show();
                    $('.popupSuccess  .popupTitle').html("Отправлено");
                    $('.popupSuccess  .popupDescr').html("Ваш комментарий успешно отправлен");
                }
            });
        }

    });

    // form header

    $('#callHeader').click(function() {
        var name = $('.form_call_header input[name="name"]');
        var phone = $('.form_call_header input[name="phone"]');
        var time = $('.form_call_header input[name="time"]');

        var error = true;

        if (name.val().length >= 2 && name.val().length <= 100) {
            name.css({'border': '1px solid  #4aace8'});
        } else {
            name.css({'border': '1px solid red'});
            error = false;  
        }

        if (phone.val().length >= 5) {
            phone.css({'border': '1px solid  #4aace8'});
        } else {
            phone.css({'border': '1px solid red'});
            error = false;   
        }

        if (time.val().length >= 2) {
            time.css({'border': '1px solid  #4aace8'});
        } else {
            time.css({'border': '1px solid red'});
            error = false;   
        }


        // send ajax
        if (error) {
            $.ajax({
                url: 'index.php?route=information/contact/sendMailCallHeader',
                type: 'post',
                data: $('.form_call_header').serialize(),
                dataType: 'json',
                success: function(json) {
                    name.val("");
                    phone.val("");
                    time.val("");
                    $('.popupMain').hide();
                    $('.popupSuccess, .popupOverlay').show();
                    $('.popupSuccess .popupTitle').html("Отправлено");
                    $('.popupSuccess .popupDescr').html("Ваша заявка отправлена");
                }
            });
        }

    });



});
$(document).ready(function () {
    var time;
    var url = document.location.href;

    $('header .left_phone').hover(function () {
        time = setTimeout(function () {
            yaCounter20762257.reachGoal('header_read_phone');
            },
            2000);
        },
        function () {
            clearTimeout(time);
    })
    $('header .contact').hover(function () {
        time = setTimeout(function () {
            yaCounter20762257.reachGoal('header_read_contact');
            },
            2000);
        },
        function () {
            clearTimeout(time);
    })
    
});