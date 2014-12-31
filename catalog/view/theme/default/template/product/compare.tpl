<?php echo $header; ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content" class="products"><?php echo $content_top; ?>
    <h1><?php echo $heading_title; ?></h1>
    <ul class="bread_crumbs clearfix">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a> </li>
        <?php } ?>
    </ul>
    
    
    
    <?php if ($products) { ?>


    <div class="left-compare">
        <table class="compare-info">
            <tbody>
                <tr class="oddC">
                    <td><div class="td_wrap"><?php echo $text_model; ?></div></td>

                </tr>
                <tr >
                    <td><div class="td_wrap"><?php echo $text_manufacturer; ?><div></td>

                </tr>
                <tr class="oddC availability">
                    <td><div class="td_wrap"><?php echo $text_availability; ?><div></td>

                </tr>

                <tr class="summary">
                    <td><div class="td_wrap"><?php echo $text_summary; ?><div></td>

                </tr>
                <tr class="oddC">
                    <td><div class="td_wrap"><?php echo $text_weight; ?></div></td>

                </tr>
                <tr>
                    <td><div class="td_wrap"><?php echo $text_dimension; ?></div></td>

                </tr>
            </tbody>
            <?php $oddCount=0; foreach ($attribute_groups as $attribute_group) { ?>

            <?php  foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
            <tbody id="left-compare-<?php echo $oddCount;?>" >
                <tr <?php if(($oddCount%2)==0){ echo 'class="oddC"'; }  ?> >
                    <td><div class="td_wrap left-compare-<?php echo $oddCount;?>" ><?php echo $attribute['name']; ?><div></td>
                    <?php foreach ($products as $product) { ?>
                    <?php if (isset($products[$product['product_id']]['attribute'][$key])) { ?>

                    <?php } else { ?>
                    <td></td>
                    <?php } ?>
                    <?php   } ?>
                </tr>
            </tbody>
            <?php $oddCount++; } ?>
            <?php } ?>

        </table>
    </div>
    <div class="right-compare">
        
        <a href="#" class="btn_sl prev"></a>
    		<a href="#" class="btn_sl next"></a>
                
        <div class="right_wrap">
    		
        <table class="compare-info">


            <tbody>
                <tr>
                    <?php foreach ($products as $product) { ?>
                    <td >


                        <div class="compare-title">
                            <a href="<?php echo $product['remove']; ?>" class="button"></a>
                            <div class="img_compare">
                                <?php if ($products[$product['product_id']]['thumb']) { ?>             
                                <img src="<?php echo $products[$product['product_id']]['thumb']; ?>" alt="<?php echo $products[$product['product_id']]['name']; ?>" />
                                <?php }else{ ?> 
                                <img src="image/cache/no_image-150x150.jpg" alt="<?php echo $products[$product['product_id']]['name']; ?>" />             
                                <?php } ?>
                            </div>
                            <a class="tovar_title" href="<?php echo $products[$product['product_id']]['href']; ?>"><?php echo $products[$product['product_id']]['name']; ?></a>


                            <div class="price">
                                <div class="price1">Цена</div>
                                <?php if ($products[$product['product_id']]['price']) { ?>
                                <?php if (!$products[$product['product_id']]['special']) { ?>
                                <div class="price2"><?php echo $products[$product['product_id']]['price']; ?></div> 
                                <?php } else { ?>
                                <div class="price-old"><?php echo $products[$product['product_id']]['price']; ?></div> <div class="price-new"><?php echo $products[$product['product_id']]['special']; ?></div>
                                <?php } ?>
                                <?php } ?>
                                <div class="clr"></div>
                            </div>

                            <div class="add_to_cart">
                                <input type="button" value="В корзину" onclick="addToCart('10582');" class="button add_btn" />
                                <a href="#" class="one_click">Заказать в 1 клик</a>
                            </div>

                        </div>    



                    </td>
                    <?php } ?>
                </tr>
                
                <?php if ($review_status) { ?>
                <tr>
                    <?php foreach ($products as $product) { ?>
                    <td>
                        <div class="td_wrap">
                            <span>  <img src="catalog/view/theme/default/image/stars-<?php echo $products[$product['product_id']]['rating']; ?>.png" alt="<?php echo $products[$product['product_id']]['reviews']; ?>" /> </span>
                      <span>  <?php echo $products[$product['product_id']]['reviews']; ?> </span>
                        </div>
                    </td>
                    <?php } ?>
                </tr>
                <?php } ?>

                <tr class="oddC">
                    <?php foreach ($products as $product) { ?>
                    <td><div class="td_wrap"><?php echo $products[$product['product_id']]['model']; ?></div></td>
                    <?php } ?>
                </tr>
                <tr>
                    <?php foreach ($products as $product) { ?>
                    <td><div class="td_wrap"><?php echo $products[$product['product_id']]['manufacturer']; ?></div></td>
                    <?php } ?>
                </tr>
                <tr class="oddC availability">
                    <?php foreach ($products as $product) { ?>
                    <td><div class="td_wrap"><?php echo $products[$product['product_id']]['availability']; ?></div></td>
                    <?php } ?>
                </tr>

                <tr class="summary">
                    <?php foreach ($products as $product) { ?>
                    <td class="description"><div class="td_wrap"><?php echo $products[$product['product_id']]['description']; ?></div></td>
                    <?php } ?>
                </tr>
                <tr class="oddC"> 
                    <?php foreach ($products as $product) { ?>
                    <td><div class="td_wrap"><?php echo $products[$product['product_id']]['weight']; ?></div></td>
                    <?php } ?>
                </tr>
                <tr>
                    <?php foreach ($products as $product) { ?>
                    <td><div class="td_wrap"><?php echo $products[$product['product_id']]['length']; ?> x <?php echo $products[$product['product_id']]['width']; ?> x <?php echo $products[$product['product_id']]['height']; ?></div></td>
                    <?php } ?>
                </tr>
            </tbody>
            <?php $oddCount=0; foreach ($attribute_groups as $attribute_group) { ?>

            <?php  foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
            <tbody id="right-compare-<?php echo $oddCount;?>">
                <tr <?php if(($oddCount%2)==0){ echo 'class="oddC"'; }  ?> >
                    <?php foreach ($products as $product) { ?>
                    <?php if (isset($products[$product['product_id']]['attribute'][$key])) { ?>
                    <td><div class="td_wrap right-compare-<?php echo $oddCount;?>" ><?php echo $products[$product['product_id']]['attribute'][$key]; ?></div></td>
                    <?php } else { ?>
                    <td><div class="td_wrap right-compare-<?php echo $oddCount;?>" ></div></td>
                    <?php } ?>
                    <?php   } ?>
                </tr>
            </tbody>
            <?php $oddCount++; } ?>
            <?php } ?>

        </table>
    </div>
    </div>
                            <script>
                                   $(document).ready(function() {
                                   var total_p=<?php echo count($products); ?>;
								   $('.next').hide();
                                   $('.compare-info').css({'margin-left':'0px'});
                                   //var position=3;
                                   var totalOption=<?php echo $oddCount;?>;
                                    console.log(totalOption); 
                                   for(var i=0;i<=totalOption;i++){

                                       
                                       if($('#left-compare-'+i).height()>$('#right-compare-'+i).height()){
                                          $('.right-compare-'+i).height($('#left-compare-'+i).height()-14); 
                                          $('.left-compare-'+i).height($('#left-compare-'+i).height()-14); 
                                       }
                                       
                                       if($('#left-compare-'+i).height()<$('#right-compare-'+i).height()){
                                          $('.left-compare-'+i).height($('#right-compare-'+i).height()-14); 
                                          $('.right-compare-'+i).height($('#right-compare-'+i).height()-14); 
                                       }
                                       
                                       console.log(i);
                                  }
                                   
                                   if(total_p >= 4){
                                       $('.prev').show();
                                   }
                                   
                                   var totall_count = 3;
       
                                   $('.prev').click(function(e){
                                       e.preventDefault();
                                       totall_count++;

                                       $('.next').show();

                                        $('.right_wrap .compare-info').animate({"marginLeft":"-=220"},500);
                                        if(total_p == totall_count) {
                                            $('.prev').hide();
                                        } else {
                                            $('.prev').show();
                                        }
                                        
                                        
                                   });
       
                                    $('.next').click(function(e){
                                        e.preventDefault();
                                        var minus_count = 0
                                        totall_count--;

                                        $('.right_wrap .compare-info').animate({"marginLeft":"+=220"},500);
                                        if(total_p != totall_count) {
                                            $('.prev').show();
                                        }
                                        if(totall_count == 3) {
                                            $('.next').hide();
                                        } else {
                                            $('.next').show();
                                        }
                                        //}
                                   });
       
                                });
                            </script>

                            <?php } else { ?>
    <div class="content"><?php echo $text_empty; ?></div>
    <div class="buttons">
        <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
    </div>
    <?php } ?>
    <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>