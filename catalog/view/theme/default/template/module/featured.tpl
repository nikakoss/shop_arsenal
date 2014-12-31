<div class="box">
  <h3><?php echo $heading_title; ?></h3>
		<div class="tab-content slider clearfix nopadding">
			<ul id="featured-module" class="jcarousel-skin-opencart">
				<?php foreach ($products as $product) { ?>
					<li>
						<?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/product_grid.tpl'); ?>
					</li>
				<?php } ?>
			</ul>
		</div>
</div>

<script type="text/javascript">
$('#featured-module').jcarousel({
	vertical: false,
	visible: 3,
	scroll: 1
});
</script> 