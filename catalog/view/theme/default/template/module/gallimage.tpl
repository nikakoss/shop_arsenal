<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-product sert_di">
  <?php foreach ($gallimages as $gallimage) { ?>
  
  <?php if ($gallimage['link']) { ?>
  
      <a href="<?php echo $gallimage['popup']; ?>" title="<?php echo $gallimage['title']; ?>" class="colorbox<?php echo $module; ?>">
          <img src="<?php echo $gallimage['image']; ?>" alt="<?php echo $gallimage['title']; ?>" title="<?php echo $gallimage['title']; ?>" /></a>
  
  <?php if ($gallimage['title']) { ?>
  <div class="name"><a href="<?php echo $gallimage['link']; ?>"><?php echo $gallimage['title']; ?></a></div>
  <?php } ?>
  <?php } else { ?>
  <a href="<?php echo $gallimage['popup']; ?>" title="<?php echo $gallimage['title']; ?>" class="colorbox<?php echo $module; ?>">
  <img src="<?php echo $gallimage['image']; ?>" alt="<?php echo $gallimage['title']; ?>" title="<?php echo $gallimage['title']; ?>" /></a>
  <?php if ($gallimage['title']) { ?>
  <div class="name"><?php echo $gallimage['title']; ?></div>
  <?php } ?>
  <?php } ?>
  
  <?php } ?>
	</div>
  </div>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox<?php echo $module; ?>').colorbox({
		overlayClose: true,
		opacity: 0.5,
		rel: "colorbox"
	});
});
//--></script> 

