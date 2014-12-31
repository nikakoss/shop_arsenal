<?php echo $header; ?>
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
    
    <form action="<?php echo $action; ?>" class="simplecheckout-customer-password" method="post" enctype="multipart/form-data">   
    <div class="simpleregister-block-content simplecheckout-customer">
      <table class="form form-password">
        <tr>
          <td class="simplecheckout-customer-left"><span class="required">*</span> <?php echo $entry_password; ?></td>
          <td class="simplecheckout-customer-right"><input type="password" name="password" value="<?php echo $password; ?>" />
            <?php if ($error_password) { ?>
            <span class="error"><?php echo $error_password; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td class="simplecheckout-customer-left"><span class="required">*</span> <?php echo $entry_confirm; ?></td>
          <td class="simplecheckout-customer-right"><input type="password" name="confirm" value="<?php echo $confirm; ?>" />
            <?php if ($error_confirm) { ?>
            <span class="error"><?php echo $error_confirm; ?></span>
            <?php } ?></td>
        </tr>
      </table>
    </div>
    <div class="buttons">
      <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
      <div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="button" /></div>
    </div>
  </form>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>