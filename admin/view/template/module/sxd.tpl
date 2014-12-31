<?php echo $header; ?>
<div id="content">
  
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
        <a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a>
        <a href="<?php echo $author_link; ?>" class="button" target="_blank"><?php echo $author_text; ?></a>
      </div>
    </div>
    <div class="content">
	
		<script>
			function downloadSxdDump() {
				var selected = $('#sxd_frame').contents().find('#main_div #tab_files tr.sel td:first').attr('title');

				if (typeof selected == 'undefined') {
					alert('<?php echo $error_select_dump; ?>');
					return false;
				}
				
				var title = selected.split("\n");
				var file = title[1];
				var download_path = '<?php echo $download_link; ?>&file='+encodeURIComponent(file);
				window.open(download_path, '_blank');
				
			}
		</script>
		
		<iframe id="sxd_frame" src="<?php echo $sxd_link; ?>" width="99%" height="600"></iframe>
            
    </div>
  </div>
</div>
<?php echo $footer; ?>
