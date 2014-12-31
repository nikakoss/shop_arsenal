<?php if (!$this->customer->isLogged()) : ?>
<div class="popup">
<div class="popup-shadow"></div>
 <div class="popup-container">
<img onclick="$.colorbox.close();" class="x" src="image/kuvalda/x.png" alt="">
<h2><?php echo $heading_title; ?></h2>
  

 
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="module_login"> 
	
	
	<div class="cbContent callback">
    
    <div class="big-input-border"><input required placeholder="<?php echo $entry_email_address; ?>"  type="text"  name="email" ></div>
    
      <div class="big-input-border"><input type="text"  placeholder="<?php echo $entry_password; ?>" type="password" name="password" /></div>
        
    <div class="cbbutton"><a onclick="$('#module_login').submit();" class="button"><?php echo $button_login; ?></a></div>
    <a href="<?php echo $this->url->link('account/login', '', 'SSL');?>" class="button"><span><?php echo $button_create; ?></span></a>
    
    
 
   
   
   	<a class="edit-button"  onclick="$('#forgotten').slideToggle('slow');" href="javascript:l_image ('<?php echo $forgotten; ?>')"><?php echo $text_forgotten; ?></a>
<script type="text/javascript"> function l_image (a) {document.getElementById("example_frame").src=a;} </script>
	<div id="forgotten" style="display:none" >
		<iframe id="example_frame" src="" ></iframe>
		
	</div>
   
   
   </div>
    </form>
    
  </div>
 </div>

<?php else: ?>
    <div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content" >
	<?php echo $text_logged; ?><br /><br />
    <div style="float:left; text-align: right;"><a href="<?php echo $account; ?>" class="button"><span><?php echo $text_account; ?></span></a></div><br />
	<div style="float:left; text-align: right;"><a href="<?php echo $button_logout_url; ?>" class="button"><span><?php echo $button_logout; ?></span></a></div>
    <br style="clear:both;"/>

  </div>
 </div>

<?php endif ?>
