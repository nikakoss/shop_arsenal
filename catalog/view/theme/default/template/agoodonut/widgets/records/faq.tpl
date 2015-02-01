<?php if ($records) { ?>
<div class="box" id="cmswidget-<?php echo $cmswidget; ?>">
  <div class="box-heading"><?php echo $heading_title; ?></div>

    <?php foreach ($records as $record) {
    ?>
<div class="faq_box">
    <div class="faq_box_btn">
            <h2><?php echo $record['name']; ?></h2><span class="upper">Развернуть</span>
    </div>
    <div class="hidden_box">
        <?php echo $record['description']; ?>
    </div>
</div>
    <?php } ?>

	<?php if (isset ($settings_widget['pagination']) && $settings_widget['pagination'] ) { ?>
		<div class="pagination margintop5"><?php echo $pagination; ?></div>
		<?php } ?>
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
