<form class="rss">
<h2>Подпишитесь на рассылку</h2>
       
        <?php echo $text_array['ani_label_title']; ?>
        <div class="input-border"><input type="text" name="aninews_email" id="aninews_email" value="" class="large-field" placeholder="<?php echo $text_array['ani_placeholder_text']; ?>" /></div>
        <div id="aninews_error"></div>
       <button class="newsform-btn-field" id="save_email_for_aninews"><?php echo $text_array['ani_button_text']; ?></button>
       
   
</form>



<script type="text/javascript">
$(document).ready(function() {	
	$("#ani_content").animate({
		bottom: 10,
		right: 10
		},1500,function(){ 
		//alert("ADONE"); 
	});
	
	$("#save_email_for_aninews").click(function(){
		if($("#aninews_email").val() == ""){
			$("#aninews_error").html("<span style='color:#fff;font-size:12px;'>Please Fill The Email</span>");
			$("#aninews_email").css("border","1px solid #999");			
		}else{
			$.ajax({
				url: 'index.php?route=module/aninews/saveEmail',
				data: 'email_id=' + $("#aninews_email").val(),				
				dataType: 'json',
				success: function(json) {
					if("success"){
						$("#aninews_error").html("<span style='color:#fff;font-size:12px;'>Your are subscribed for the email newsletters</span>");
					}else{
						$("#aninews_error").html("<span style='color:#fff;font-size:12px;'>There was some problem in subscribing please try after sometime.</span>");
					}
					//$("#aninews").html(html);
				},
				error: function(xhr, ajaxOptions, thrownError) {
					//alert("Not Loaded");
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});		
		}
	});
	
	$("#aninews_close").click(function(){
		$("#ani_content").animate({
			bottom: -1500,
			right: 10
			},5000,function(){ 
			//alert("ADONE"); 
		});
	});
	
});
</script>