<div class="slider_block tab-slider clearfix" id="all-tabs-<?php echo $module; ?>" style="margin-top: 40px; margin-bottom: 40px;">

	<div id="tabs-<?php echo $module; ?>" class="htabs clearfix">
		<?php if($latest_products){ ?>
		<a data-js="jcarousel" href="#tab-latest-<?php echo $module; ?>"><?php echo $tab_latest; ?></a>
		<?php } ?>
		<?php if($featured_products){ ?>
		<a data-js="jcarousel" href="#tab-featured-<?php echo $module; ?>"><?php echo $tab_featured; ?></a>
		<?php } ?>
		<?php if($bestseller_products){ ?>
		<a data-js="jcarousel" href="#tab-bestseller-<?php echo $module; ?>"><?php echo $tab_bestseller; ?></a>
		<?php } ?>
		<?php if($special_products){ ?>
		<a data-js="jcarousel" href="#tab-special-<?php echo $module; ?>"><?php echo $tab_special; ?></a>
		<?php } ?>
	 </div>
	 
	<?php if ($latest_products){ ?>
	 <div id="tab-latest-<?php echo $module; ?>" class="tab-content slider clearfix nopadding">
		<ul class="jcarousel-skin-opencart">
			<?php foreach ($latest_products as $product) { ?>
				<li>
					<?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/product_grid.tpl'); ?>
				</li>
			<?php } ?>
		</ul>
	 </div>
	<?php } ?>
	
	<?php if ($featured_products){ ?>
	  <div id="tab-featured-<?php echo $module; ?>" class="tab-content slider clearfix nopadding">
		<ul class="jcarousel-skin-opencart">
		  <?php foreach ($featured_products as $product) { ?>
			<li>
				<?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/product_grid.tpl'); ?>
			</li>
		  <?php } ?>
		</ul>
	 </div>
	<?php } ?>

	<?php if ($bestseller_products){ ?>
	 <div id="tab-bestseller-<?php echo $module; ?>" class="tab-content slider clearfix nopadding">
		<ul class="jcarousel-skin-opencart">
			<?php foreach ($bestseller_products as $product) { ?>
				<li>
					<?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/product_grid.tpl'); ?>
				</li>
			<?php } ?>
		</ul>
	 </div>
	<?php } ?>

	<?php if( $special_products){ ?>
	 <div id="tab-special-<?php echo $module; ?>" class="tab-content slider clearfix nopadding">
		<ul class="jcarousel-skin-opencart">
		  <?php foreach ($special_products as $product) { ?>
				<li>
					<?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/product_grid.tpl'); ?>
				</li>
		  <?php } ?>
		</ul>
	 </div>
	<?php } ?>

</div>

<script type="text/javascript">
$('#tabs-<?php echo $module; ?> a').tabs();

$('#all-tabs-<?php echo $module; ?> .tab-content ul.jcarousel-skin-opencart').eq(0).jcarousel({
	vertical: false,
	visible: 3,
	scroll: 1
});

</script> 