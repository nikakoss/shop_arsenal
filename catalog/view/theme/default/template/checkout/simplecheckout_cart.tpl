<?php if ($attention) { ?>
    <div class="simplecheckout-warning-block"><?php echo $attention; ?></div>
<?php } ?>    
<?php if ($error_warning) { ?>
    <div class="simplecheckout-warning-block"><?php echo $error_warning; ?></div>
<?php } /* echo '<pre>'; print_r ($_SESSION);*/ ?>
<h3>Корзина</h3>
    <table class="simplecheckout-cart">
       <thead>
            <tr>
                <th class="name"></th>
                <th class="model"><?php echo $column_name; ?></th>
                 <th class="price"><?php echo $column_price; ?></th>
                <th class="quantity"><?php echo $column_quantity; ?></th>               
                <?php if($this->customer->isLogged()){ ?>
                <th class="price">Скидка</th>
               
                 <? }?>  
                 <th class="price">Итого</th>
                <th class="remove"></th>        
            </tr>
        </thead>  
    <tbody>
    <?php foreach ($products as $product) { ?>
        <?php if (!empty($product['recurring'])) { ?>
            <tr>
                <td class="simplecheckout-recurring-product" style="border:none;"><image src="catalog/view/theme/default/image/reorder.png" alt="" title="" style="float:left;" /><span style="float:left;line-height:18px; margin-left:10px;"> 
                    <strong><?php echo $text_recurring_item ?></strong>
                    <?php echo $product['profile_description'] ?>
                </td>
            </tr>
        <?php } ?>
        <tr>
            <td class="image">
                <?php if ($product['thumb']) { ?>
                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                <?php } ?>
            </td> 
            <td class="name">
                <?php if ($product['thumb']) { ?>
                    <div class="image">
                        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                    </div>
                <?php } ?>
                <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                <?php if (!$product['stock'] && ($config_stock_warning || !$config_stock_checkout)) { ?>
                    <span class="product-warning">***</span>
                <?php } ?>
                <div class="options">
                <?php foreach ($product['option'] as $option) { ?>
                &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                <?php } ?>
                <?php if (!empty($product['recurring'])) { ?>
                - <small><?php echo $text_payment_profile ?>: <?php echo $product['profile_name'] ?></small>
                <?php } ?>
                </div>
                <?php if ($product['reward']) { ?>
                <small><?php echo $product['reward']; ?></small>
                <?php } ?>
            </td>
           <td class="price"><nobr><?php if(isset($product['price'])) echo $product['price']; ?></br><?php if(!empty($product['unit'])) { ?>за <?php
		   echo $product['unit']; ?>.<?php } ?></nobr></td>
            
            <td class="quantity">
                <img src='<?php echo $simple->tpl_joomla_path() ?>catalog/view/image/minus.png' border='0' <?php if ($quantity > 1) { ?>onclick="jQuery(this).next().val(~~jQuery(this).next().val()-1);simplecheckout_reload('cart_value_decreased');"<?php } ?>>
                <input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" onchange="simplecheckout_reload('cart_value_changed')" />
                <img src='<?php echo $simple->tpl_joomla_path() ?>catalog/view/image/plus.png' border='0' onclick="jQuery(this).prev().val(~~jQuery(this).prev().val()+1);simplecheckout_reload('cart_value_increased');">
            </td>
            
    <?php if($this->customer->isLogged()){ ?>
            <td class="price"><nobr><?php echo $product['discount']; ?></nobr></td>
          <!--  <td class="price"><nobr><?php echo $product['price_discount']; ?></nobr></td> -->
    <?php } ?>
            <td class="total"><nobr><?php echo $product['total']; ?></nobr></td>
			
            <td class="remove">
            <a href="javascript:void(0);" title="Удалить"  onclick="jQuery('#simplecheckout_remove').val('<?php echo $product['key']; ?>');simplecheckout_reload('product_removed');">
                    Удалить
                </a>
            </td>        
            </tr>
            <?php } ?>
            <?php foreach ($vouchers as $voucher_info) { ?>
                <tr>
                    <td class="image"></td>  
                    <td class="name"><?php echo $voucher_info['description']; ?></td>
                    <td class="model"></td>
                    <td class="quantity">1</td>
                    <td class="price"><nobr><?php echo $voucher_info['amount']; ?></nobr></td>
                    <td class="total"><nobr><?php echo $voucher_info['amount']; ?></nobr></td>
                    <td class="remove">
                    <img style="cursor:pointer;" src="<?php echo $simple->tpl_joomla_path() ?>catalog/view/image/close.png" onclick="jQuery('#simplecheckout_remove').val('<?php echo $voucher_info['key']; ?>');simplecheckout_reload('product_removed');" />
                    </td>
                </tr>
            <?php } ?>
    </tbody>
</table>
    
<?php foreach ($totals as $total) { ?>
    <div class="simplecheckout-cart-total" id="total_<?php echo $total['code']; ?>">
        <span><b><?php echo $total['title']; ?>:</b></span>
        <span class="simplecheckout-cart-total-value"><nobr><?php echo $total['text']; ?></nobr></span>
      <!--  <span class="simplecheckout-cart-total-remove">Очистить корзину
            <?php if ($total['code'] == 'coupon') { ?>
            <img src="<?php echo $simple->tpl_joomla_path() ?>catalog/view/image/close.png" onclick="jQuery('input[name=coupon]').val('');simplecheckout_reload('coupon_removed');" />
            <?php } ?>
            <?php if ($total['code'] == 'voucher') { ?>
            <img src="<?php echo $simple->tpl_joomla_path() ?>catalog/view/image/close.png" onclick="jQuery('input[name=voucher]').val('');simplecheckout_reload('voucher_removed');" />
            <?php } ?>
            <?php if ($total['code'] == 'reward') { ?>
            <img src="<?php echo $simple->tpl_joomla_path() ?>catalog/view/image/close.png" onclick="jQuery('input[name=reward]').val('');simplecheckout_reload('reward_removed');" />
            <?php } ?>
        </span> -->
    </div>
<?php } ?>
<?php  
if(isset($_SESSION['payment_methods']['cash_plusplus'])){
$cash_plusplus=1;
}else{
$cash_plusplus=0;
}
?>
<input  id="totals_shipping" type="hidden" value="<?php echo $cart_totals;?>">
<input  id="payment_method" type="hidden" value="<?php echo $cash_plusplus;?>">
<!--
<?php if (isset($modules['coupon'])) { ?>
    <div class="simplecheckout-cart-total">
        <span class="inputs"><?php echo $entry_coupon; ?>&nbsp;<input type="text" name="coupon" value="<?php echo $coupon; ?>" onchange="simplecheckout_reload('coupon_changed')"  /></span>
    </div>
<?php } ?>

<?php if (isset($modules['reward']) && $points > 0) { ?>
    <div class="simplecheckout-cart-total">
        <span class="inputs"><?php echo $entry_reward; ?>&nbsp;<input type="text" name="reward" value="<?php echo $reward; ?>" onchange="simplecheckout_reload('reward_changed')"  /></span>
    </div>
<?php } ?>
<?php if (isset($modules['voucher'])) { ?>
    <div class="simplecheckout-cart-total">
        <span class="inputs"><?php echo $entry_voucher; ?>&nbsp;<input type="text" name="voucher" value="<?php echo $voucher; ?>" onchange="simplecheckout_reload('voucher_changed')"  /></span>
    </div>
<?php } ?>
<?php if (isset($modules['coupon']) || isset($modules['reward']) || isset($modules['voucher'])) { ?>
    <div class="simplecheckout-cart-total simplecheckout-cart-buttons">
        <span class="inputs buttons"><a id="simplecheckout_button_cart" onclick="simplecheckout_reload('cart_changed');" class="button btn"><span><?php echo $button_update; ?></span></a></span>
    </div>
<?php } ?>
  -->  
  
  <span class="simplecheckout-cart-total-remove">Очистить корзину</span>
  
<input type="hidden" name="remove" value="" id="simplecheckout_remove">
<div style="display:none;" id="simplecheckout_cart_total"><?php echo $cart_total ?></div>
<script type="text/javascript">
    jQuery(function(){
        jQuery('#cart_total').html('<?php echo $cart_total ?>');
        jQuery('#cart-total').html('<?php echo $cart_total ?>');
        jQuery('#cart_menu .s_grand_total').html('<?php echo $cart_total ?>');
        <?php if ($simple_show_weight) { ?>
        jQuery('#weight').text('<?php echo $weight ?>');
        <?php } ?>
        <?php if ($template == 'shoppica2') { ?>
        jQuery('#cart_menu div.s_cart_holder').html('');
        $.getJSON('index.php?<?php echo $simple->tpl_joomla_route() ?>route=tb/cartCallback', function(json) {
            if (json['html']) {
                jQuery('#cart_menu span.s_grand_total').html(json['total_sum']);
                jQuery('#cart_menu div.s_cart_holder').html(json['html']);
            }
        });
        <?php } ?>
        <?php if ($template == 'shoppica') { ?>
            jQuery('#cart_menu div.s_cart_holder').html('');
            jQuery.getJSON('index.php?<?php echo $simple->tpl_joomla_route() ?>route=module/shoppica/cartCallback', function(json) {
                if (json['output']) {
                    jQuery('#cart_menu span.s_grand_total').html(json['total_sum']);
                    jQuery('#cart_menu div.s_cart_holder').html(json['output']);
                }
            });
        <?php } ?>
    });
</script>
<?php if ($simple->get_simple_steps() && $simple->get_simple_steps_summary()) { ?>
<div id="simple_summary" style="display: none;margin-bottom:15px;">
    <table class="simplecheckout-cart">
        <colgroup>
            <col class="image">
            <col class="name">
            <col class="model">
            <col class="quantity">
            <col class="price">
            <col class="total">
        </colgroup>
        <thead>
            <tr>
                <th class="image"><?php echo $column_image; ?></th>
                <th class="name"><?php echo $column_name; ?></th>
                <th class="model"><?php echo $column_model; ?></th>
                <th class="quantity"><?php echo $column_quantity; ?></th>
                <th class="price"><?php echo $column_price; ?></th>
                <th class="total"><?php echo $column_total; ?></th>
            </tr>
        </thead>
    <tbody>
    <?php foreach ($products as $product) { ?>
        <tr>
            <td class="image">
                <?php if ($product['thumb']) { ?>
                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                <?php } ?>
            </td> 
            <td class="name">
                <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                <?php if (!$product['stock'] && ($config_stock_warning || !$config_stock_checkout)) { ?>
                    <span class="product-warning">***</span>
                <?php } ?>
                <div class="options">
                <?php foreach ($product['option'] as $option) { ?>
                &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                <?php } ?>
                </div>
                <?php if ($product['reward']) { ?>
                <small><?php echo $product['reward']; ?></small>
                <?php } ?>
            </td>
            <td class="model"><?php echo $product['model']; ?></td>
            <td class="quantity"><?php echo $product['quantity']; ?></td>
            <td class="price"><nobr><?php echo $product['price']; ?></nobr></td>
            <td class="total"><nobr><?php echo $product['total']; ?></nobr></td>
            </tr>
            <?php } ?>
            <?php foreach ($vouchers as $voucher_info) { ?>
                <tr>
                    <td class="image"></td>  
                    <td class="name"><?php echo $voucher_info['description']; ?></td>
                    <td class="model"></td>
                    <td class="quantity">1</td>
                    <td class="price"><nobr><?php echo $voucher_info['amount']; ?></nobr></td>
                    <td class="total"><nobr><?php echo $voucher_info['amount']; ?></nobr></td>
                </tr>
            <?php } ?>
        </tbody>
    </table>
        
    <?php foreach ($totals as $total) { ?>
        <div class="simplecheckout-cart-total" id="total_<?php echo $total['code']; ?>">
            <span><b><?php echo $total['title']; ?>:</b></span>
            <span class="simplecheckout-cart-total-value"><nobr><?php echo $total['text']; ?></nobr></span>
        </div>
    <?php } ?>
</div>
<?php } ?>
<div class="buyOneClick">
    <form onsubmit="return false;">
        <label for="oneclikName">Контактное лицо</label>
        <input type="text" required="" placeholder="Иванов Иван Иванович" id="oneclikName" name="name">  
        <label for="oneclikPhone">Контактный телефон</label>  
        <input type="text" required="" placeholder="+7(987) 654-32-10" id="oneclikPhone" class="oneClickInOrderPage" name="phone">  
		<script>
		$('.oneClickInOrderPage').each(function(){
                $(this).mask("+7(999) 999-99-99");
        });
		</script>
        <button id="oneclik-customer" class="add-oneclik">Купить в 1 клик</button>
        <div class="elseData">или заполните данные ниже</div>
    </form>
</div>