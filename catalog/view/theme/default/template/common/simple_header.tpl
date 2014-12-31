<?php echo $header; ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content" class="cart-checkout"><?php echo $content_top; ?>
    
    <h3><?php echo $heading_title; ?></h3>
     <?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/breadcrumb.tpl'); ?>
    <div class="line_razd_2"></div>
    <?php if (isset($error_warning)) { ?> 
        <?php if ($error_warning) { ?>
            <div class="warning"><?php echo $error_warning; ?></div>
        <?php } ?>
    <?php } ?>
    
