<div class="popup">
	<div class="popup-shadow"></div>
	<div class="popup-container">
		<?php if (!$logged) { ?>
		<img onclick="$.colorbox.close();" class="x" src="image/kuvalda/x.png" alt="">
		<h2>Авторизация</h2>
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
			<div class="cbContent callback">
				<div class="big-input-border"><input required placeholder="<?php echo $entry_email; ?>"  type="text"  name="email" >  </div>
				<div class="big-input-border"><input type="text" required  placeholder="<?php echo $entry_password; ?>" type="password" name="password"></div>
				<div class="cbbutton"><input type="submit" value="<?php echo $text_login; ?>" class="button" /></div>
				<?php if( $loginza2_widget_format == 'button' ) { ?>
					<div class="content widget_account_loginza_button_content">		
						<div class="widget_account_button_right">
							<a href="http://loginza.ru/api/widget?token_url=<? echo urlencode(HTTP_SERVER.'index.php?route=account/loginza2'); ?><? if( $loginza2_widget_default ) echo '&provider='.$loginza2_widget_default;?>&providers_set=<? echo $providers; ?><?php if($lang) echo '&lang='.$lang; ?>" class="<?php echo $classname; ?>"><img src="http://loginza.ru/img/sign_in_button_gray.gif" /></a>
						</div>
					</div>			
				<? } ?>		
			</div>
		</form>
		<div class="cbContent callback">
			<? if( $loginza2_widget_format == 'icons' ) { ?>  
				<div class="widget_account_icons_links">
					<? foreach( $res_socnets as $row ) { ?>
							<a  class="<?php echo $classname; ?>" href="https://loginza.ru/api/widget?token_url=<? echo urlencode(HTTP_SERVER.'index.php?route=account/loginza2'); ?>&provider=<?php echo $row['name']; ?><?php if($lang) echo '&lang='.$lang; ?>"><img src="/image/loginza/icons/<? echo $row['name']; ?>.png" alt="<? echo $row['label']; ?>"></a>&nbsp;
					<? } ?>
				</div>		  
			<? } ?>	
			<a href="<?php echo $register; ?>"><?php echo $text_register; ?></a> |
        	<a class="edit-button"  onclick="$('#forgotten').slideToggle('slow');" href="javascript:l_image ('<?php echo $forgotten; ?>')"><?php echo $text_forgotten; ?></a>
			<script type="text/javascript"> function l_image (a) {document.getElementById("example_frame").src=a;} </script>
			<div id="forgotten" style="display:none" >
				<iframe id="example_frame" src="" ></iframe>
			</div>
			<br/><br/>
		</div>
		<?php } ?>
		
	<?php if ($logged) { ?>
	<script language="JavaScript" type="text/javascript">
		<!--  
		location="http://kuvalda.net/"
		//--> 
	</script>
	<!--     <ul>
      <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
      <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
      <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
      <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
      <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
      <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
      <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
    </ul> -->
    <?php } ?>
	</div>
</div>
<?php  if( !$this->customer->isLogged() ) {
if( !empty($this->session->data['loginza2_confirmdata']) && 
	!empty( $loginza2_confirmdata_show ) )
{
	$data = unserialize( $this->session->data['loginza2_confirmdata'] );
	
	$loginza2_confirm_block = $this->config->get('loginza2_confirm_block');
	
	
	$loginza2_confirm_block = str_replace("#divframe_height#", (300-(32*(5-(count(unserialize($this->session->data['loginza2_confirmdata'])))))), $loginza2_confirm_block );
	
	$loginza2_confirm_block = str_replace("#frame_height#", (320-(32*(5-(count(unserialize($this->session->data['loginza2_confirmdata'])))))), $loginza2_confirm_block);
	
	$loginza2_confirm_block = str_replace("#lastlink#", $this->session->data['loginza2_lastlink'], $loginza2_confirm_block);
	
	$loginza2_confirm_block = str_replace("#frame_url#", $this->url->link( 'account/loginza2/frame' ), $loginza2_confirm_block);
	
	echo $loginza2_confirm_block;
} } ?>