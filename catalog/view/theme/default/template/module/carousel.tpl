<div class="brand-slider">
	<h2>Каталог брендов</h2>
	<div class="brand-slider-content">
		<ul class="jcarousel-skin-opencart" id="carousel<?php echo $module; ?>">
			<?php foreach ($banners as $banner) { ?>
				<li><a href="javascript:void(0);"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a></li>
			<?php } ?>
		</ul>
	</div>
</div>
<script type="text/javascript"><!--
$('#carousel<?php echo $module; ?>').jcarousel({
	vertical: false,
	visible: <?php echo $limit; ?>,
	scroll: <?php echo $scroll; ?>
});
//--></script>
