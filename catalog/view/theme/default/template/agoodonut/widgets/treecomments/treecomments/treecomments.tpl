<div id="<?php echo $prefix;?>icomments_<?php echo $mark_id; ?>">
<div class="container_reviews" id="<?php echo $prefix;?>container_reviews_<?php echo $mark;?>_<?php echo $mark_id;?>">
	<noindex>
	<div class="container_reviews_vars" style="display: none">
		<div class="mark"><?php echo $mark; ?></div>
		<div class="mark_id"><?php echo $mark_id; ?></div>
		<div class="theme"><?php echo $theme; ?></div>
		<div class="exec"></div>
		<div class="visual_editor"><?php echo $visual_editor; ?></div>
		<div class="mylist_position"><?php echo $this->registry->get('mylist_position');?></div>
		<div class="thislist"><?php echo base64_encode(serialize($thislist)); ?></div>
		<div class="text_wait"><?php echo $text_wait; ?></div>
		<div class="visual_rating"><?php echo $settings_widget['visual_rating']; ?></div>
        <div class="signer"><?php echo $settings_widget['signer']; ?></div>
        <div class="imagebox"><?php echo $imagebox; ?></div>
        <div class="prefix"><?php echo $prefix;?></div>
	</div>
	</noindex>

<?php  { ?>
<?php if (isset($settings_widget['visual_editor']) && $settings_widget['visual_editor']) { ?>
<script>CURLANG=WBBLANG['<?php echo $lang_code;?>'] || WBBLANG['en'] || CURLANG;</script>
<?php } ?>

	<?php if (isset($settings_widget['signer']) && $settings_widget['signer']) { ?>
		<div id="<?php echo $prefix;?>record_signer" class="marginbottom5">
			<div id="<?php echo $prefix;?>js_signer"  style="display:none;"></div>
			<form id="<?php echo $prefix;?>form_signer">

			<label>
			<input id="<?php echo $prefix;?>comments_signer" class="comments_signer" type="checkbox" <?php if (isset($signer_status) && $signer_status) echo 'checked'; ?>/>
			<a class="textdecoration_none comments_signer hrefajax fontsize_15">
			<?php echo $this->language->get('text_signer'); ?>
			</a>
			</label>

			</form>
		</div>
  	<?php } ?>

<a class="textdecoration_none" onclick="$('a[href=\'#tab-review\']').trigger('click');" href="<?php echo $href; ?>#<?php echo $prefix;?>comment-title"><ins class="fontsize_15 hrefajax textdecoration_none"><?php echo $this->language->get('text_write_review'); ?></ins></a>

  <div id="<?php echo $prefix;?>div_comment_<?php echo $mark_id; ?>" >

 

	    <div id="<?php echo $prefix;?>comment-title">
	    <a href="#"  id="<?php echo $prefix;?>comment_id_reply_0" class="comment_reply comment_buttons comments-title">
                <span id="<?php echo $prefix;?>reply_0" class="hrefajax text_write_review com_tt">Оставить свой комментарий</span>
	     </a>
	    </div>

   <div class="<?php echo $prefix;?>comment_work  add_comments" id="<?php echo $prefix;?>comment_work_0"></div>

   <div id="<?php echo $prefix;?>reply_comments" style="display:none" >

 <div id="<?php echo $prefix;?>comment_work_" class="<?php echo $prefix;?>form_customer_pointer width100 margintop10">
	<?php if (isset($customer_id) && !$customer_id)   { ?>
	<div id="form_customer_none" style="display:none;"></div>
		<div class="form_customer <?php echo $prefix;?>form_customer" id="<?php echo $prefix;?>form_customer" style="display:none;">
		      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
		        <div class="form_customer_content">
				  <a href="#" style="float: right;"  class="hrefajax"  onclick="$('.<?php echo $prefix;?>form_customer').hide('slide', {direction: 'up' }, 'slow'); return false;"><?php echo $this->language->get('hide_block'); ?></a>
		          <!-- <p><?php echo $text_i_am_returning_customer; ?></p> -->
		          <b><?php echo $entry_email; ?></b><br />
		          <input type="text" name="email" value="<?php echo $email; ?>" />
		          <br />
		          <br />
		          <b><?php echo $entry_password; ?></b><br />
		          <input type="password" name="password" value="<?php echo $password; ?>" />
		          <br />
		          <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a><br />
		          <br />
		          <input type="submit" value="<?php echo $button_login; ?>" class="button" />
				  <a href="<?php echo $register; ?>" class="marginleft10"><?php echo $this->language->get('error_register'); ?></a>
		          <?php if ($redirect) { ?>
		          <input type="hidden" name="redirect" value="<?php echo $redirect; ?>#tabs" />
		          <?php } ?>
		        </div>
		      </form>

		</div>
	<?php } ?>



   <form id="<?php echo $prefix;?>form_work_">    
<input type="text" class="comment_name" name="name"  placeholder="Ваше имя" <?php

    if (isset($customer_id) && $customer_id) {
     //echo 'readonly="readonly" style="background-color:#DDD; color: #555;"';
    }
    ?>>

  
    <div style="overflow: hidden; line-height:1px; margin-top: 5px;"></div>

<?php if (isset($fields) && !empty($fields)) { ?>
<div class="marginbottom5">

</div>

<div class="addfields" style="<?php if (!$fields_view) echo 'display: none;'; ?>">

<table style="width:100%;">
<?php
  foreach   ($fields as $af_name => $field) {
?>
<tr>
 <?php
    $template = '/image/'.$field['field_name'].'.png';
	if (file_exists(DIR_TEMPLATE . $theme . $template)) {
	?>
<td style="width: 16px;">


<img src="catalog/view/theme/<?php
			$template = '/image/'.$field['field_name'].'.png';
			if (file_exists(DIR_TEMPLATE . $theme . $template)) {
				$fieldspath = $theme . $template;
			} else {
				$fieldspath = 'default' . $template;
			}
			echo $fieldspath;
?>">



</td>
 <?php  } ?>

<td>
 
<?php
if ((isset($field['field_type']) && $field['field_type']=='textarea') || !isset($field['field_type'])) {
?>
<input name="af[<?php echo $field['field_name']; ?>]" id="comment_email" placeholder="E-mail" class="blog-record-textarea">
<?php
}
?>

<?php
if (isset($field['field_type']) && $field['field_type']=='text') {
?>
<input type="text" name="af[<?php echo $field['field_name']; ?>]" class="blog-record">
<?php
}
?>


</td>
</tr>
<?php  } ?>
</table>

</div>
<?php  } ?>

   <?php  if (isset($settings_widget['comment_must']) && $settings_widget['comment_must'])   {   ?>
    <br>

    <textarea placeholder="Комментарий" name="text" id="<?php echo $prefix;?>editor_" class=" comment-msg blog-record-textarea <?php echo $prefix;?>editor blog-textarea_height" cols="40"></textarea>

    <?php  } ?>

  <div class="bordernone overflowhidden margintop5 lineheight1"></div>





<?php if (isset($settings_widget['rating']) && $settings_widget['rating']) { ?>
     <b><ins class="color_entry_name"><?php echo $this->language->get('entry_rating_review'); ?></ins></b>&nbsp;&nbsp;
<?php if (isset($settings_widget['visual_rating']) && $settings_widget['visual_rating']) { ?>
<div style="height: 25px;">
    <input type="radio" class="visual_star" name="rating" alt="#8c0000" title="<?php echo $this->language->get('entry_bad'); ?> 1" value="1" >
    <input type="radio" class="visual_star" name="rating" alt="#8c4500" title="<?php echo $this->language->get('entry_bad'); ?> 2" value="2" >
    <input type="radio" class="visual_star" name="rating" alt="#b6b300" title="<?php echo $this->language->get('entry_bad'); ?> 3" value="3" >
    <input type="radio" class="visual_star" name="rating" alt="#698c00" title="<?php echo $this->language->get('entry_good'); ?> 4" value="4" >
    <input type="radio" class="visual_star" name="rating" alt="#008c00" title="<?php echo $this->language->get('entry_good'); ?> 5" value="5" >
   <div class="floatleft"  style="padding-top: 5px; "><b><ins class="color_entry_name marginleft10"><span id="hover-test" ></span></ins></b></div>
   <div  class="bordernone overflowhidden clearboth lineheight1"></div>
</div>
<?php } else { ?>
<span><ins class="color_bad"><?php echo $this->language->get('entry_bad'); ?></ins></span>&nbsp;
    <input type="radio"  name="rating" value="1" >
    <ins class="blog-ins_rating" style="">1</ins>
    <input type="radio"  name="rating" value="2" >
    <ins class="blog-ins_rating" >2</ins>
    <input type="radio"  name="rating" value="3" >
    <ins class="blog-ins_rating" >3</ins>
    <input type="radio"  name="rating" value="4" >
    <ins class="blog-ins_rating" >4</ins>
    <input type="radio"  name="rating" value="5" >
    <ins class="blog-ins_rating" >5</ins>
   &nbsp;&nbsp; <span><ins  class="color_good"><?php echo $this->language->get('entry_good'); ?></ins></span>
<?php } ?>

 <?php } else {?>
    <input type="radio" name="rating" value="5" checked style="display:none;">
    <?php } ?>


  <div class="bordernone overflowhidden margintop5 lineheight1"></div>

    <?php if ($captcha_status) { ?>
	    <div class="captcha_status"></div>
    <?php  } ?>

    <div class="buttons">
      <div class="left"><a class="button button-comment btn_form" id="<?php echo $prefix;?>button-comment-0"><span>Отправить</span></a></div>
    </div>

    </form>
   </div>


   </div>

    
    
   
        <div id="<?php echo $prefix;?>comment_<?php echo $mark_id; ?>" >

            <?php  echo $html_comment; ?>

        </div>
   

  </div>

  <?php } ?>


   <div class="overflowhidden">&nbsp;</div>

  </div>
  </div>


<script type="text/javascript">

$(document).ready(function(){


	<?php if (isset($settings_widget['anchor']) && $settings_widget['anchor']!='') { ?>



	var icomments_<?php echo $mark_id; ?> = $('#<?php echo $prefix;?>icomments_<?php echo $mark_id; ?>').html();
	<?php echo $settings_widget['anchor']; ?>(icomments_<?php echo $mark_id; ?>);
	$('#<?php echo $prefix;?>icomments_<?php echo $mark_id; ?>').hide('slow').remove();
   <?php  } ?>

	<?php  if (isset($this->request->get['page'])) { ?>
	$('a[href=\'#tab-review\']').trigger('click');
	<?php  } ?>


var url = location.href, idx = url.indexOf("#")
var hash = idx != -1 ? url.substring(idx+1) : "";

if (hash!='') {
	$('a[href=\'#tab-review\']').trigger('click');
	var scrollto = $('#'+hash).offset().top;
	 $('html, body').animate({
	        scrollTop: scrollto
	    }, 1000);
}



	imageboxinit('<?php echo $imagebox; ?>');

    $('#<?php echo $prefix;?>comment_id_reply_0').click();

});
</script>
