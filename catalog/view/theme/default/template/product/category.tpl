<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
	<div class="line_razd"></div>
	<span class="hclass"><?php echo $heading_title; ?></span>
	
	
	<?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/breadcrumb.tpl'); ?>
	
	<?php if ($thumb || $description) { ?>
	 
		<div class="line_razd_2"></div>
		<div class="oborydovanie_text clearfix">
			<?php if ($description) { ?>
				<div class="about-shop">
					<div>
					<?php echo $description; ?>
					</div>
				</div>
			<?php } ?>
			<?php if ($thumb) { ?>
				<div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
			<?php } ?>
			<div class="clear"></div>
			<a href="" class="more">Подробнее</a>
		</div>
		
	<?php } ?>
	<?php if ($categories) { ?>
	<span class="hclass">Типы оборудования</span>
	<div class="type clearfix list-categories">
	<?php if (count($categories) <= 5) { ?>
		<ul>
		  <?php foreach ($categories as $category) { ?>
		  <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
		  <?php } ?>
		</ul>
		<?php } else { ?>
		<?php for ($i = 0; $i < count($categories);) { ?>
		<ul>
		  <?php $j = $i + ceil(count($categories) / 3); ?>
		  <?php for (; $i < $j; $i++) { ?>
		  <?php if (isset($categories[$i])) { ?>
		  <li><a href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['name']; ?></a></li>
		  <?php } ?>
		  <?php } ?>
		</ul>
		<?php } ?>
	<?php } ?>
	</div>
        <div class="clearfix list-categories-more more-hide"><a href="javascript:void(0);" >Показать все</a></div>
	<?php } ?>

        
        
        
  <?php if ($products) { ?>
  
  <div class="sort_otobr product-filter clearfix">
 
      
      <div class="sort">Сортировка:
          
          <a class="rating-sort" href="">по рейтингу</a>
          <a class="price-sort" href="">по цене</a>
          <a class="review-sort" href="">по популярности</a>
   <?
   //var_dump($get_sorts['rating']);
   ?>
                        <?php /* if ($get_sorts['rating']['asc']) { ?>
				<a class="active asc" href="<?php echo $sorts['rating']['desc']['href']; ?>">по рейтингу</a>
			<?php } elseif ($get_sorts['rating']['desc']) { ?>
				<a class="active desc" href="<?php echo $sorts['rating']['asc']['href']; ?>">по рейтингу</a>
			<?php } else { ?>
				<a href="<?php echo $sorts['rating']['asc']['href']; ?>">по рейтингу</a>
			<?php } ?>         
                        
                        

			<?php if ($get_sorts['price']['asc']) { ?>
				<a class="active asc" href="<?php echo $sorts['price']['desc']['href']; ?>"><?php echo $txt_sorts['price']; ?></a>
			<?php } elseif ($get_sorts['price']['desc']) { ?>
				<a class="active desc" href="<?php echo $sorts['price']['asc']['href']; ?>"><?php echo $txt_sorts['price']; ?></a>
			<?php } else { ?>
				<a href="<?php echo $sorts['price']['asc']['href']; ?>"><?php echo $txt_sorts['price']; ?></a>
			<?php } ?>
                        
                        <?php if ($get_sorts['name']['asc']) { ?>
				<a class="active asc" href="<?php echo $sorts['name']['desc']['href']; ?>">по популярности</a>
			<?php } elseif ($get_sorts['name']['desc']) { ?>
				<a class="active desc" href="<?php echo $sorts['name']['asc']['href']; ?>">по популярности</a>
			<?php } else { ?>
				<a href="<?php echo $sorts['name']['asc']['href']; ?>">по популярности</a>
			<?php }  */ ?>
			
		</div>
		
		<div class="otobr filter-total-page">Отображать по:
			 <select onchange="select_total()">
				<?php foreach ($limits as $limits) { ?>
					<?php if ($limits['value'] == $limit) { ?>
					<option value="<?php echo $limits['text']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $limits['text']; ?>"><?php echo $limits['text']; ?></option>
					<?php } ?>
				<?php } ?>
			  </select>
			<span>товаров</span>
		</div>
	</div>
	
	<div class="pagination" ><?php echo $pagination; ?></div>
  
  <div class="product-list">
    <?php foreach ($products as $product) { ?>
		
		<?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/product_list.tpl'); ?>

    <?php } ?>
  </div>
  
  <div class="pagination"><?php echo $pagination; ?></div>
  
  <?php } ?>
  <?php if (!$categories && !$products) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
  <?php echo $category_banner;?>
  <?php if ($description1) { ?>
	<div  class="about-shop" id="decriptions"><div><?php echo $description1; ?></div></div>
<?php } ?>
  

  <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>