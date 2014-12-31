<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content" class="products"><?php echo $content_top; ?>

    <script type="text/javascript" src="catalog/view/javascript/jquery/jquery.elevatezoom.min.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/jquery/fancybox/jquery.fancybox.pack.js"></script>
    <link   rel="stylesheet" href="catalog/view/javascript/jquery/fancybox/jquery.fancybox.css">

    <script type="text/javascript">
        $(document).ready(function () {

    var item_images_gallery = {};
                function init_fancybox_func() {
                $(".fancybox").fancybox({
                openEffect      : 'none',
                        closeEffect     : 'none'
                });
                }

        function init_elevateZoom_func() {
        $('#main_image').elevateZoom({
        gallery:'gallery_01',
                cursor: 'pointer',
                galleryActiveClass: "active",
                imageCrossfade: true,
                loadingIcon: "/catalog/view/javascript/jquery/colorbox/images/loading.gif",
                zoomWindowPosition: 1,
                zoomWindowOffetx: 12
        });
        }

        init_elevateZoom_func();

                $('.item-images a').click(function() {
                var main_image = $('#main_image').clone();
                $('#main_imagebox').html(main_image);
                $("#main_image").attr('data-zoom-image', $(this).attr('href'));
                $("#main_image").attr('src', $(this).attr('data-image'));
                init_elevateZoom_func();
                return false;
        });
                });</script>
    <style>
        /*set a border on the images to prevent shifting*/
        #gallery_01 img{border:2px solid white;}

        /*Change the colour*/
        .active img{border:2px solid #333 !important;}

        .zoomWrapper {
            float: left;
        }
    </style>

    <h1><?php echo $heading_title; ?><?php echo $stiker;?></h1>

    <?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/breadcrumb.tpl'); ?>

    <div class="cart-item clearfix product-info">
        <h5>
            <span>
                <div class="reyting_compare prod clearfix">
                <div class="izbr">
                    <a class="addToWishList" href="javascript:addToWishList(<?php echo $product_id; ?>);">Добавить в избранное</a>
                </div>
                <div class="dob">
                    <a class="addToCompare" href="javascript:addToCompare(<?php echo $product_id; ?>);">Добавить к сравнению</a>
                </div>
                </div>
            </span>
        </h5>

        <div class="left-product">

            <?php if ($thumb || $images) { ?>
            <span id="main_imagebox">
                <img class="main_image fancybox" 
                     rel="gallery1"
                     id="main_image" 
                     data-zoom-image="<?php echo $popup; ?>" 
                     src="<?php echo $thumb; ?>" 
                     title="<?php echo $heading_title; ?>" 
                     alt="<?php echo $heading_title; ?>" />
            </span>
            <?php } ?>

            <div class="cart-item-info">
                <div class="item-code">
                    <strong>Код для заказа по телефону:</strong>
                    <span><?php echo $product_id; ?></span>
                </div>
                <div class="item-order">
                    <strong><img src="image/kuvalda/temp/check.png" alt=""/><?php echo $stock; ?></strong>                   
                </div>
                <div class="item-delivery">
                    <strong>Способы получения товара:</strong>
                    <span><img src="catalog/view/theme/default/image/delivery-1.png" alt=""><a href="/record/record?record_id=11">Самовывоз</a></span>
                    <span><img src="catalog/view/theme/default/image/delivery-2.png" alt=""><a href="/record/record?record_id=11">Транспортной компанией</a></span>
                </div>
                
                
                <div id='rait_s'></div>
                <?php if ($images) { ?>
                                <div class="item-images" id="item-images">
                                        <?php foreach ($images as $image) { ?>
                                                <a href="<?php echo $image['popup']; ?>" 
                                                        class="fancybox" 
                                                        rel="gallery1"
                                                        data-image="<?php echo $image['thumb']; ?>" 
                                                        data-zoom-image="<?php echo $image['popup']; ?>">
                                                                <img src="<?php echo $image['small_thumb']; ?>" alt="<?php echo $heading_title; ?>" />
                                                </a>
                                        <?php } ?>
                                </div>
                <?php } ?>
            </div>
        </div>
		<!--http://screencast.com/t/qZuuLbQ3GHE-->
        <div class="price-item">
            <div>
                <div class="price">
                    <?php if (!$special) { ?>
                    <strong><?php echo $price; ?></br></strong>
					<span class="za_unit"><?php if(!empty($unit)) { ?>за <?php echo $unit; ?>.<?php } ?></span>
                    <?php } else { ?>
                    <strong><?php echo $price; ?></strong>
                    <span><span>Старая цена:</span><strike><?php echo $special; ?> <?php if(!empty($unit)) { ?>за <?php echo $unit; ?>.<?php } ?></strike></span>
                    <span><span>Скидка:</span>480 р.</span>
                    <?php } ?>
                </div>
                <div class="count">
                    <strong>Количество:</strong>
                    <div>
                        <input type="text" name="quantity" size="2" value="1">
                        <button onclick="change_quantity($('input[name=\'quantity\']'), '+')"><img src="image/kuvalda/temp/plus-button.png" alt=""/></button>
                        <button onclick="change_quantity($('input[name=\'quantity\']'), '-')"><img src="image/kuvalda/temp/minus-button.png" alt=""/></button>
                    </div>

                    <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />

                    <button id="button-cart"><?php echo $button_cart; ?></button>


                    <a class="one-click-order" price="<?php echo $price; ?>" product_href="/index.php?route=product/product&product_id=<?php echo $product_id; ?>" 
                       thumb="<?php echo $thumb; ?>" product_name="<?php echo $heading_title; ?>" product_id="<?php echo $product_id; ?>"
					   unit="<?php if(!empty($unit)) { ?> за <?php echo $unit; ?>.<?php } ?>" ><?php echo $this->language->get('text_one_click'); ?></a>


                </div>
            </div>
            <a class="cboxElement" href="/index.php?route=custom/desh"><span>Нашли цену ниже?</span>
                Мы продадим еще дешевле!</a>
        </div>

    </div><!-- .cart-item -->
    
    <div class="product-info-opt">
        <?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/product_options.tpl'); ?>
        <input type="hidden" name="product_id" id="product_id"  value="<?php echo $product_id; ?>" />
    </div>

    <div class="another-cart-items">
        <div class="left">
            <div class="description">
                <div id="tabs" class="htabs clearfix">
                    <?php if (trim($description)) { ?>
                    <a href="#tab-desc" class="selected">Описание</a>
                    <?php } ?>
                    <?php if ($attribute_groups) { ?><a href="#tab-attribute">Технические характеристики</a><?php } ?>
                    <?php if ($review_status) { ?><a href="#tab-review"  id="tabs-review">Отзывы и вопросы</a><?php } ?>
                    <?php if ($youtube) { ?><a href="#tab-video">Видео обзор</a><?php } ?>
                </div>
                <?php if (trim($description)) { ?>
                <div class="description-content" id="tab-desc">
                    <span><?php echo $description; ?></span>
                </div>
                <?php } ?>
                <?php if ($attribute_groups) { ?>
                <div class="description-content" id="tab-attribute">
                    <div class="description-content-table">
                        <?php if($downloads){ ?>
                        <?php foreach($downloads as $download){ ?>
                        <a class="instruction-file" href="<?php echo $download['href']; ?>" title=""><?php echo $download['name']; ?><?php echo " (". $download['size'] .")";?></a>
                        <?php } ?>
                        <?php } ?>
                        <?php foreach ($attribute_groups as $attribute_group) { ?>
                        <strong><?php echo $attribute_group['name']; ?></strong>
                        <table class="attribute  <?php if($grade){ echo "content-complect"; }?>">
                            <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                            <tr>
                                <td><?php echo $attribute['name']; ?></td>
                                <td><?php echo $attribute['text']; ?></td>
                            </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                        <?php } ?>
                    </div>
                    <div class="description-content-complect">
                        <?php if($grade){ ?>
                        <strong>Комплектация*</strong>
                        <?php echo $grade; ?>
                        <?php } ?>

                    </div>
                    <div class="clear"></div>
                    <span>* Компания-производитель оставляет за собой право на изменение комплектации и места производства товара без уведомления дилеров!</span>
                    <span>Указанная информация не является публичной офертой</span>
                </div><!-- specification -->
                <?php } ?>
                <?php if ($review_status) { ?>
                <div class="description-content" id="tab-review">
                    
                    <?php if ($review_status) { ?>
                    <div id="tab-review" class="tab-content">
                        <div id="review"></div>
                        <h2 id="review-title"><?php echo $text_write; ?></h2>
                        <b><?php echo $entry_name; ?></b><br />
                        <input type="text" name="name" value="" />
                        <br />
                        <br />
                        <b><?php echo $entry_review; ?></b>
                        <textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea>
                        <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
                        <br />
                        <b><?php echo $entry_rating; ?></b> <span><?php echo $entry_bad; ?></span>&nbsp;
                        
                        <span class="star-rating">
                                <input type="radio" name="rating" value="1"><i></i>
                                <input type="radio" name="rating" value="2"><i></i>
                                <input type="radio" name="rating" value="3"><i></i>
                                <input type="radio" name="rating" value="4"><i></i>
                                <input type="radio" name="rating" value="5"><i></i>
                        </span>                        
                        
                        &nbsp; <span><?php echo $entry_good; ?></span><br />
                        <br />
                        <b><?php echo $entry_captcha; ?></b><br />
                        <img src="index.php?route=product/product/captcha" alt="" id="captcha" />
                        <input type="text" name="captcha" value="" />
                        <br />
                        <div class="buttons">
                            <div class="right"><a id="button-review" class="button"><span>Оставить отзыв</span></a></div>
                        </div>
                    </div>
                    <?php } ?>
                
                
                               
                </div>
                <?php } ?>
                <?php if ($youtube) { ?>
                <div class="description-content" id="tab-video">
                    <span><iframe width="660" height="460" src="//www.youtube.com/embed/<?php echo $youtube;?>" frameborder="0" allowfullscreen></iframe></span>
                </div>
                <?php } ?>
            </div>            

            <?php echo $content_bottom; ?>
        </div>
        
        <?php if ($products_related) { ?>
        <div class="related-items related-items-products">
            <h3>Сопутствующие товары</h3>
            <?php foreach ($products_related as $products) { ?>
            <a class="related-date" href="#" data-category_id="<?php echo $products['category_id']; ?>" ><span><?php echo $products['name']; ?></span></a>
            <?php if($products['product_array']){ ?>     
            <div class="related-items-list related-item-<?php echo $products['category_id']; ?>">
            <?php foreach($products['product_array'] as $product){ ?>
             <div>
                    <?php if ($product['thumb']) { ?>
                    <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" >
                    <?php } ?>
                    <div>
                        <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>

                        <?php if (!$product['special']) { ?>
                             <strong>Цена:<span><?php echo $product['price']; ?></span></strong>
			<?php } else { ?>
                                <strong>Цена: <span><?php echo $product['special']; ?></span></strong>
                                <strong>Старая цена: <span><?php echo $product['price']; ?></span></strong>
				<?php if (isset($product['price_offset']) && $product['price_offset']) { ?>
                                <strong>Скидка: <span><?php echo $product['price_offset']; ?></span></strong>
				<?php } ?>
			<?php } ?>
                        
                    </div>
                    <hr class="clear">
                    <span>Количество:</span>
                    <input type="text" value="1">
                    <button class="cart_but" onclick="addToCart(<?php echo $product['product_id']; ?>);">В корзину</button>
                </div>
            <?php }?>
            </div>
            <?php }?>
            <?php }?>
        </div>
        <?}?>  
        </div>

        <?php if ($options) { ?>
        <script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
        <?php foreach ($options as $option) { ?>
        <?php if ($option['type'] == 'file') { ?>
        <script type="text/javascript"><!--
        new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
                    action: 'index.php?route=product/product/upload',
                            name: 'file',
                            autoSubmit: true,
                            responseType: 'json',
                            onSubmit: function(file, extension) {
                            $('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
                                    $('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
                            },
                            onComplete: function(file, json) {
                            $('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
                                    $('.error').remove();
                                    if (json['success']) {
                            alert(json['success']);
                                    $('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
                            }

                            if (json['error']) {
                            $('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
                            }

                            $('.loading').remove();
                            }
                    });
        //--></script>
        <?php } ?>
        <?php } ?>
        <?php } ?>
        <?php echo $footer; ?>