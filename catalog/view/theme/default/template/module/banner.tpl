<div id="banner<?php echo $module; ?>" class="banner" banner-id="<?php echo $module; ?>" style="position:relative; height: 330px;">

	  <?php foreach ($banners as $banner) { ?>
	  
		<?php if ($banner['product']) { ?>
			<div class="slider_block clearfix">
				<div class="slider clearfix" style="position:relative;">
					<div class="bunner_left"><img onclick="location = '<?php echo $banner['link']; ?>';" src="<?php echo $banner['image']; ?>" border="0" alt="" /></div>
					<div class="bunner_right">
						<?php if (isset($banner['product']['thumbnail'])) { ?>
							<img src="<?php echo $banner['product']['thumbnail']; ?>" border="0" alt="" />
						 <?php } ?>
                                               
                                                 <?php if (isset($banner['product']['name'])) { ?>
                                                 <div class="name-banner">
						<a href="<?php echo $banner['link']; ?>"><?php echo $banner['product']['name']; ?></a>
                                                </div>
                                                <?php }?>
						<div class="add">
							<div class="line_razd_2"></div>                                                        
							<?php if (isset($banner['product']['current_price'])) { ?>
                                                        <div><span><?php echo $this->language->get('text_price'); ?></span> <?php echo $banner['product']['current_price']; ?><?php if(!empty($banner['product']['unit'])) { ?> за <?php echo $banner['product']['unit']; ?>.<?php } ?></div>
                                                        <?php } ?>
							<a class="cart_but myNewPointer" onclick="addToCart(<?php echo $banner['product']['product_id']; ?>);"><?php echo $this->language->get('button_cart'); ?></a>
						</div>
					</div>
				</div>
			</div>
		<?php } else { ?>
			  <?php if ($banner['link']) { ?>
			  <div><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a></div>
			  <?php } else { ?>
			  <div><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></div>
			  <?php } ?>
			  
		  <?php } ?>
	  <?php } ?>
</div>

<div class="clearfix"></div>
<script type="text/javascript"><!--

$('#banner<?php echo $module; ?> div:first-child').css('display', 'block');

banner(<?php echo $module; ?>);

//--></script>
