$(document).ready(function() {
    $('.colorbox').colorbox({
        overlayClose: true,
        opacity: 0.5,
        rel: "colorbox"
    });
    var template = '<div class="popup"><div class="popup-shadow"></div>' +
        '<form>' +
        '<div class="popup-container">' +
        '<div class="popcart" style="min-width: 400px;"><img onclick="$.colorbox.close();" class="x" src="image/kuvalda/x.png" alt="">'+
        '<h2>Спасибо за заказ</h2>'+
        '<p class="subscription-desc">В ближайшее время наш менеджер свяжется с</br>вами для подтверждения заказа и уточнения деталей</p>'+
        '<div class="cbbutton" ><a onClick="$.colorbox.close();">Закрыть сообщение</a></div>'+
        '</div>' +
        '</div>'+
        '</form>' +
        '</div>';
    var template2 = '<div class="popup"><div class="popup-shadow"></div>' +
        '<form>' +
        '<div class="popup-container">' +
        '<div class="popcart" style="min-width: 400px;"><img onclick="$.colorbox.close();" class="x" src="image/kuvalda/x.png" alt="">'+
        '<h2>Товар добавлен</h2>'+
        '<p class="subscription-desc">Товар успешно добавлен в корзину</p>'+
        '<div class="cbbutton" ><a onClick="$.colorbox.close();">Закрыть сообщение</a></div>'+
        '</div>' +
        '</div>'+
        '</form>' +
        '</div>';


    $('.bay-product').click(function(){
        $('#option-value-'+$(this).val()).attr('checked', 'checked');
        var all_quant = 0;
        $("input[name='quantity_opt']").each(function(){
            all_quant += parseInt($(this).val());
        });

        $("input[name='quantity_opt_all']").attr("value", all_quant);

        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('.product-info-opt input[name=\'quantity_opt_all\'], .product-info-opt input[type=\'hidden\'], .product-info-opt input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
            dataType: 'json',
            success: function(json) {
                $('#cart-total').html(json['total']);
                $("input[name='quantity_opt']").attr("value", 0);
                $.colorbox({html: template});
            }
        });
    });

    $('select[name="profile_id"], input[name="quantity"]').change(function(){
        $.ajax({
            url: 'index.php?route=product/product/getRecurringDescription',
            type: 'post',
            data: $('input[name="product_id"], input[name="quantity"], select[name="profile_id"]'),
            dataType: 'json',
            beforeSend: function() {
                $('#profile-description').html('');
            },
            success: function(json) {
                $('.success, .warning, .attention, information, .error').remove();
                if (json['success']) {
                    $('#profile-description').html(json['success']);
                }
            }
        });
    });


    $('#button-cart').click(function() {
	
	$.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
            dataType: 'json',
			success: function(json) {
            $('.success, .warning, .attention, .information, .error').remove();

            if (json['redirect']) {
                location = json['redirect'];
            }

            if (json['success']) {
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
				$("input[name='quantity']").attr("value", 1);
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
    });


    $('#review .pagination a').live('click', function() {
        $('#review').fadeOut('slow');
        $('#review').load(this.href);
        $('#review').fadeIn('slow');
        return false;
    });
	
	var product_id=parseInt($('#product_id').val());
	
    $('#review').load('index.php?route=product/product/review&product_id='+product_id);

    $('#rait_s').load('index.php?route=product/product/review_rait_s&product_id='+product_id);

    $('#button-review').bind('click', function() {
        $.ajax({
            url: 'index.php?route=product/product/write&product_id='+product_id,
            type: 'post',
            dataType: 'json',
            data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
            beforeSend: function() {
                $('.success, .warning').remove();
                $('#button-review').attr('disabled', true);
                $('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
            },
            complete: function() {
                $('#button-review').attr('disabled', false);
                $('.attention').remove();
            },
            success: function(data) {
                if (data['error']) {
                    $('#review-title').after('<div class="warning">' + data['error'] + '</div>');
                }

                if (data['success']) {
                    $('#review-title').after('<div class="success">' + data['success'] + '</div>');
                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').attr('checked', '');
                    $('input[name=\'captcha\']').val('');
                }
            }
        });
    });

    // tabs data
    $('#tabs a').tabs();

    if ($.browser.msie && $.browser.version == 6) {
        $('.date, .datetime, .time').bgIframe();
    }

    $('.date').datepicker({dateFormat: 'yy-mm-dd'});
    $('.datetime').datetimepicker({
        dateFormat: 'yy-mm-dd',
        timeFormat: 'h:m'
    });
    $('.time').timepicker({timeFormat: 'h:m'});



});