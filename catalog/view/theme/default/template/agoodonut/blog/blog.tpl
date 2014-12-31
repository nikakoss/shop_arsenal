<?php echo $header; ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
<div class="line_razd"></div>
	<h3><?php echo $heading_title; ?></h3>
	
	<?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/breadcrumb.tpl'); ?>
	
    <?php if (isset ($settings_blog['view_rss']) && $settings_blog['view_rss'] ) { ?>
    <a href="<?php echo $url_rss; ?>" class="floatright"><img style="border: 0px;"  title="RSS" alt="RSS" src="catalog/view/theme/<?php
			$template = '/image/rss24.png';
			if (file_exists(DIR_TEMPLATE . $theme . $template)) {
				$rsspath = $theme . $template;
			} else {
				$rsspath = 'default' . $template;
			}
			echo $rsspath;
?>"></a>
    <?php } ?>

  <?php if ($description) {
  ?>
  <div class="blog-info">
    <?php if ($thumb && $description) { ?>
    <div class="image blog-image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
    <?php } ?>
    <?php if ($description) { ?>
    <div class="blog-description">
    <?php echo $description; ?>
    </div>
    <?php } ?>
  </div>
  <?php } ?>

 <div class="line_razd_2"></div>

  <?php if ($categories) { ?>
  <h3>Категории статей</h3>
  <div class="type clearfix" >
    <?php if (count($categories) <= 2) { ?>
    <ul>
      <?php foreach ($categories as $blog) { ?>
      <li>
      <?php if (isset($blog['thumb']) && $blog['thumb']!='') { ?>
      <img src="<?php echo $blog['thumb']; ?>">
	  <?php  } ?>
      <a href="<?php echo $blog['href']; ?>"><?php echo $blog['name']; ?></a>
      </li>
      <?php } ?>
    </ul>
    <?php } else { ?>
    <?php for ($i = 0; $i < count($categories);) { ?>
    <ul>
      <?php $j = $i + ceil(count($categories) / 3); ?>
      <?php for (; $i < $j; $i++) { ?>
      <?php if (isset($categories[$i])) { ?>
      <li>

      <?php if (isset($categories[$i]['thumb']) && $categories[$i]['thumb']!='') { ?>
      <img src="<?php echo $categories[$i]['thumb']; ?>">
	  <?php  } ?>

      <a href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['name']; ?></a></li>
      <?php } ?>
      <?php } ?>
    </ul>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>





  <?php if ($records) { ?>
  <div class="news-canalog pages-ctalog">
    <?php foreach ($records as $record) {

    ?>
    <div>
      <?php if ($record['thumb']) { ?>
      <div class="image blog-image">
      <div>
      <a href="<?php echo $record['href']; ?>"><img src="<?php echo $record['thumb']; ?>" title="<?php echo $record['name']; ?>" alt="<?php echo $record['name']; ?>" /></a>
      </div>
      <?php if (isset ($record['settings_blog']['images_view']) && $record['settings_blog']['images_view'] ) { ?>
      <?php foreach ($record['images'] as $numi => $images) { ?>
     <div class="image blog-image">
	<a class="imagebox" rel="imagebox" title="<?php echo $images['title']; ?>" href="<?php echo $images['popup']; ?>">
	<img alt="<?php echo $images['title']; ?>" title="<?php echo $images['title']; ?>" src="<?php echo $images['thumb']; ?>">
	</a>
	</div>

      <?php } ?>
      <?php } ?>


      </div>
      <?php } ?>
<div class="blog-date_container">    
  
     
      
      <?php  if ($record['settings_blog']['view_date']) { ?>

      <?php if ($record['date_available']) { ?>
      <div class="blog-date"><?php echo $record['date_available']; ?></div>
      <?php } ?>

      <?php } ?>
   
    <?php if (isset ($record['settings_blog']['view_rating']) && $record['settings_blog']['view_rating'] ) { ?>
      <?php if ($record['rating']) { ?>
      <div class="rating blog-rate_container">
     <?php
      $themeFile = $this->getThemeFile('image/blogstars-'.$record['rating'].'.png');
      if ($themeFile) {
      ?>
      <img   title="<?php echo $record['rating']; ?>" alt="<?php echo $record['rating']; ?>" src="catalog/view/theme/<?php echo $themeFile; ?>"> 
     <?php } ?>
      </div>
      <?php } ?>
    <?php } ?>
      </div>
	  
	       <div class="name marginbottom5">
    <?php if (isset ($record['settings']['category_status']) && $record['settings']['category_status'] ) { ?>
    <?php if (isset ($record['settings_blog']['category_status']) && $record['settings_blog']['category_status'] ) { ?>
    <a href="<?php echo $record['blog_href']; ?>" class="blog-title blog-record-list"><?php echo $record['blog_name']; ?></a><ins class="blog-arrow">&nbsp;&rarr;&nbsp;</ins>
    <?php } ?>
    <?php } ?>

    <a href="<?php echo $record['href']; ?>" class="blog-title blog-record-list"><?php echo $record['name']; ?></a>
     </div>

          	<div class="description record_description"><?php echo $record['description']; ?>&nbsp;<a href="<?php echo $record['href']; ?>" class="blog_further"><?php if (isset($settings_general['further'][$this->config->get('config_language_id')])) echo html_entity_decode($settings_general['further'][$this->config->get('config_language_id')]); ?></a></div>
    </div>
    <?php } ?>
  </div>



  <div class="pagination margintop5"><?php echo $pagination; ?></div>
    <?php } ?>
  <?php if (!$categories && !$records) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?>

  </div>
<?php echo $footer; ?>