<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content" class="cart-checkout"><?php echo $content_top; ?>
    <h3>Оформление заказа</h3>
     <?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/breadcrumb.tpl'); ?>
     <div class="line_razd_2"></div>
            <div class="myHref order-success"><?php echo $text_message; if(isset($url_to_print)){echo $url_to_print;}  ?></div>
<?php echo $content_bottom; ?></div>
<?php echo $footer; ?>