<a href="<?php echo $cart; ?>" style="color: #fff;">
    <?php echo $this->language->get('text_in_cart'); ?>
</a>: 
<span id="cart-total"><?php echo $text_items; ?></span>
<input type="hidden" value="<?php echo $order_all_count; ?>" id="order_all_count">
<input type="hidden" value="<?php echo $order_all_total; ?>" id="order_all_total">