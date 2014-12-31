<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
    <div class="line_razd"></div>
    	<div class="delwall">
				<a class="deleteWishAll" href="<?php echo $remove_all; ?>" >
					<span>Очистить избранное</span>
				</a>
			</div>
	<h1><?php echo $heading_title; ?></h1>

    <?php if ($products) { ?>

    <div class="sort_otobr product-filter clearfix">


        <div class="sort">Сортировка:
            <?php if ($get_sorts['rating']['asc']) { ?>
            <a class="active asc" href="<?php echo $sorts['rating']['desc']['href']; ?>">по рейтингу</a>
            <?php } elseif ($get_sorts['rating']['desc']) { ?>
            <a class="active desc" href="<?php echo $sorts['rating']['asc']['href']; ?>">по рейтингу</a>
            <?php } else { ?>
            <a href="<?php echo $sorts['rating']['asc']['href']; ?>">по рейтингу</a>
            <?php } ?>         


            <?php if ($get_sorts['price']['asc']) { ?>
            <a class="active asc" href="<?php echo $sorts['price']['desc']['href']; ?>">по цене</a>
            <?php } elseif ($get_sorts['price']['desc']) { ?>
            <a class="active desc" href="<?php echo $sorts['price']['asc']['href']; ?>">по цене</a>
            <?php } else { ?>
            <a href="<?php echo $sorts['price']['asc']['href']; ?>">по цене</a>
            <?php } ?>

            <?php if ($get_sorts['name']['asc']) { ?>
            <a class="active asc" href="<?php echo $sorts['name']['desc']['href']; ?>">по популярности</a>
            <?php } elseif ($get_sorts['name']['desc']) { ?>
            <a class="active desc" href="<?php echo $sorts['name']['asc']['href']; ?>">по популярности</a>
            <?php } else { ?>
            <a href="<?php echo $sorts['name']['asc']['href']; ?>">по популярности</a>
            <?php } ?>

        </div>

        <div class="otobr">Отображать по:
            <select onchange="location = this.value;">
                <?php foreach ($limits as $limits) { ?>
                <?php if ($limits['value'] == $limit) { ?>
                <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                <?php } ?>
                <?php } ?>
            </select>
            <span>товаров</span>
        </div>
    </div>

    <div class="pagination" ><?php echo $pagination; ?></div>
    <!--------------------------------------------wish list----------------------------------------------------->
    <div class="product-list">
        <?php foreach ($products as $product) { ?>
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
					<div class="cost"><?php echo $this->language->get('text_price'); ?>  <span><?php echo $product['price']; ?></span></div>
				<?php } else { ?>
					<div class="cost"><?php echo $this->language->get('text_price'); ?>  <span><?php echo $product['special']; ?></span></div>
					<div class="old_cost"><?php echo $this->language->get('text_old_price');?>:<span><?php echo $product['price']; ?></span></div>
					<?php if ($product['price_offset']) { ?>
						<div class="sale"><?php echo $this->language->get('text_price_offset');?>:<span><?php echo $product['price_offset']; ?></span></div>
					<?php } ?>
				<?php } ?>
				<div class="cart">
					<a href="javascript:void(0);" class="cart_but" onclick="addToCart(<?php echo $product['product_id']; ?>);"><?php echo $this->language->get('button_cart'); ?></a>
					<a class="one-click-order" product_id="<?php echo $product['product_id']; ?>" product_name="<?php echo $product['name']?>"
				  thumb="<?php echo $product['thumb']?>" product_href="<?php echo $product['href']?>" price="<?php if ($product['special']) { echo $product['special']; } else { echo $product['price']; }  ?>"><?php echo $this->language->get('text_one_click'); ?></a>

				</div>
			</div>			
		</div>
		<div class="reyting_compare clearfix">
			<div class="reyt">Рейтинг: <span>
                                <img class="rait_cl" src="catalog/view/theme/default/image/stars-<?php echo $product['rait_s'] . '.png'; ?>" alt="" />
                            </span>
                        </div>

			<div class="dob">
				<a class="addToCompare" href="javascript:void(0);" onclick="addToCompare('<?php echo $product['product_id']; ?>');">
					<?php echo $button_compare; ?>
				</a>
			</div>
			<div class="del">
				<a class="deleteWish" href="<?php echo $product['remove']; ?>" ><span>Удалить из избранного</span></a>
			</div>
		</div>
	</div>
    <?php } ?>
</div>
<!--------------------------------------------------------------------------------------------------------->
<div class="pagination" ><?php echo $pagination; ?></div>

<?php } else { ?>
<div class="content">Вы не выбрали ни одного товара в Избранное.</div>
<div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
</div>
<?php } ?>
</div>
<?php echo $footer; ?>