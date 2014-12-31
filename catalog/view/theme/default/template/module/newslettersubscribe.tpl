


<form class="rss">
  <span class="h2class">Подпишитесь на рассылку</span>
  <div class="box-content" style="text-align: center;">
  
  <?php 
   if($thickbox) { ?>
	<a href="#frm_subscribe" title="Newsletter Subscribe" class="fancybox_sub"> <?php echo($text_subscribe); ?> </a>
  <?php }  ?>
  <?php 
   if($thickbox) { ?> <div id="frm_subscribe_hidden" style="display:none;"> <?php } ?>
  <div id="frm_subscribe">
  <form name="subscribe" id="subscribe"   >
  <table border="0" cellpadding="2" cellspacing="2">
   <tr>
     <td align="left"><span class="required">*</span>&nbsp;<?php echo $entry_email; ?><br /><div class="input-border"><input type="text" value="" name="subscribe_email" id="subscribe_email"></div></td>
   </tr>

   <?php 
     for($ns=1;$ns<=$option_fields;$ns++) {
     $ns_var= "option_fields".$ns;
   ?>
   <tr>
    <td align="left">
      <?php 
       if($$ns_var!=""){
         echo($$ns_var."&nbsp;<br/>");
         echo('<input type="text" value="" name="option'.$ns.'" id="option'.$ns.'">');
       }
      ?>
     </td>
   </tr>
   <?php 
     }
   ?>
   <tr>
     <td align="left">
     <a class="button" onclick="email_subscribe()"><span><?php echo $entry_button; ?></span></a><?php if($option_unsubscribe) { ?>
          <a class="button" onclick="email_unsubscribe()"><span><?php echo $entry_unbutton; ?></span></a>
      <?php } ?>    
     </td>
   </tr>
   <tr>
     <td align="center" id="subscribe_result"></td>
   </tr>
  </table>
  </form>
  </div>
  <?php if($thickbox) { ?> </div> <?php } ?>
 
  
  
  </form>
<script language="javascript">
	<?php 
  		if(!$thickbox) { 
	?>	
function email_subscribe(){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/subscribe',
			dataType: 'html',
            data:$("#subscribe").serialize(),
			success: function (html) {
				eval(html);
			}}); 
}
function email_unsubscribe(){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/unsubscribe',
			dataType: 'html',
            data:$("#subscribe").serialize(),
			success: function (html) {
				eval(html);
			}}); 
}
   <?php }else{ ?>
function email_subscribe(){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/subscribe',
			dataType: 'html',
            data:$("#subscribe").serialize(),
			success: function (html) {
				eval(html);
			}}); 
}
function email_unsubscribe(){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/unsubscribe',
			dataType: 'html',
            data:$("#subscribe").serialize(),
			success: function (html) {
				eval(html);
			}}); 
}
   <?php } ?>
   
$('.fancybox_sub').fancybox({
	width: 180,
	height: 180,
	autoDimensions: false
});
</script>

