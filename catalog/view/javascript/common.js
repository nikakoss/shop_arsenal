var banner = function(id) {
    $('#banner' + id).after('<div id="banner_nav' + id + '" class="nav-buttons clearfix">').cycle({
        pause: true,
        before: function(current, next) {
            $(next).parent().height($(next).outerHeight());
        },
        pager: '#banner_nav' + id,
        pauseOnPagerHover: true,
    });

}

var btn_category_list = function() {
    location = '/';
}
var change_quantity = function(input_object, action) {
    var count = input_object.val();
    if (action == '+') {
        count++;
    }
    else {
        if (count > 1) {
            count--;
        }
    }
    input_object.val(count);
}

$(document).ready(function() {
    
    $('.addToWishList').live('click',function(){         
         $(this).html('В избранном');
     });

     $('.addToCompare').live('click',function(){         
         $(this).html('Добавлен к сравнению');
     }); 
	 
	 $('.deleteWishAll').live('click',function(){         
         $('.tovar').each(function(){
                $(this).remove();
            });
     }); 
    
    // рейтинг клик
    $('.rait_cl').live('click', function(e) {
        e.preventDefault();
        $("#tabs a").removeClass('selected');
        $(".description .description-content").hide();
        $("#tab-review").show();
        $("#tabs-review").addClass('selected');
        $('html, body').animate({
            scrollTop: $("#tabs-review").offset().top - 100
        }, 1000);
    });
    /* Scroll */

    $(".more").click(function(e) {
        e.preventDefault();
        $('html, body').animate({
            scrollTop: $("#decriptions").offset().top - 100
        }, 1000);
    });

    $(".reviews").live('click', function(e) {
        e.preventDefault();
        $("#tabs a").removeClass('selected');
        $(".description .description-content").hide();
        $("#tab-review").show();
        $("#tabs-review").addClass('selected');
        $('html, body').animate({
            scrollTop: $("#tabs-review").offset().top - 100
        }, 1000);
    });

    $('.button_head').click(function() {
         if($.browser.webkit){
                $('body').stop().animate({scrollTop:0},'slow');
            }else{
                $('html').stop().animate({scrollTop:0},'slow');
            }
    });

    $('#header_top, .top_bg').css({'position': 'fixed'});

    /* Search */	
	$("#search_form").submit(function(e){
		url = $('base').attr('href') + 'index.php?route=product/search';

            var search = $('header input[name=\'search\']').val();

            if (search) {
                url += '&search=' + encodeURIComponent(search);
            }
		location = url;
		return false;		
	});
	
   $('.button-search').bind('click', function() {
        url = $('base').attr('href') + 'index.php?route=product/search';

        var search = $('input[name=\'search\']').attr('value');

        if (search) {
            url += '&search=' + encodeURIComponent(search);
        }

        location = url;
    });


    // IE6 & IE7 Fixes
    if ($.browser.msie) {
        if ($.browser.version <= 6) {
            $('#column-left + #column-right + #content, #column-left + #content').css('margin-left', '195px');

            $('#column-right + #content').css('margin-right', '195px');

            $('.box-category ul li a.active + ul').css('display', 'block');
        }

        if ($.browser.version <= 7) {
            $('#menu > ul > li').bind('mouseover', function() {
                $(this).addClass('active');
            });

            $('#menu > ul > li').bind('mouseout', function() {
                $(this).removeClass('active');
            });
        }
    }

    $('.success img, .warning img, .attention img, .information img').live('click', function() {
        $(this).parent().fadeOut('slow', function() {
            $(this).remove();
        });
    });



    $('.orderAll').live('click', function() {

        var total =parseFloat($('#order_all_count').val());
        var total_sum =parseFloat($('#order_all_total').val());
        if (total == 0) {
            var template = '<div class="popup"><div class="popup-shadow"></div>' +
                    '<form>' +
                    '<div class="popup-container">' +
                    '<div style="min-width: 400px;"><img onclick="$.colorbox.close();" class="x" src="image/kuvalda/x.png" alt=""><h2>Купить в 1 клик</h2>' +
                    '<div><div class="cbContent callback popup-oneclik">' +
                    '<div>Вы не выбрали ни одного товара, добавьте что нибудь </div>' +
                    '</div>' +
                    '</div>' +
                    '</form>' +
                    '</div>';
        } else {

            if (total == 1) {
                total = total + ' товар';
            }
            if (total >= 2 && total <= 4) {
                total = total + ' товарa';
            } else {
                total = total + ' товаров';
            }

            var template = '<div class="popup"><div class="popup-shadow"></div>' +
                    '<form>' +
                    '<div class="popup-container">' +
                    '<div style="min-width: 400px;"><img onclick="$.colorbox.close();" class="x" src="image/kuvalda/x.png" alt=""><h2>Купить в 1 клик</h2>' +
                    '<div><div class="cbContent callback popup-oneclik">' +
                    '<div>В корзине ' + total + ' на сумму: <span>' + total_sum + ' руб</span></div>' +
                    '<p>Оставьте Ваш телефон и мы Вам перезвоним</p></br>' +
                    '<input type="text" class="click_phone" required placeholder="Номер телефона" id="orderPhone" name="phone">' +
                    '<input type="text" required placeholder="Фамилия имя отчество" id="orderName" name="name"><div id="user_phone_error" class="phone_error" ></div><div class="cbbutton"><a class="orderAllsubmit">Отправить</a></div>' +
                    '</div>' +
                    '</div>' +
                    '</form>' +
                    '</div>';
        }
        $.colorbox({html: template})
		$('.click_phone').each(function(){
                $(this).mask("+7(999) 999-99-99");
        });
    });
    //-----------------------------------------------------login---------------------------------------------------
    $('.loginAjax').live('click', function() {
        loginza = $('.loginzaInput').val();
        var template = '<div class="popup"><div class="popup-shadow"></div>' +
                '<form>' +
                '<div class="popup-container loginFrom">' +
                '<div><img onclick="$.colorbox.close();" class="x" src="image/kuvalda/x.png" alt=""><h2>Авторизация</h2>' +
                '<div><div class="cbContent callback popup-oneclik">' +
                '<div visible="hidden" class="divWrongData"><div class="wrongData" id="wrongData"></div></div>' +
                '<input type="text" required placeholder="e-mail" id="userLogin" name="login">' +
                '<input type="password" required placeholder="Пароль" id="userPassword" name="password">' +
                '<div class="loginFormUrl"><a class="forgotPassword">Забыли пароль?</a></div>' +
                '<div class="cbbutton"><a class="loginSubmit">Войти</a></div>' +
                '</div>' +
                '</div>' +
                '</form>' +
                '<div class="loginFormText">У вас нет аккаунта? <a class="showRegistrationForm">Зарегистрируйтесь</a></div>' +
                '<div class="socialFormText" style="color:#6c6c6c">Войти через социальные сети</div><br><br>' +
                '<div style="height:60px;"class="loginzaHref"></div>' +
                '</div>';
        $.colorbox({html: template});
        $('.loginzaHref').html(loginza);
        //---------------check password---------------------
        $('.loginSubmit').live('click', function(e) {
            var userLogin = $('#userLogin').val();
            var userPassword = $('#userPassword').val();
            var erorr = false;
            
            if(userLogin.length < 1) {
                erorr = true;
                $('#userLogin').css({"border":"1px solid red"});
            } else {
                $('#userLogin').css({"border":"1px solid #ccc"});
            }
            
            if(userPassword.length < 1) {
                erorr = true;
                $('#userPassword').css({"border":"1px solid red"});
            } else {
                $('#userPassword').css({"border":"1px solid #ccc"});
            }

            if (!erorr) {
                $.ajax({
                    type: 'post',
                    url: 'index.php?route=account/login/ajaxIndex',
                    data: {'email': userLogin, 'password': userPassword},
                    dataType: 'json',
                    success: function(response) {
                        if (response == true) {
                            window.location.href = '/index.php?route=account/account'
                        }
                        else {
                            alertWrongMessage('wrongData', 500, 3000, 'Неверный логин или пароль!');
                        }

                    }
                });
            }
        });
        //---------------------------------------------------------------------------------------------------
        //--------------------------------------------forgot password----------------------------------------------
        $('.forgotPassword').live('click', function() {
            var template = '<div class="popup"><div class="popup-shadow"></div>' +
                    '<form>' +
                    '<div class="popup-container loginFrom">' +
                    '<div style="min-width: 500px;"><img onclick="$.colorbox.close();" class="x" src="image/kuvalda/x.png" alt=""><h2>Восстановление пароля</h2>' +
                    '<div><div class="cbContent callback popup-oneclik">' +
                    '<div class="" style="color:#6c6c6c">Введите адрес электронной почты Вашей учетной записи.Нажмите кнопку Вперед, чтобы получить пароль по электронной почте.</div>' +
                    '<input type="text" required placeholder="E-Mail:" id="emailInput" name="email">' +
                    '<div class="cbbutton"><a class="resetPasswordSubmit">Вперед</a></div>' +
                    '</div>' +
                    '</div>' +
                    '</form>';
            $.colorbox({html: template});
            $('.resetPasswordSubmit').live('click', function(e) {
                var email = $('#emailInput').val();
                if (email != '') {
                    $.ajax({
                        type: 'post',
                        url: 'index.php?route=account/forgotten/indexAjax',
                        data: {'email': email},
                        dataType: 'json',
                        success: function(response) {
                            if (response == true) {
                                var template = '<div class="popup"><div class="popup-shadow"></div>' +
                                        '<form>' +
                                        '<div class="popup-container loginFrom">' +
                                        '<div style="min-width: 500px;"><img onclick="$.colorbox.close();" class="x" src="image/kuvalda/x.png" alt=""><h2>Восстановление пароля</h2>' +
                                        '<div><div class="cbContent callback popup-oneclik">' +
                                        '<div class="" style="color:#6c6c6c">Новый пароль был выслан на Ваш адрес электронной почты.</div>' +
                                        '</div>' +
                                        '</div>' +
                                        '</form>';
                                $.colorbox({html: template});
                                setTimeout(function() {
                                    $.colorbox.close();
                                }, 2500);
                            } else if (response == false) {
                                var template = '<div class="popup"><div class="popup-shadow"></div>' +
                                        '<form>' +
                                        '<div class="popup-container loginFrom">' +
                                        '<div style="min-width: 500px;"><img onclick="$.colorbox.close();" class="x" src="image/kuvalda/x.png" alt=""><h2>Восстановление пароля</h2>' +
                                        '<div style ="display:block;"class="wrongData">E-Mail не найден, проверьте и попробуйте ещё раз!</div>' +
                                        '<div><div class="cbContent callback popup-oneclik">' +
                                        '<div class="" style="color:#6c6c6c">Введите адрес электронной почты Вашей учетной записи.Нажмите кнопку Вперед, чтобы получить пароль по электронной почте.</div>' +
                                        '<input type="text" required placeholder="E-Mail:" id="emailInput" name="email">' +
                                        '<div class="cbbutton"><a class="resetPasswordSubmit">Вперед</a></div>' +
                                        '</div>' +
                                        '</div>' +
                                        '</form>';
                                $.colorbox({html: template});
                            }
                        }
                    });
                }
            });
        });
    });
    //---------------------------------------------------------------------------------------------------------
    //--------------------------------registration-------------------------------------------------------------
    //----------------------------------temp fez----------------------------
    template1 = '<div class="popup"><div class="popup-shadow"></div>' +
            '<form>' +
            '<div class="popup-container registratioForm">' +
            '<div><img onclick="$.colorbox.close();" class="x" src="image/kuvalda/x.png" alt=""><h2>Регистрация пользователя</h2>' +
            '<div><div class="cbContent callback popup-oneclik">' +
            '<div visible="hidden" class="divWrongData" id ="divWrongData"><div class="wrongData"></div></div>' +
            '<input type="radio" name="browser" class="fuser" value="1" checked=true> Физическое лицо<br>' +
            '<input type="radio" name="browser" class="yuser" value="2"> Юридическое лицо<br><br>' +
            '<input type="text" required placeholder="Email" id="femail" name="email">' +
            '<input type="password" required placeholder="Пароль" id="fpassword" name="">' +
            '<input type="password" required placeholder="Ещё раз введите пароль" id="dbfpassword" name="">' +
            '<div class="cbbutton"><a class="registration">Зарегистрироваться</a></div>' +
            '</div>' +
            '</div>' +
            '</form>';
    //------------------------------default form----------------------------
    $('.showRegistrationForm').live('click', function() {
        $.colorbox({html: template1});
        $('.fuser').live('click', function() {
            $.colorbox({html: template1});
        });
        $('.yuser').live('click', function() {
            $.colorbox({html: template2});
            
            $('#y_phone').each(function(){
                $(this).mask("+7(999) 999-99-99");
            });
            $('#y_phone')
                .addClass('rfield')
                .removeAttr('required')
                .removeAttr('pattern')
                .removeAttr('title')
                .attr({'placeholder':'+7(___) ___ __ __'});
              });
        
        // valid functions
        var error=false;
        
        function IsEmail(email) {
            var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            return regex.test(email);
        }
        function FormError(id){
            $(id).css({"border":"1px solid red"});
            return error = true;
        }
        
        function FormValid(id){
            $(id).css({"border":"1px solid #ccc"});
            return error = false;
        }
        
        function LengthField(c,l){
            return ($(c).val().length>=l);
        }
        
        function ValidPass(pas1,pas2){
            return password != dbpassword;
        }
        
        //----------------------------------ajax fez--------------------------------
        $('.registration').live('click', function(e) {
            var emailF = $('#femail').val();
            var password = $('#fpassword').val();
            var dbpassword = $('#dbfpassword').val();
            
            var  e_email=(IsEmail(emailF))? FormValid('#femail') : FormError('#femail');

             if (password.length < 6) {
                FormError('#fpassword');        FormError('#dbfpassword');
             } else if (password != dbpassword ) {
                 FormError('#fpassword');       FormError('#dbfpassword');
             }else{
                 FormValid('#fpassword');       FormValid('#dbfpassword');
             }
             if(!e_email && !error) {    
                $.ajax({
                    type: 'post',
                    url: 'index.php?route=account/register/indexAjax',
                    data: {'email': emailF, 'password': password},
                    dataType: 'json',
                    success: function(response) {
                        if (response == true) {
                            var template = '<div class="popup"><div class="popup-shadow"></div>' +
                                    '<form>' +
                                    '<div class="popup-container loginFrom">' +
                                    '<div style="min-width: 500px;"><h2>Ваша учётная запись создана!</h2>' +
                                    '<div><div class="cbContent callback popup-oneclik">' +
                                    '<div class="" style="color:#6c6c6c">Поздравляем! Ваша учетная запись успешно создана.<br>Теперь Вы можете воспользоваться дополнительными возможностями Личного Кабинета: просмотр истории заказов, печать счета и др.</div>' +
                                    '</div>' +
                                    '</div>' +
                                    '</form>';
                            $.colorbox({html: template});
                            $('.wrongData').fadeIn(500);
                            setTimeout(function() {
                                $.colorbox.close();
                                $.ajax({
                                        type: 'post',
                                        url: 'index.php?route=account/login/ajaxIndex',
                                        data: {'email': emailF, 'password': password},
                                        dataType: 'json',
                                        success: function(response) {
                                            if (response == true) {
                                                window.location.href = '/index.php?route=account/account'
                                            }
                                        }
                                    });
                            }, 1500);
                        }
                        if (response == false) {
                            alertWrongMessage('wrongData', 500, 3000, 'Пользователь с данным емейлом уже существует!');
                        }
                    }
                });
            }
        });
        //----------------------------------temp yur----------------------------
        template2 = '<div class="popup"><div class="popup-shadow"></div>' +
                '<form id=regForm>' +
                '<div class="popup-container registrationYuridF">' +
                '<div style="min-width: 100px;"><img onclick="$.colorbox.close();" class="x" src="image/kuvalda/x.png" alt=""><h2>Регистрация пользователя</h2>' +
                '<div><div class="cbContent callback popup-oneclik">' +
                '<div visible="hidden" class="divWrongData"><div class="wrongData"></div></div>' +
                '<input type="radio" class="fuser" value="1"> Физическое лицо<br>' +
                '<input type="radio" class="yuser" value="2" checked=true> Юридическое лицо<br><br><div class="yuridFL">' +
                '<input style="height:10px;" type="text" required id="y_email" placeholder="E-Mail:" name="y_email"><br>' +
                '<input style="height:10px;" type="password" required id="y_password" placeholder="Пароль" name="y_password"><br>' +
                '<input style="height:10px;" type="password" required id="y_dpassword" placeholder="Ещё раз введите пароль"><br>' +
                '<input style="height:10px;" type="text" required id="y_organization_name" placeholder="Название организации" name="y_organization_name"><br>' +
                '<input style="height:10px;" type="text" required id="y_inn" placeholder="ИНН" name="y_inn"><br>' +
                '<input style="height:10px;" type="text" required id="y_kpp" placeholder="кпп" name="y_kpp"><br></div><div class="yuridFR">' +
                '<input style="height:10px;" type="text" required id="y_cal_account" placeholder="расс счет" name="y_cal_account"><br>' +
                '<input style="height:10px;" type="text" required id="y_bank_details" placeholder="реквизиты банка" name="y_bank_details"><br>' +
                '<input style="height:10px;" type="text" required id="y_y_address" placeholder="Юр адрес" name="y_y_address"><br>' +
                '<input style="height:10px;" type="text" required id="y_f_address" placeholder="факт адрес" name="y_f_address"><br>' +
                '<input style="height:10px;" type="text" required id="y_phone" placeholder="телефоны" name="y_phone"><br>' +
                '<input style="height:10px;" type="text" required id="y_contact_person" placeholder=" конт лицо" name="y_contact_person"><br></div>' +
                '<div class="cbbutton"><a class="registrationY">Зарегистрироваться</a></div>' +
                '</div>' +
                '</div>' +
                '</form>';
        
        
        //----------------------------------ajax yur--------------------------------    
        
        $('.registrationY').live('click', function(e) {
            var email = $('#y_email').val();
            var password = $('#y_password').val();
            var dbpassword = $('#y_dpassword').val();            
            
           var  e_email=(IsEmail(email))? FormValid('#y_email') : FormError('#y_email');
           var  e_organization_name=(LengthField('#y_organization_name',4))? FormValid('#y_organization_name') : FormError('#y_organization_name');
           var  e_y_inn=(LengthField('#y_inn',4))? FormValid('#y_inn') : FormError('#y_inn');
           var  e_y_kpp=(LengthField('#y_kpp',4))? FormValid('#y_kpp') : FormError('#y_kpp');
           var  e_y_cal_account=(LengthField('#y_cal_account',4))? FormValid('#y_cal_account') : FormError('#y_cal_account');
           var  e_y_f_address=(LengthField('#y_f_address',4))? FormValid('#y_f_address') : FormError('#y_f_address');
           
            if (password.length < 6) {
               FormError('#y_password');        FormError('#y_dpassword');
            } else if (password != dbpassword ) {
                FormError('#y_password');       FormError('#y_dpassword');
            }else{
                FormValid('#y_password');       FormValid('#y_dpassword');
            }
            
           
           if(!e_email && !e_organization_name && !e_y_inn && !e_y_kpp && !e_y_cal_account && !e_y_f_address && password == dbpassword){
              var frm = $("#regForm");
                var data = frm.serialize();
                $.ajax({
                    type: 'post',
                    url: 'index.php?route=account/register/indexAjaxY',
                    data: data,
                    dataType: 'json',
                    success: function(response) {
                        if (response == true) {
                            var template = '<div class="popup"><div class="popup-shadow"></div>' +
                                    '<form>' +
                                    '<div class="popup-container loginFrom">' +
                                    '<div style="min-width: 500px;"><h2>Ваша учётная запись создана!</h2>' +
                                    '<div><div class="cbContent callback popup-oneclik">' +
                                    '<div class="" style="color:#6c6c6c">Поздравляем! Ваша учетная запись успешно создана.<br>Теперь Вы можете воспользоваться дополнительными возможностями Личного Кабинета: просмотр истории заказов, печать счета и др.</div>' +
                                    '</div>' +
                                    '</div>' +
                                    '</form>';
                            $.colorbox({html: template});
                            $('.wrongData').fadeIn(500);
                            setTimeout(function() {
                                $.colorbox.close();
                                $.ajax({
                                        type: 'post',
                                        url: 'index.php?route=account/login/ajaxIndex',
                                        data: {'email': email, 'password': password},
                                        dataType: 'json',
                                        success: function(response) {
                                            if (response == true) {
                                                window.location.href = '/index.php?route=account/account'
                                            }
                                        }
                                });
                            }, 1500);
                        }
                        if (response == false) {
                            alertWrongMessage('wrongData', 500, 3000, 'Пользователь с данным емейлом уже существует!');
                        }
                    }
                });
           }            
    
        });
    });
    //---------------------------------------------------------------------------------------------------------
    //--------------------------------------status zakaza-------------------------------------------------------
    $('.cartStatus').live('click', function(e) {
        popMessage = '<div class="popup">' +
                '<div class="popup-shadow"></div>' +
                '<form id="feedback-form"><div class="popup-container" style="min-width: 100px;">' +
                '<img onclick="$.colorbox.close();" class="x" src="image/kuvalda/x.png" alt="">' +
                '<h2>Статус заказа</h2>' +
                '<div class="cbContent callback classStatus">' +
                '<input type="text" placeholder="Ваш Email" x-autocompletetype="name">' +
				'<input type="text" placeholder="Телефон" id="s_phone" x-autocompletetype="name">' +                
                '<input type="text" class="zakaz-nubber" required placeholder="Номер заказа" x-autocompletetype="email">' +
                '</div>' +
                '<div class="cbbutton "><a class="myPointer getStatusInformation">Отправить</div>' +
                '</div></form>' +
                '</div>';
        $.colorbox.close();
        $.colorbox({html: popMessage});
		$('#s_phone').each(function(){
                $(this).mask("+7(999) 999-99-99");
        });
//------------------------------------------------------------------------------
        $('.getStatusInformation').live('click', function(e) {
            var email = $('.classStatus input')[0];
			var phoneInput = $('.classStatus input')[1];
            var number = $('.classStatus input')[2];
            //if (isValidEmail(email.value)) {
            //    email.setAttribute('style', 'border:1px solid #eee;');
            //    error = true;
            //} else {
            //    email.setAttribute('style', 'border:1px solid red;');
            //    error = false;
            //}
			if(phoneInput.value == ''){
			 phone = 'phone';
			}
			else {
			phone = phoneInput.value;
			}
            if (number.value != '') {
                number.setAttribute('style', 'border:1px solid #eee;');
                error = true;
            } else {
                number.setAttribute('style', 'border:1px solid red;');
                error = false;
            }
			if (email.value != '') {
				email.setAttribute('style', 'border:1px solid #eee;');
                error = true;
            } else {
				email.setAttribute('style', 'border:1px solid red;');
                error = false;
            }
            //--------------------------ajax------------------------------------
            if (error) {
                function popUp(message) {
                    popMessage = '<div class="popup">' +
                        '<div class="popup-shadow"></div>' +
                        '<form id="feedback-form"><div class="popup-container" style="min-width: 100px;">' +
                        '<img onclick="$.colorbox.close();" class="x" src="image/kuvalda/x.png" alt="">' +
                        '<h2>сообщение</h2>' +
                        '<div class="cbContent callback">' +
                        '<div><p class="status-cod">'+message+'</p><div>'+
                        '</div>' +
                        '</div></form>' +
                        '</div>';                
                   
                    $.colorbox({html: popMessage,scrolling: false});
                }
                $.ajax({
                    type: 'post',
                    url: 'index.php?route=checkout/cart/ajaxStatus',
                    data: {'email': email.value, 'phone': phone, 'number': number.value},
                    dataType: 'json',
                    success: function(data) {
                        if (data.response.row.name != undefined) {
                            //popUp(data.response.row.name);
                            popUp("Заказа № "+number.value+" - статус "+data.response.row.name+"  , для более подробной информации позвоните по телефону или воспользуйтесь формой обратной связи");
                        }
                        else {
                            popUp('Заказ не найден');
                        }
                    },
                    error: function() {
                        popUp('Заказ не найден');
                    }})
            }
        });
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    });
 //////////////////////////////change password/////////////////////////////////////////////////   
    $('.changePasswordPopUp').live('click', function(e) {
        popMessage = '<div class="popup">' +
                '<div class="popup-shadow"></div>' +
                '<form id="feedback-form"><div class="popup-container" style="min-width: 100px;">' +
                '<img onclick="$.colorbox.close();" class="x" src="image/kuvalda/x.png" alt="">' +
                '<h2>Смена пароля</h2>' +
                '<div class="cbContent callback">' +
                '<input type="text" required placeholder="Пароль:" x-autocompletetype="name">' +
                '<input type="text" required placeholder="Подтвердите пароль:" x-autocompletetype="email">' +
                '</div>' +
                '<div class="cbbutton "><a class="myPointer getStatusInformation">Отправить</div>' +
                '</div></form>' +
                '</div>';
        $.colorbox.close();
        $.colorbox({html: popMessage});
    });
////////////////////////////////////////////////////////////////////////////////
    $('.orderAllsubmit').live('click', function(e) {
        e.preventDefault();
        var orderPhone = $('#orderPhone').val();
        var orderName = $('#orderName').val();
        var error = true;

        if (orderPhone.length < 3) {
            $('#orderPhone').css('border', '1px solid red');
            error = false;
        } else {
            error = true;
            $('#orderPhone').css('border', '1px solid #ccc');
        }

        if (orderName.length < 3) {
            $('#orderName').css('border', '1px solid red');
            error = false;
        } else {
            error = true;
            $('#orderName').css('border', '1px solid #ccc');
        }



        if (error) {
            $.ajax({
                type: 'post',
                url: 'index.php?route=module/oneclick/orderAll',
                data: {'name': orderName, 'phone': orderPhone},
                dataType: 'json',
                beforeSend: function() {

                },
                complete: function() {

                },
                success: function(data) {
					
					$('#cart-total span').html(0);
					$('#cart-total span+span').html('0 руб');
					
                    var template = '<div class="popup"><div class="popup-shadow"></div>' +
                            '<form>' +
                            '<div class="popup-container">' +
                            '<div style="min-width: 400px;"><img onclick="$.colorbox.close();" class="x" src="image/kuvalda/x.png" alt=""><h2>Купить в 1 клик</h2>' +
                            '<div><div class="cbContent callback popup-oneclik">' +
                            '<div>Спасибо за заказ, номер вашего заказа ' + data.order + ', наш менеджер с вами свяжется </div>' +
                            '</div>' +
                            '</div>' +
                            '</form>' +
                            '</div>';

                    $.colorbox({html: template});
                }
            });
        }
    });
     $('#promoButton').live('click', function() {
        if( $('#promoCodeValue').val() != "" ) {
            $('#promoCodeValue').css('border-color',"inherit");
            $.ajax({
                type: 'post',
                url: 'index.php?route=account/account/checkPromoCode',
                data: {'userPromoCode': $('#promoCodeValue').val()},
                dataType: 'json',
                success: function(data) {
                    if (data.success == true){                         
                            popMessage = '<div class="popup">' +
                            '<div class="popup-shadow"></div>' +
                            '<form id="feedback-form"><div class="popup-container" style="min-width: 100px;">' +
                            '<h2>сообщение</h2>' +
                            '<div class="cbContent callback">' +
                            '<div><p class="promo-cod">Поздравляем! Статус изменен до <b>'+data.statusName+'</b></p><div>'+
                            '</div>' +
                            '</div></form>' +
                            '</div>';                               
                            $.colorbox({html: popMessage,height:"150px"});
                            setTimeout(function() {
                                $.colorbox.close();
                                window.location.href = '/index.php?route=account/account';
                            }, 1500);
                    }
                    else {
                       popMessage = '<div class="popup">' +
                        '<div class="popup-shadow"></div>' +
                        '<form id="feedback-form"><div class="popup-container" style="min-width: 100px;">' +
                        '<img onclick="$.colorbox.close();" class="x" src="image/kuvalda/x.png" alt="">' +
                        '<h2>сообщение</h2>' +
                        '<div class="cbContent callback">' +
                        '<div><p class="promo-cod">Недействительный промокод</p><div>'+
                        '</div>' +
                        '</div></form>' +
                        '</div>';
                        $.colorbox({html: popMessage,height:"150px"});
                    }
                    
                }
            })
            }
            else {
            $('#promoCodeValue').css('border-color',"red");
        }
    });   
    

});

function getURLVar(key) {
    var value = [];

    var query = String(document.location).split('?');

    if (query[1]) {
        var part = query[1].split('&');

        for (i = 0; i < part.length; i++) {
            var data = part[i].split('=');

            if (data[0] && data[1]) {
                value[data[0]] = data[1];
            }
        }

        if (value[key]) {
            return value[key];
        } else {
            return '';
        }
    }
}

function roundPlus(x, n) { //x - число, n - количество знаков
	if(isNaN(x) || isNaN(n)) return false;
	var m = Math.pow(10,n);
	return Math.round(x*m)/m;
}


function addToCart(product_id, quantity) {
    //$.colorbox.close();
    quantity = typeof (quantity) != 'undefined' ? quantity : 1;

    $.ajax({
        url: 'index.php?route=checkout/cart/add',
        type: 'post',
        data: 'product_id=' + product_id + '&quantity=' + quantity,
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, .information, .error').remove();

            if (json['redirect']) {
                location = json['redirect'];
            }

            if (json['success']) {
				
				
				$('#order_all_count').val(json['order_all_count']);
                $('#order_all_total').val(json['order_all_total']);
				
                var total_ban = 0;
                function sub(subProducs) {
                    total_ban = subProducs.length;
                    if (subProducs.length > 0) {
                        temp = '<h3>Расходные материалы к этому товару</h3>' +
							'<a href="#" class="ban_sl prevban"></a>'+
							'<a href="#" class="ban_sl nextban"></a>'+ 
                                '<div class="outher-related"><div class="related-items-list clearfix" style="display:block;">'+
                                '<div class="divs clearfix" style="margin-left:0px;">';
                        for (var i = 0; i < subProducs.length; i++) {
                            if (subProducs[i]['thumb'] == false) {
                                subProducs[i]['thumb'] = "image/no_image.jpg"
                            }
                            temp += '<div>' +
                                    '<img src="' + subProducs[i]['thumb'] + '" alt="' + subProducs[i]['name'] + '">' +
                                    '<div class="description-related">' +
                                    '<a href="' + subProducs[i]['href'] + '">' + subProducs[i]['name'] + '</a>' +
                                    '<strong>Цена: <span>' + subProducs[i]['price'] + '</span></strong>' +
                                    '</div>' +
                                    '<button type="button"  class ="myPointer" onclick="addToCart(' + subProducs[i]['product_id'] + ');">В корзину</button>' +
                                    '</div>';
                        }
                        return temp +'</div></div></div>' ;
                        
                    }
                    else {
                        temp = '';
                        return temp;
                    }
                }
                sub(json['success2']['sub_products']);
				//var price_pop = parseFloat(json['success2']['price']);
				//var price_pop_round = price_pop.toFixed(2);
				var unit_price = '';
				var unt = json['success2']['unit'];
 				if(unt == '') {
					unit_price = ''
				} else {
					unit_price = ' за ';
					unit_price += json['success2']['unit'];
					unit_price += '.';
				}
                var template = '<div class="popup product-popup add_product_cart">' +
                        '<div class="popup-shadow"></div>' +
                        '<form action="" class="clearfix">' +
                        '<div class="popup-container cartContainer"><div >' +
                        '<img class="x" onclick="$.colorbox.close();" src="image/kuvalda/x.png"" alt=""><h2>Товар добавлен в корзину</h2>' +
                        '<div class="clearfix product-item">' +
                        '<div class="imgCenter"><img src="' + json['success2']['image'] + '" alt=""></div><div class="cartDescription">' +
                        '<a href="' + json['success2']['url'] + '">' + json['success2']['name'] + '</a>' +
                        '<strong>Цена: <span>' + json['success2']['price'] + unit_price + '</span></strong>' +
                        '<div>В <a href="index.php?route=checkout/simplecheckout">корзине</a> ' + json['total'] + '</div>' +
                        '</div><div class="clr"></div>' +
                        '</div>' +
                        ///////////////////////////sub//////////////////////////                        
                          sub(json['success2']['sub_products']) +
                        ////////////////////////////////////////////////////////
                        '<div class="orderSubmitForms"><a onclick="$.colorbox.close();" class="myPointer checkoutForm">Продожить покупки</a>' +
                        '<a class="orderAll myPointer one-click">Купить в 1 клик </a>' +
                        '<input type="button" class="cartLoacation" value="Оформить заказ"><div class="clr"></div></div>' +
                        '</form></div>';
                $.colorbox({html: template});
                $('#cart-total').html(json['total']);
                $('.cartLoacation').live('click', function(e) {
                    document.location.href = "index.php?route=checkout/simplecheckout";
                });
                
                $('.nextban').hide();
                $('.prevban').hide();
                
                if(total_ban > 4){
                    $('.prevban').show();
                }
                
                var total_count_ban = 4;
                
                $('.prevban').click(function(e){
                    e.preventDefault();
                    total_count_ban++;
                    $('.related-items-list .divs').animate({"marginLeft":"-=137"},500);
                    $('.nextban').show();
                    if(total_ban == total_count_ban){
                        $('.prevban').hide();
                    }
                });
                
                
                $('.nextban').click(function(e){
                    e.preventDefault();
                    total_count_ban--;
                    $('.related-items-list .divs').animate({"marginLeft":"+=137"},500);
                    if(total_ban != total_count_ban){
                        $('.prevban').show();
                    }
                    if(total_count_ban <= 4){
                        $('.nextban').hide();
                    }
                });
            }
        }
    });
}

function addToWishList(product_id) {
    $.ajax({
        url: 'index.php?route=account/wishlist/add',
        type: 'post',
        data: 'product_id=' + product_id,
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, .information').remove();

            if (json['success']) {
                $('#wishlist-total').html(json['total']);

            }
        }
    });
}

function addToCompare(product_id) {
    $.ajax({
        url: 'index.php?route=product/compare/add',
        type: 'post',
        data: 'product_id=' + product_id,
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, .information').remove();

            if (json['success']) {
                $('#compare-total').html(json['total']);

            }
        }
    });
}
function isValidEmail(value) {
    return /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i.test(value);
}
function alertWrongMessage(className, fadeInTime, fadeOutTime, text) {
   $('.' + className).text(text);
    $('.' + className).fadeIn(fadeInTime);
    setTimeout(function() {
        $('.' + className).fadeOut(fadeInTime)
    }, fadeOutTime);
}
function chechId(idArray) {
    var cheked = 0;
    $.each(idArray, function(index, value) {
        if ($('#' + value).val() != '') {
            cheked++
        }
        ;
    });
    if (cheked == idArray.length) { 
        return true;
    }

}
