<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div class="contact-page content clearfix">
    <?php echo $content_top; ?>
 <div class="line_razd"></div> 
	<h3><?php echo $heading_title; ?></h3>
	
	<?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/breadcrumb.tpl'); ?>
	
  
  <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>