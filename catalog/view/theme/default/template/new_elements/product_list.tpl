<span id="preloader" style="display:none;"><img src="http://kuvalda.net/image/data/712.gif" /></span>
	<div class="tovar">
		<h4>
			<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?> <div class="clearfix"></div></a>
		</h4>
		
		<div class="kod">Код товара: <?php echo $product['product_id']; ?></div>
			<?php if ($product['thumb']) { ?>
				<a href="<?php echo $product['href']; ?>" class="catalog_image">
					<img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
				</a>
			<?php } ?>

		<div class="text_opisanie">
			<?php if ($product['attributes']) { ?>
				
					<?php foreach ($product['attributes'] as $attribute_group) { ?>
						<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
							<div>
								<?php echo $attribute['name']; ?>: 
								<span><?php echo $attribute['text']; ?></span>
							</div>
						<?php } ?>
					<?php } ?>
			<?php } ?>
		</div>
		
		
		<div class="cena_credit">
			<div class="cena clearfix">
				<?php if (!$product['special']) { ?>
					<div class="cost"><?php echo $this->language->get('text_price'); ?>  <span><?php echo $product['price']; ?></br></span>
					<span id="za_un"><?php if(!empty($product['unit'])) { ?>за <?php echo $product['unit']; ?>.<?php } ?></span></div>
				<?php } else { ?>
					<div class="cost"><?php echo $this->language->get('text_price'); ?>  <span><?php echo $product['special']; ?></span></div>
					<div class="old_cost"><?php echo $this->language->get('text_old_price');?>:<span><?php echo $product['price']; ?><?php if(!empty($product['unit'])) { ?>за <?php echo $product['unit']; ?>.<?php } ?></span></div>
					<?php if ($product['price_offset']) { ?>
						<div class="sale"><?php echo $this->language->get('text_price_offset');?>:<span><?php echo $product['price_offset']; ?><?php if(!empty($product['unit'])) { ?>за <?php echo $product['unit']; ?>.<?php } ?></span></div>
					<?php } ?>
				<?php } ?>
				<div class="cart">
					<a href="javascript:void(0);" class="cart_but" onclick="addToCart(<?php echo $product['product_id']; ?>);"><?php echo $this->language->get('button_cart'); ?></a>
					<a class="one-click-order" product_id="<?php echo $product['product_id']; ?>" product_name="<?php echo $product['name']?>"
				  thumb="<?php echo $product['thumb']?>" unit="<?php if(!empty($product['unit'])) { ?> за <?php echo $product['unit']; ?>.<?php } ?>" product_href="<?php echo $product['href']?>" price="<?php if ($product['special']) { echo $product['special']; } else { echo $product['price']; }  ?>"><?php echo $this->language->get('text_one_click'); ?></a>

				</div>
			</div>			
		</div>
		<div class="reyting_compare clearfix">
			<div class="reyt">Рейтинг: <span>
                                <img class="rait_cl" src="catalog/view/theme/default/image/stars-<?php echo $product['rait_s'] . '.png'; ?>" alt="" />
                            </span>
                        </div>
			<div class="izbr">
				<a class="addToWishList" href="javascript:void(0);" onclick="addToWishList('<?php echo $product['product_id']; ?>');">
					<?php echo $button_wishlist; ?>
                                </a>
			</div>
			<div class="dob">
				<a class="addToCompare" href="javascript:void(0);" onclick="addToCompare('<?php echo $product['product_id']; ?>');">
					<?php echo $button_compare; ?>
				</a>
			</div>
		</div>
	</div>