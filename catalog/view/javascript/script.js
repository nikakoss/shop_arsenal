$(document).ready(function () {
    // Проверка на существование элемента на странице
	$('#preloader_search').hide();
    jQuery.fn.exists = function () {
        return jQuery(this).length;
    }
    var oldHTML = $.fn.html;
    $.fn.formhtml = function () {
        if (arguments.length) return oldHTML.apply(this, arguments);
        $("input,button", this).each(function () {
            this.setAttribute('value', this.value);
        });
        $("textarea", this).each(function () {
            // updated - thanks Raja!
            this.innerHTML = this.value;
        });
        $("input:radio,input:checkbox", this).each(function () {
            // im not really even sure you need to do this for "checked"
            // but what the heck, better safe than sorry
            if (this.checked) this.setAttribute('checked', 'checked');
            else this.removeAttribute('checked');
        });
        $("option", this).each(function () {
            // also not sure, but, better safe...
            if (this.selected) this.setAttribute('selected', 'selected');
            else this.removeAttribute('selected');
        });
        return oldHTML.apply(this);
    };
    $('.one-click-order').live('click', function () {
        if ($(this).attr('thumb')) {
            var thumb = $(this).attr('thumb');
        } else {
            var thumb = 'image/cache/no_image-150x110.jpg';
        }
        //
        if ($(this).attr('product_href')) {
            var product_href = $(this).attr('product_href');
        } else {
            var product_href = '';
        }
        var all_quant = 0;
        $("input[name='quantity_opt']").each(function () {
            all_quant += parseInt($(this).val());
        });
        var quantity_main = $("input[name='quantity']").val();
        if (all_quant > 0) {
            quantity_main = 0;
        }
		
        var quantity = parseInt(all_quant) + parseInt(quantity_main);
        var template = '<div class="popup onecklic"><div class="popup-shadow"></div>' +
            '<form id="oneclick-form">' +
            '<div class="popup-container">' +
            '<img onclick="$.colorbox.close();" class="x" src="image/kuvalda/x.png" alt=""><h2>Заказать в 1 клик</h2>' +
            '<div class="clearfix product-item ">' +
            '<div class="imgCenter"><img title="' + $(this).attr('product_name') + '" alt="' + $(this).attr('product_name') + '" src="' + thumb + '"></div>' +
            '<div class="cartDescription title-one-click"><a href="' + product_href + '">' + $(this).attr('product_name') + '</a>' +
            '<strong> Цена: <span>' + $(this).attr('price') + $(this).attr('unit')  + '</span></strong><input type="text" id="click_phone" required placeholder="Номер телефона" class="callback-one-click" name="phone"><div id="user_phone_error" class="phone_error" ></div> </div>' +
            '<div class="cbbutton butt-buy-one-click"><a class="buy_one_click">Заказать</a></div>' +
            '<input name="product_id" type="hidden" value="' + $(this).attr('product_id') + '">' +
            '<input name="quantity" type="hidden" value="' + quantity + '">' +
            '<input name="name_product" type="hidden" value="' + $(this).attr('product_name') + '">' +
            '<input name="price_product" type="hidden" value="' + $(this).attr('price') + '">' +
            '</div>';
        var options = $(this).parents('.cart').siblings('.options');
        if (options.length > 0) {
            template += options.formhtml();
        }
        template += '</form></div>';
        $.colorbox({html: template, width: '560px'});
        $('#click_phone').each(function(){
                $(this).mask("+7(999) 999-99-99");
        });
    });
    var intRegex = /[0-9 -()+]+$/;
    $('.buy_one_click').live('click', function () {
        if ($('.buy_one_click').hasClass('disabled')) {
            return;
        }
        var form = $(this).parents('form');
        form.find('.phone_error').html('');
        phone = form.find('input[name="phone"]').val();
        if ((phone.length < 4) || (!intRegex.test(phone))) {
            form.find('.phone_error').html('Введите правильный номер телефона');
            return;
        }
        post_data = form.serialize();
        $.ajax({
            type: 'post',
            url: 'index.php?route=module/oneclick/order',
            data: post_data,
            dataType: 'json',
            success: function (data) {
                var succes_msg = '<div class="popup"><div class="popup-shadow"></div>' +
                    '<form><div class="popup-container">' +
                    '<div class="popcart" style="min-width: 400px;"><img onclick="$.colorbox.close();" class="x" src="image/kuvalda/x.png" alt="">' +
                    '<h2>Спасибо за заказ</h2>' +
                    '<p class="subscription-desc">В ближайшее время наш менеджер свяжется с</br>вами для подтверждения заказа и уточнения деталей</p>' +
                    '<div class="cbbutton" ><a onClick="$.colorbox.close();">Закрыть сообщение</a></div>' +
                    '</div></div></form></div>';
                $('#cart-total .orange:first-child').html('0');
                $('#cart-total .orange:last-child').html('0.00руб');
                $.colorbox({html: succes_msg});
            }
        });
    });
    // search query
	
    $('#search_query').autocomplete({
        delay: 0,
        appendTo: "#autocomplete-results",
        source: function (request, response) {
            $.ajax({
                url: 'index.php?route=search/autocomplete&filter_name=' + encodeURIComponent(request.term),
				beforeSend: function() {
						$('#preloader_search').show();
				},
                dataType: 'json',
				complete: function(){
					$('#preloader_search').hide();
				},
                success: function (json) {
                    response($.map(json, function (item) {
                        return {
                            label: item.name,
                            value: item.product_id,
                            href: item.href,
                            thumb: item.thumb,
                            desc: item.desc,
                            price: item.price
                        }
                    }));
                }
            });
        },
        select: function (event, ui) {
            document.location.href = ui.item.href;
            return false;
        },
        focus: function (event, ui) {
            return false;
        },
        minLength: 2
    }).data("autocomplete")._renderItem = function (ul, item) {
        return $("<li>")
            .append("<a><img src='" + item.thumb + "' alt=''>" + item.label + "<br><span class='price'>" + item.price + "</span></a>")
            .appendTo(ul);
    };
	
	
    // search query end
    //start rss email
    function IsEmail(email) {
        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        return regex.test(email);
    }
    var template = '<div class="popup"><div class="popup-shadow"></div>' +
        '<form>' +
        '<div class="popup-container">' +
        '<div style="min-width: 400px;"><img class="x" onclick="$.colorbox.close();" src="image/kuvalda/x.png" "="" alt=""><h2>Отправлено</h2>' +
        '<p class="subscription-desc">Вы успешно подписаны на нашу рассылку</p>' +
        '</div>' +
        '</div>' +
        '</form>' +
        '</div>';
    $('#butt_form').click(function () {
        var email = $('.emaill input[name="email"]');
        var error = true;
        if (IsEmail(email.val())) {
            email.css({'border': '1px solid  #4aace8'});
        } else {
            email.css({'border': '1px solid red'});
            error = false;
        }
        // send ajax
        if (error) {
            $.ajax({
                url: 'index.php?route=information/contact/emailFromRss',
                type: 'post',
                data: $('.emaill').serialize(),
                dataType: 'json',
                success: function (json) {
                    email.val("");
                    $.colorbox({html: template});
                    //$.colorbox.close();
                }
            });
        }
    });
    //end rss email
})