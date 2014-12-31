<?php echo $header; ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content" class="clearfix personal_base"><?php echo $content_top; ?>
  <div class="dashboard-header clearfix">
        <div class="left">
            <h4><?php echo $heading_title; ?></h4>	
            <?php if (isset($breadcrumbs) && $breadcrumbs) { ?>
	<ul class="bread_crumbs clearfix">
		<?php foreach ($breadcrumbs as $breadcrumb) {   ?>
			<li>
				<a href="<?php echo $breadcrumb['href']; ?>">
					<?php echo $breadcrumb['text']; ?>
				</a>
			</li>
		<?php } ?>
	</ul>
        <?php } ?>
        </div>
    </div>
    <div class="dashboard-content">
       <h3><?php echo $text_address_book; ?></h3> 
    </div>
    
    
  <?php  foreach ($addresses as $result) { ?>
  <div class="content">
    <table style="width: 100%;">
      <tr>
        <td><?php echo $result['address']; ?> 
            <?php if($default_address==$result['address_id']){ ?><div class="default_address">Основной адрес</div> <?php } ?> </td>
        <td style="text-align: right;"> <a href="<?php echo $result['update']; ?>" class="button"><?php echo $button_edit; ?></a> &nbsp; <a href="<?php echo $result['delete']; ?>" class="button"><?php echo $button_delete; ?></a></td>
      </tr>
    </table>
  </div>
  <?php } ?>
  <div class="buttons">
    <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
    <div class="right"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_new_address; ?></a></div>
  </div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>