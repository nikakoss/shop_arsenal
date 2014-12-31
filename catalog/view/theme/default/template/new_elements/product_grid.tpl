<div class="product-grid">
    
    <div class="related-products">
	<?php if ($product['thumb']) { ?>
        
        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="product_image ">
       
	<?php }else{ ?>
           <img src="image/cache/no_image-150x110.jpg" alt="<?php echo $product['name']; ?>" class="product_image ">  
          
        <?php } ?>
         
	<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
	</div>

		<div class="price new-element-price">
			<?php if (!$product['special']) { ?>
				<span><span>Цена:</span><strong><?php echo $product['price']; ?><?php if(!empty($product['unit'])) { ?> за <?php echo $product['unit']; ?>.<?php } ?></strong></span>
			<?php } else { ?>
				<span><span>Цена:</span><strong><?php echo $product['special']; ?><?php if(!empty($unit)) { ?> за <?php echo $unit; ?>.<?php } ?></strong></span>
				<span><span>Старая цена:</span><strike><?php echo $product['price']; ?></strike></span>
				<?php if (isset($product['price_offset']) && $product['price_offset']) { ?>
				<span><span>Скидка:</span><?php echo $product['price_offset']; ?></span>
				<?php } ?>
			<?php } ?>
		</div>

	<div class="in-cart">
		<a href="javascript:void(0);" class="cart_but" onclick="addToCart(<?php echo $product['product_id']; ?>);"><?php echo $this->language->get('button_cart'); ?></a>
		
		<a class="one-click-order" product_id="<?php echo $product['product_id']; ?>" product_name="<?php echo $product['name']?>" unit="<?php if(!empty($product['unit'])) { ?> за <?php echo $product['unit']; ?>.<?php } ?>"
				  thumb="<?php echo $product['thumb']?>" product_href="<?php echo $product['href']?>" price="<?php if ($product['special']) { echo $product['special']; } else { echo $product['price']; }  ?>"><?php echo $this->language->get('text_one_click'); ?></a>

	</div>
</div>