 <?php
 if ($records) {
 ?>
<div class="box" id="cmswidget-<?php echo $cmswidget; ?>">
 	<div class="box-content">
	<div class="blog-record-list-small">
	<?php $ii = 0; ?>
    <?php foreach ($records as $record) { ?>
	<?php $ii++; ?>
    <div class="newsmn">
	  <div class="name">
	    <a href="<?php echo $record['href']; ?>" class="blog-title"><?php echo $record['name'] . $ii; ?></a>
     </div>
	 
	 <?php if ($record['thumb'] || count($record['images']) > 0) { ?>
      <div class="image">
      <a href="<?php echo $record['href']; ?>"><img src="<?php echo $record['thumb']; ?>" title="<?php echo $record['name']; ?>" alt="<?php echo $record['name']; ?>" /></a>
      </div>
      <?php } ?>			    
		
	 <div class="blog-date"><?php echo $record['date_available']; ?></div>
	 <div class="description"><?php echo $record['description']; ?></div>

    </div>
    <?php } ?>
  </div>

 		<?php if (isset ($settings_widget['pagination']) && $settings_widget['pagination'] ) { ?>
		<div class="pagination margintop5"><?php echo $pagination; ?></div>
		<?php } ?>
		
 </div>
</div>
<div class="overflowhidden lineheight1 width100">&nbsp;</div>
  <?php } ?>
    <div class='podnb'>
	<a href="http://sb-arsenal.ru/news/">ВСЕ НОВОСТИ</a>
  </div>
  <div class="overflowhidden lineheight1 width100">&nbsp;</div>