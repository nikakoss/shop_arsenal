
 <?php
 if ($records) {
 ?>
<div class="news_article latest-news" id="cmswidget-<?php echo $cmswidget; ?>">
 <h2><?php echo $heading_title; ?></h2>
	<div class="clearfix">

    <?php foreach ($records as $record) { ?>
    <div class="news_1 clearfix" >
	
	
	      <?php if ($record['thumb'] || count($record['images']) > 0) { ?>
      
      <?php if ($record['thumb']) { ?>
     
      <img src="<?php echo $record['thumb']; ?>" title="<?php echo $record['name']; ?>" alt="<?php echo $record['name']; ?>" />
      
       <?php } ?>
      <?php if (isset ($record['settings_blog']['images_view']) && $record['settings_blog']['images_view'] ) { ?>
      <?php if (isset ($record['settings']['images_view']) && $record['settings']['images_view'] ) { ?>
      <?php foreach ($record['images'] as $numi => $images) { ?>
     
	
	<img alt="<?php echo $images['title']; ?>" title="<?php echo $images['title']; ?>" src="<?php echo $images['thumb']; ?>">
	
	

      <?php } ?>
      <?php } ?>
      <?php } ?>
      
      <?php } ?>
	
	
	<div class="opisanie_news">

				   <?php if (isset ($record['settings_blog']['view_date']) && $record['settings_blog']['view_date'] ) { ?> 
				    <?php if (isset ($record['settings']['view_date']) && $record['settings']['view_date'] ) { ?>
				      <?php if ($record['date_available']) { ?>
				        <span><?php echo $record['date_available']; ?></span>
				      <?php } ?>
				    <?php } ?>
				    <?php } ?>


     

					    <a href="<?php echo $record['href']; ?>"><?php echo $record['name']; ?></a>

    






          	<?php echo $record['description']; ?>&nbsp;
          	<a href="<?php echo $record['href']; ?>" class="blog_further"><?php if (isset($settings_general['further'][$this->config->get('config_language_id')])) echo html_entity_decode($settings_general['further'][$this->config->get('config_language_id')]); ?></a>
			
				</div>

     <div class="overflowhidden width100 lineheight1">&nbsp;</div>
      <div>


				    <?php if (isset ($record['settings_blog']['view_rating']) && $record['settings_blog']['view_rating'] ) { ?>
				    <?php if (isset ($record['settings']['view_rating']) && $record['settings']['view_rating'] ) { ?>
				      <?php if ($record['rating']) { ?>
				      <div class="rating">
     <?php
      $themeFile = $this->getThemeFile('image/blogstars-'.$record['rating'].'.png');
      if ($themeFile) {
      ?>
      <img style="border: 0px;"  title="<?php echo $record['rating']; ?>" alt="<?php echo $record['rating']; ?>" src="catalog/view/theme/<?php echo $themeFile; ?>">
     <?php } ?>
				      </div>
				      <?php } ?>
				    <?php } ?>
				    <?php } ?>

     <div>
				       <?php if (isset ($record['settings_blog']['view_comments']) && $record['settings_blog']['view_comments'] ) { ?>
					      <?php if ($record['settings_comment']['status']) { ?>
					      <?php if (isset ($record['settings']['view_comments']) && $record['settings']['view_comments'] ) { ?>
					      <div class="blog-light-small-text"><?php echo $text_comments; ?> <?php echo $record['comments']; ?></div>
					      <?php } ?>
				       <?php } ?>
				       <?php } ?>

				        <?php if (isset ($record['settings_blog']['view_viewed']) && $record['settings_blog']['view_viewed'] ) { ?>
				        <?php if (isset ($record['settings']['view_viewed']) && $record['settings']['view_viewed'] ) { ?>
					      <div class="blog-light-small-text"><?php echo $text_viewed; ?> <?php echo $record['viewed']; ?></div>
				        <?php } ?>
				        <?php } ?>
      </div>

      
      </div>

    </div>
    <?php } ?>

 		<?php if (isset ($settings_widget['pagination']) && $settings_widget['pagination'] ) { ?>
		<div class="pagination margintop5"><?php echo $pagination; ?></div>
		<?php } ?>
 </div>
 
 					    <?php
					    //if (isset ($record['settings_blog']['category_status']) && $record['settings_blog']['category_status'] ) {
					    ?>
					    <?php if (isset ($record['settings']['category_status']) && $record['settings']['category_status'] ) { ?>
					    <a href="<?php echo $record['blog_href']; ?>">Все <?php echo $record['blog_name']; ?></a>
					    <?php } ?>
					    <?php
					    //	}
					    ?>
 

</div>

<?php if (isset($settings_widget['anchor']) && $settings_widget['anchor']!='') { ?>
<script>
$(document).ready(function(){

	var data = $('#cmswidget-<?php echo $cmswidget; ?>').html();
	<?php echo $settings_widget['anchor']; ?>;
    delete data;
	$('#cmswidget-<?php echo $cmswidget; ?>').hide('slow').remove();

});
</script>
 <?php  } ?>

  <?php } ?>