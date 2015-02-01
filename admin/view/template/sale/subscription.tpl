<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/customer.png" alt="" /> <?php echo $heading_title; ?></h1>
      
    </div>

    <div class="content">
        <table class="list">
          <thead>
            <tr>
			  <td class="left">ID</td>
              <td class="left">Имя</td>
              <td class="left">Email</td>
			  <td class="left"></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($subscription) { ?>
            <?php foreach ($subscription as $subscript) { ?>
            <tr>
			  <td class="left"><?php echo $subscript['id_sub']; ?></td>
              <td class="left"><?php echo $subscript['name_sub']; ?></td>
              <td class="left"><?php echo $subscript['email_sub']; ?></td>
			  <td class="left">
			  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" >
				<?php if($subscript['sub_active']  == 1) { ?> 
					<input type="hidden" value="<?php echo $subscript['id_sub']; ?>" name="sub_id" />
					<input type="hidden" value=0 name="val_sub" />
					<input type="submit" name="butt_sub" value="Отписать" />
				<?php } else { ?>
					<input type="hidden" value="<?php echo $subscript['id_sub']; ?>" name="sub_id" />
					<input type="hidden" value=1 name="val_sub" />
					<input type="submit" name="butt_sub" class="del_sub" value="Подписать" />
				<?php } ?>
			  </form>
			  </td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="8"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      
    </div>
  </div>
</div>
<?php echo $footer; ?>