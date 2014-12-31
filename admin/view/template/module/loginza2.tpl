<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
	  
	  <a onclick="document.getElementById('stay_field').value='0'; $('#form').submit();" class="button"
	  ><span><?php echo $button_save_and_go; ?></span></a>
	  <a onclick="set_tab(); document.getElementById('stay_field').value='1'; $('#form').submit();" class="button"
	  ><span><?php echo $button_save_and_stay; ?></span></a>
	  
	  <a onclick="location = '<?php echo $cancel; ?>';" class="button"
	  ><span><?php echo $button_cancel; ?></span></a>
	  
	  </div>
    </div>
	<?php /*
google, yandex, mailruapi, mailru, vkontakte, facebook, odnoklassniki, livejournal, twitter, linkedin,
 loginza, myopenid, webmoney, rambler, flickr, lastfm, verisign, aol, steam, openid. */ ?>
	
	
	  
	  
	  
	  <style>
	  .clist 
	  {
		border-top:  1px #ccc solid;
		border-left:  1px #ccc solid;
	  }
	  
	  .clist td
	  {
		padding: 5px;
		border-right: 1px #ccc solid;
		border-bottom: 1px #ccc solid;
	  }
	  
	  .plus
	  {
		background: green;
		text-align: center;
	  }
	  
	  .minus
	  {
		background: #F58C6C;
		text-align: center;
	  }
	  
	  .vopros
	  {
		text-align: center;
	  }
	  </style>
	  
	<script>
		function set_tab()
		{
			if( $('#link-tab-general').attr('class') == 'selected' )
			{
				document.getElementById('hiddentab').value = 'link-tab-general';
			}
			
			if( $('#link-tab-dobor').attr('class') == 'selected' )
			{
				document.getElementById('hiddentab').value = 'link-tab-dobor';
			}
			
			if( $('#link-tab-socseti').attr('class') == 'selected' )
			{
				document.getElementById('hiddentab').value = 'link-tab-socseti';
			}
			
			if( $('#link-tab-widget').attr('class') == 'selected' )
			{
				document.getElementById('hiddentab').value = 'link-tab-widget';
			}
			
			if( $('#link-tab-admin').attr('class') == 'selected' )
			{
				document.getElementById('hiddentab').value = 'link-tab-admin';
			}
			
			if( $('#link-tab-support').attr('class') == 'selected' )
			{
				document.getElementById('hiddentab').value = 'link-tab-support';
			}
		}
		
			function show_showtype_block()
			{
				if( document.getElementById('loginza2_format_table').checked )
				{
					document.getElementById('showtype_block').style.display = 'none';
					document.getElementById('default_provider_block').style.display = 'block';
				}
				else if( document.getElementById('loginza2_format_button').checked )
				{
					document.getElementById('showtype_block').style.display = 'block';
					document.getElementById('default_provider_block').style.display = 'block';
				}
				else if( document.getElementById('loginza2_format_icons').checked )
				{
					document.getElementById('showtype_block').style.display = 'block';
					document.getElementById('default_provider_block').style.display = 'none';
				}
			}
	
	$.fn.tabs = function() {
	var selector = this;
	
	this.each(function() {
		var obj = $(this); 
		
		$(obj.attr('href')).hide();
		
		$(obj).click(function() {
			$(selector).removeClass('selected');
			
			$(selector).each(function(i, element) {
				$($(element).attr('href')).hide();
			});
			
			$(this).addClass('selected');
			
			$($(this).attr('href')).show();
			
			return false;
		});
	});

	$(this).show();
	
	$(this).first().click();
};
	</script>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
		<input type="hidden" id="stay_field" name="stay" value="1">
		<input type="hidden" id="hiddentab" name="tab" value="<?php echo $tab; ?>">
		
		<div id="tabs" class="htabs">
			<a href="#tab-general" id="link-tab-general"><?php echo $tab_general; ?></a>
			<a href="#tab-dobor" id="link-tab-dobor"><?php echo $tab_dobor; ?></a>
			<a href="#tab-socseti" id="link-tab-socseti"><?php echo $tab_socseti; ?></a>
			<a href="#tab-widget"  id="link-tab-widget"><?php echo $tab_widget; ?></a>
			<a href="#tab-admin"   id="link-tab-admin"><?php echo $tab_admin; ?></a>
			<a href="#tab-support" id="link-tab-support"><?php echo $tab_support; ?></a>
		</div>
      
	  
	  <div id="tab-general">
	  
        <table class="form">
		<tr>
			<td><?php echo $entry_status; ?></td>
			<td><select name="loginza2_status">
                  <?php if ( $loginza2_status ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
		</tr>
		<tr>
			<td><?php echo $entry_format; ?></td>
			<td>
				<table>
				<tr>
					<td width=200><input type="radio" 
					onClick="show_showtype_block()"
					name="loginza2_format" 
					value="table" 
					id="loginza2_format_table"
					<?php if( $loginza2_format=='table' ) { ?> checked <?php } ?>
					><label for="loginza2_format_table"><?php echo $text_format_table; ?></label></td>
					<td width=200><input type="radio" name="loginza2_format" 
					onClick="show_showtype_block()"
					value="button" 
					id="loginza2_format_button"
					<?php if( $loginza2_format=='button' ) { ?> checked <?php } ?> 
					><label for="loginza2_format_button"><?php echo $text_format_button; ?></label></td>
					
					<td width=200><input type="radio" name="loginza2_format" 
					onClick="show_showtype_block()"
					value="icons" id="loginza2_format_icons"
					<?php if( $loginza2_format=='icons' ) { ?> checked <?php } ?>
					><label for="loginza2_format_icons"><?php echo $text_format_icons; ?></label></td>
				</tr>
				<tr>
					<td valign=top><img src="/image/loginza/table.gif"></td>
					<td valign=top><img src="/image/loginza/button.gif"></td>
					<td valign=top><img src="/image/loginza/icons.gif"></td>
				</tr>
				</table>
			</td>
		</tr>
		</table>
		<div id="showtype_block" style="display: none;">
		<table class="form">
		<tr>
			<td><?php echo $entry_showtype; ?></td>
			<td>
				<select name="loginza2_showtype">
					<option value="window"
					<?php if( $loginza2_showtype=='window' ) { ?> selected <?php } ?>
					><?php echo $text_showtype_window; ?></option>
					<option value="redirect"
					<?php if( $loginza2_showtype=='redirect' ) { ?> selected <?php } ?>
					><?php echo $text_showtype_redirect; ?></option>
				</select>
				<div><i><?php echo $text_showtype_notice; ?></i></div>
			</td>
		</tr>
		</table>
		</div>
		
		<div id="default_provider_block" style="display: none;">
		<table class="form">
		<tr>
			<td><?php echo $entry_default; ?></td>
			<td><select name="loginza2_default">
					<option value=""><?php echo $text_none; ?></option>
					<?php foreach($socnets_list as $value=>$label) { ?>
						<option value="<?php echo $value; ?>"
						<?php if( $value==$loginza2_default ) echo 'selected'; ?>
						
						><?php echo $label; ?></option>
					<?php } ?>
                </select></td>
		</tr>
		</table>
		<script>
			show_showtype_block();
		</script>
		</div>
		
		<table class="form">
		<tr>
			<td><?php echo $entry_label; ?></td>
			<td>
			
			<?php foreach ($languages as $language) { ?>
			<p>
			<input type="text" name="loginza2_label[<?php echo $language['language_id']; ?>]" value="<?php if( !empty($loginza2_label[ $language['language_id'] ]) ) echo $loginza2_label[ $language['language_id'] ]; ?>" style="width: 300px;">&nbsp;<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" />
			</p>
			<?php } ?>
			
			</td>
		</tr>
		<tr>
			<td><?php echo $entry_save_to_addr; ?></td>
			<td>
				<select name="loginza2_save_to_addr">
					<option value="customer_addr"
					<?php if( $loginza2_save_to_addr=='customer_addr' ) { ?> selected <?php } ?>
					><?php echo $text_customer_addr; ?></option>
					<option value="customer_only"
					<?php if( $loginza2_save_to_addr=='customer_only' ) { ?> selected <?php } ?>
					><?php echo $text_customer_only; ?></option>
				</select>
			</td>
		</tr>
		<tr>
			<td><?php echo $entry_shop_folder; ?></td>
			<td>
				<input type="text" name="loginza2_shop_folder" 
						value="<?php echo $loginza2_shop_folder; ?>" />
			</td>
		</tr>
	  <tr>
			<td colspan=2><b><?php echo $entry_widget_header; ?></b></td>
		</tr>
		<tr>
			<td colspan=2><i><?php echo $entry_widget_notice; ?></i></td>
		</tr>
		<tr>
			<td><?php echo $entry_id; ?></td>
			<td><input type="text" name="loginza2_widget_id" value="<?php echo $loginza2_widget_id; ?>" style="width: 300px;"></td>
		</tr>
		<tr>
			<td><?php echo $entry_sig; ?></td>
			<td><input type="text" name="loginza2_widget_sig" value="<?php echo $loginza2_widget_sig; ?>" style="width: 300px;"></td>
		</tr>
		<tr>
			<td><?php echo $entry_safemode; ?></td>
			<td><select name="loginza2_safemode">
                  <?php if ( $loginza2_safemode ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
		</tr>
		
		</table>
	  </div>
	  <div id="tab-dobor">
        <table class="form">
		<tr>
			<td colspan=2><b><?php echo $entry_confirm_data; ?></b></td>
		</tr>
		<tr>
			<td colspan=2><i><?php echo $entry_confirm_data_notice; ?></i></td>
		</tr>
		<tr>
			<td><?php echo $entry_confirm_firstname; ?></td>
			<td><select name="loginza2_confirm_firstname_status">
                  <?php if ( $loginza2_confirm_firstname_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $loginza2_confirm_firstname_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                </select>
				<input type="checkbox" name="loginza2_confirm_firstname_required" value="1"
				id="loginza2_confirm_firstname_required"
				<?php if( $loginza2_confirm_firstname_required ) { ?>
				checked
				<?php } ?>
				><label for="loginza2_confirm_firstname_required"><?php echo $text_required;?></label></td>
		</tr>
		<tr>
			<td><?php echo $entry_confirm_lastname; ?></td>
			<td><select name="loginza2_confirm_lastname_status">
                <?php if ( $loginza2_confirm_lastname_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $loginza2_confirm_lastname_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="loginza2_confirm_lastname_required" value="1"
				id="loginza2_confirm_lastname_required"
				<?php if( $loginza2_confirm_lastname_required ) { ?>
				checked
				<?php } ?>
				><label for="loginza2_confirm_lastname_required"><?php echo $text_required;?></label></td>
		</tr>
		<tr>
			<td><?php echo $entry_confirm_email; ?></td>
			<td><select name="loginza2_confirm_email_status">
                <?php if ( $loginza2_confirm_email_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $loginza2_confirm_email_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                </select>
				<input type="checkbox" name="loginza2_confirm_email_required" value="1"
				id="loginza2_confirm_email_required"
				<?php if( $loginza2_confirm_email_required ) { ?>
				checked
				<?php } ?>
				><label for="loginza2_confirm_email_required"><?php echo $text_required;?></label></td>
		</tr>
		<tr>
			<td><?php echo $entry_confirm_phone; ?></td>
			<td><select name="loginza2_confirm_telephone_status">
                 <?php if ( $loginza2_confirm_telephone_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $loginza2_confirm_telephone_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="loginza2_confirm_telephone_required" value="1"
				id="loginza2_confirm_telephone_required"
				<?php if( $loginza2_confirm_telephone_required ) { ?>
				checked
				<?php } ?>
				><label for="loginza2_confirm_telephone_required"><?php echo $text_required;?></label></td>
		</tr>
		<tr>
			<td><?php echo $entry_confirm_company; ?></td>
			<td><select name="loginza2_confirm_company_status">
                 <?php if ( $loginza2_confirm_company_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $loginza2_confirm_company_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="loginza2_confirm_company_required" value="1"
				id="loginza2_confirm_company_required"
				<?php if( $loginza2_confirm_company_required ) { ?>
				checked
				<?php } ?>
				><label for="loginza2_confirm_company_required"><?php echo $text_required;?></label></td>
		</tr>
		<tr>
			<td><?php echo $entry_confirm_postcode; ?></td>
			<td><select name="loginza2_confirm_postcode_status">
                 <?php if ( $loginza2_confirm_postcode_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $loginza2_confirm_postcode_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="loginza2_confirm_postcode_required" value="1"
				id="loginza2_confirm_postcode_required"
				<?php if( $loginza2_confirm_postcode_required ) { ?>
				checked
				<?php } ?>
				><label for="loginza2_confirm_postcode_required"><?php echo $text_required;?></label></td>
		</tr>
		<tr>
			<td><?php echo $entry_confirm_country; ?></td>
			<td><select name="loginza2_confirm_country_status">
                 <?php if ( $loginza2_confirm_country_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $loginza2_confirm_country_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="loginza2_confirm_country_required" value="1"
				id="loginza2_confirm_country_required"
				<?php if( $loginza2_confirm_country_required ) { ?>
				checked
				<?php } ?>
				><label for="loginza2_confirm_country_required"><?php echo $text_required;?></label></td>
		</tr>
		<tr>
			<td><?php echo $entry_confirm_zone; ?></td>
			<td><select name="loginza2_confirm_zone_status">
                 <?php if ( $loginza2_confirm_zone_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $loginza2_confirm_zone_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="loginza2_confirm_zone_required" value="1"
				id="loginza2_confirm_zone_required"
				<?php if( $loginza2_confirm_zone_required ) { ?>
				checked
				<?php } ?>
				><label for="loginza2_confirm_zone_required"><?php echo $text_required;?></label></td>
		</tr>
		<tr>
			<td><?php echo $entry_confirm_city; ?></td>
			<td><select name="loginza2_confirm_city_status">
                 <?php if ( $loginza2_confirm_city_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $loginza2_confirm_city_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="loginza2_confirm_city_required" value="1"
				id="loginza2_confirm_city_required"
				<?php if( $loginza2_confirm_city_required ) { ?>
				checked
				<?php } ?>
				><label for="loginza2_confirm_city_required"><?php echo $text_required;?></label></td>
		</tr>
		<tr>
			<td><?php echo $entry_confirm_address_1; ?></td>
			<td><select name="loginza2_confirm_address_1_status">
                 <?php if ( $loginza2_confirm_address_1_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $loginza2_confirm_address_1_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="loginza2_confirm_address_1_required" value="1"
				id="loginza2_confirm_address_1_required"
				<?php if( $loginza2_confirm_address_1_required ) { ?>
				checked
				<?php } ?>
				><label for="loginza2_confirm_address_1_required"><?php echo $text_required;?></label>
			</td>
		</tr>
		
		</table>
	  </div>
	  <div id="tab-socseti">
        <table class="form">
	  <tr>
			<td colspan=2><b><?php echo $filter_header; ?></b></td>
		</tr>
		<tr>
			<td colspan=2><i><?php echo $filter_notice; ?></i></td>
		</tr>		
		</table>
		<table class="clist" cellpadding=0 cellspacing=0>
		<tr>
			<td></td>
			<td></td>
			<td colspan=12 align=center><b><?php echo $col_data; ?></b></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
            <td><b><?php echo $col_socnet; ?></b></td>
            <td><b>URL</b></td>
            <td><b><?php echo $col_link; ?></b></td>
			<td><b><?php echo $col_nickname; ?></b></td>   
            <td><b><?php echo $col_email; ?></b></td>
            <td><b><?php echo $col_gender; ?></b></td>
            <td><b><?php echo $col_photo; ?></b></td>
            <td><b><?php echo $col_name; ?></b></td>
            <td><b><?php echo $col_dob; ?></b></td>
            <td><b><?php echo $col_work; ?></b></td>
            <td><b><?php echo $col_address; ?></b></td>
            <td><b><?php echo $col_phone; ?></b></td>
            <td><b><?php echo $col_im; ?></b></td>
            <td><b><?php echo $col_biography; ?></b></td>
            <td><b><?php echo $col_enable; ?></b></td>
            <td><b><?php echo $col_sort_order; ?></b></td>
        </tr>
		
		<?php foreach( $loginza2_methods as $key=>$method ) { ?>
		
		<tr>
            <td><?php echo $method['name']; ?></td>
            <td><a href="<?php echo $method['url']; ?>" target=_blank><?php echo $method['url']; ?></a></td>     
<?php if( !empty( $data_nets[$key]['nodata'] ) ) { ?>
<td colspan=12>Не работало в момент тестирования</td>
<?php } else { ?>
			
            <td class="<?php echo $data_nets[$key]['link_class']; ?>">
			<?php echo $data_nets[$key]['link_sign']; ?></td>                    
            <td class="<?php echo $data_nets[$key]['nickname_class']; ?>"><?php echo $data_nets[$key]['nickname_sign']; ?></td>          
            <td class="<?php echo $data_nets[$key]['email_class']; ?>"><?php echo $data_nets[$key]['email_sign']; ?></td>
            <td class="<?php echo $data_nets[$key]['gender_class']; ?>"><?php echo $data_nets[$key]['gender_sign']; ?></td>
            <td class="<?php echo $data_nets[$key]['photo_class']; ?>"><?php echo $data_nets[$key]['photo_sign']; ?></td>
            <td class="<?php echo $data_nets[$key]['name_class']; ?>"><?php echo $data_nets[$key]['name_sign']; ?></td>
            <td class="<?php echo $data_nets[$key]['dob_class']; ?>"><?php echo $data_nets[$key]['dob_sign']; ?></td>
            <td class="<?php echo $data_nets[$key]['work_class']; ?>"><?php echo $data_nets[$key]['work_sign']; ?></td>
            <td class="<?php echo $data_nets[$key]['address_class']; ?>"><?php echo $data_nets[$key]['address_sign']; ?></td>
            <td class="<?php echo $data_nets[$key]['phone_class']; ?>"><?php echo $data_nets[$key]['phone_sign']; ?></td>
            <td class="<?php echo $data_nets[$key]['im_class']; ?>"><?php echo $data_nets[$key]['im_sign']; ?></td>
            <td class="<?php echo $data_nets[$key]['biography_class']; ?>"><?php echo $data_nets[$key]['biography_sign']; ?></td>	
<?php } ?>			
            <td align=center><input type="checkbox" name="loginza2_methods[<?php echo $key; ?>][enable]" value="y"
				<?php if( isset($method['enable']) && $method['enable']=='y' ) { ?>
				checked
				<?php } ?>
			></td>
			
            <td align=center><input type="text" name="loginza2_methods[<?php echo $key; ?>][sort]" value="<?php 
			if( isset($method['sort']) ) echo $method['sort']; 	?>"  style="width: 20px;" ></td>
        </tr>
		
		<?php } ?>
		
        </table>		
	  </div>
	  <!-- /////////////////////////////////////////////////////////////////////////////// -->
	  <div id="tab-widget">
	  
	  <table class="form">
	  <tr>
		<td>
			<?php echo $entry_widget_name; ?>
		</td>
		<td>
	  		<?php foreach ($languages as $language) { ?>
			<p>
			<input type="text" name="loginza2_widget_name[<?php echo $language['language_id']; ?>]" value="<?php if( !empty($loginza2_widget_name[ $language['language_id'] ]) ) echo $loginza2_widget_name[ $language['language_id'] ]; ?>" style="width: 300px;">&nbsp;<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" />
			</p>
			<?php } ?>
		</td>
	   </tr
	   <tr>
			<td><?php echo $entry_widget_format; ?></td>
			<td>
				<table>
				<tr>
					<td width=200><input type="radio" name="loginza2_widget_format" 
					value="button" 
					onClick="show_widget_showtype_block()"
					id="loginza2_widget_format_button"
					<?php if( $loginza2_widget_format=='button' ) { ?> checked <?php } ?> 
					><label for="loginza2_widget_format_button"><?php echo $text_format_button; ?></label></td>
					
					<td width=200><input type="radio" name="loginza2_widget_format" 
					onClick="show_widget_showtype_block()"
					value="icons" id="loginza2_widget_format_icons"
					<?php if( $loginza2_widget_format=='icons' ) { ?> checked <?php } ?>
					><label for="loginza2_widget_format_icons"><?php echo $text_format_icons; ?></label></td>
				</tr>
				<tr>
					<td valign=top><img src="/image/loginza/button.gif"></td>
					<td valign=top><img src="/image/loginza/icons.gif"></td>
				</tr>
				</table>
			</td>
		</tr>
		
		<?php /*
		<tr>
			<td><?php echo $entry_widget_showtype; ?></td>
			<td>
				<select name="loginza2_widget_showtype">
					<option value="window"
					<?php if( $loginza2_widget_showtype=='window' ) { ?> selected <?php } ?>
					><?php echo $text_showtype_window; ?></option>
					<option value="redirect"
					<?php if( $loginza2_widget_showtype=='redirect' ) { ?> selected <?php } ?>
					><?php echo $text_showtype_redirect; ?></option>
				</select>
			</td>
		</tr>
		*/ ?>
		
		<tr>
			<td><?php echo $entry_widget_after; ?></td>
			<td>
				<select name="loginza2_widget_after">
					<option value="show"
					<?php if( $loginza2_widget_after=='show' ) { ?> selected <?php } ?>
					><?php echo $text_widget_after_show; ?></option>
					<option value="hide"
					<?php if( $loginza2_widget_after=='hide' ) { ?> selected <?php } ?>
					><?php echo $text_widget_after_hide; ?></option>
				</select>
			</td>
		</tr>
		
	   <!--
	  <tr>
		<td>
			<?php echo $entry_show_standart_auth; ?>
		</td>
		<td>
			<input type="checkbox" name="loginza2_show_standart_auth" value="1" 
			<?php if( !empty( $loginza2_show_standart_auth ) ) { ?> checked <?php } ?> >
		</td>
	   </tr>
	   -->
	   </table>
	   	   
	  <br><br>
	   <table id="module" class="list">
          <thead>
            <tr>
              <td class="left"><?php echo $entry_widget_layout; ?></td>
              <td class="left"><?php echo $entry_widget_position; ?></td>
              <td class="left"><?php echo $entry_widget_status; ?></td>
              <td class="right"><?php echo $entry_widget_sort_order; ?></td>
              <td></td>
            </tr>
          </thead>
          <?php $module_row = 0; ?>
          <?php foreach ($loginza2_modules as $module) { ?>
          <tbody id="module-row<?php echo $module_row; ?>">
            <tr>
              <td class="left"><select name="loginza2_modules[<?php echo $module_row; ?>][layout_id]">
                  <?php foreach ($layouts as $layout) { ?>
                  <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
              <td class="left"><select name="loginza2_modules[<?php echo $module_row; ?>][position]">
                  <?php if ($module['position'] == 'content_top') { ?>
                  <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                  <?php } else { ?>
                  <option value="content_top"><?php echo $text_content_top; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'content_bottom') { ?>
                  <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                  <?php } else { ?>
                  <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'column_left') { ?>
                  <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                  <?php } else { ?>
                  <option value="column_left"><?php echo $text_column_left; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'column_right') { ?>
                  <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                  <?php } else { ?>
                  <option value="column_right"><?php echo $text_column_right; ?></option>
                  <?php } ?>
                </select></td>
              <td class="left"><select name="loginza2_modules[<?php echo $module_row; ?>][status]">
                  <?php if ($module['status']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
              <td class="right"><input type="text" name="loginza2_modules[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
              <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"
			  ><span><?php echo $button_remove; ?></span></a></td>
            </tr>
          </tbody>
          <?php $module_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="4"></td>
              <td class="left"><a onclick="addModule();" class="button"><span><?php echo $button_add_module; ?></span></a></td>
            </tr>
          </tfoot>
        </table>
	  </div>
	  <!-- /////////////////////////////////////////////////////////////////////////////// -->
	  <div id="tab-admin">
	  
		<table class="form">
		<tr>
			<td colspan=2><b><?php echo $entry_admin_header; ?></b></td>
		</tr>
		<tr>
			<td><?php echo $entry_admin_customer; ?></td>
			<td><input type="checkbox" name="loginza2_admin_customer" value="1"
				<?php if($loginza2_admin_customer) { ?> checked <?php } ?>
			></td>
		</tr>		
		<tr>
			<td><?php echo $entry_admin_customer_list; ?></td>
			<td><input type="checkbox" name="loginza2_admin_customer_list" value="1"
				<?php if($loginza2_admin_customer_list) { ?> checked <?php } ?>
			></td>
		</tr>		
		<tr>
			<td><?php echo $entry_admin_order; ?></td>
			<td><input type="checkbox" name="loginza2_admin_order" value="1"
				<?php if($loginza2_admin_order) { ?> checked <?php } ?>
			></td>
		</tr>		
		<tr>
			<td><?php echo $entry_admin_order_list; ?></td>
			<td><input type="checkbox" name="loginza2_admin_order_list" value="1"
				<?php if($loginza2_admin_order_list) { ?> checked <?php } ?>
			></td>
		</tr>		
		</table>
	  </div>
	  <div id="tab-support">
	  
			<p><?php echo $text_frame; ?></p>
			<iframe width=100% height=700 src="http://softpodkluch.ru/faq/loginza.html" border=0 frameborder="0" style="border: 1px #ccc solid;"></iframe>
			<?php echo $text_contact; ?>
	  </div>
      </form>
<script type="text/javascript"><!--
$('#tabs a').tabs(); 



$('#<?php echo $tab; ?>').click();

</script>

<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><select name="loginza2_modules[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="loginza2_modules[' + module_row + '][position]">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="loginza2_modules[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="loginza2_modules[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	module_row++;
}
//--></script> 

    </div>
  </div>
</div>
<?php echo $footer; ?>