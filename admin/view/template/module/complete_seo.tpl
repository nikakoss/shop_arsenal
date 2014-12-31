<?php echo $header; ?>
<div id="content">
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
<?php if ($success) { ?><div class="success"><?php echo $success; ?></div><script type="text/javascript">setTimeout("$('.success').slideUp();",5000);</script><?php } ?>
<?php if ($error) { ?><div class="warning"><?php echo $error; ?></div><?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/seo_package/img/icon-big.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button blue"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button red"><span><?php echo $button_cancel; ?></span></a></div>
  </div>
  <div class="content">
		<div id="tabs" class="htabs">
			<a class="tab1" href="#tab-general"><i></i><?php echo $this->language->get('tab_seo_options'); ?></a>
			<a href="#tab-store"><i class="iconic bars"></i><?php echo $this->language->get('tab_seo_store'); ?></a>
			<a class="tab2" href="#tab-transform"><i></i><?php echo $this->language->get('tab_seo_transform'); ?></a>
			<a class="tab3" href="#tab-friendly"><i></i><?php echo $this->language->get('tab_seo_friendly'); ?></a>
			<a class="tab4" href="#tab-fpp"><i></i><?php echo $this->language->get('tab_seo_fpp'); ?></a>
			<a class="tab5" href="#tab-update"><i></i><?php echo $this->language->get('tab_seo_update'); ?></a>
			<a class="tab-about" href="#tab-about"><i class='iconic info'></i><?php echo $this->language->get('tab_seo_about'); ?></a>
		</div>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
		<div id="tab-general">
				<table class="form">
				<tr>
          <td style="width:250px;"><?php echo $this->language->get('text_seo_absolute'); ?></td>
					<td style="width:120px;"><input class="switch" type="checkbox" id="multilingual_seo_absolute" name="multilingual_seo_absolute" value="1" <?php if($multilingual_seo_absolute) echo 'checked="checked"'; ?> /></td>
					<td></td>
        </tr>
				<tr>
          <td><?php echo $this->language->get('text_seo_flag'); ?></td>
						<td><input class="switch" type="checkbox" id="multilingual_seo_flag" name="multilingual_seo_flag" value="1" <?php if($multilingual_seo_flag) echo 'checked="checked"'; ?> /></td>
          <td></td>
					</tr>
					<tr>
						<td><?php echo $this->language->get('text_seo_flag_default'); ?></td>
						<td><input class="switch" type="checkbox" id="multilingual_seo_flag_default" name="multilingual_seo_flag_default" value="1" <?php if($multilingual_seo_flag_default) echo 'checked="checked"'; ?> /></td>
          <td></td>
        </tr>
				<tr>
          <td><?php echo $this->language->get('text_seo_flag_upper'); ?></td>
						<td><input class="switch" type="checkbox" id="multilingual_seo_flag_upper" name="multilingual_seo_flag_upper" value="1" <?php if($multilingual_seo_flag_upper) echo 'checked="checked"'; ?> /></td>
          <td></td>
        </tr>
				<tr>
          <td><?php echo $this->language->get('text_seo_extension'); ?></td>
          <td><input type="text" name="multilingual_seo_extension" value="<?php echo $multilingual_seo_extension; ?>" size="7" /></td>
          <td></td>
        </tr>
        <tr>
          <td><?php echo $this->language->get('text_seo_banner'); ?></td>
					<td><input class="switch" type="checkbox" id="multilingual_seo_banners" name="multilingual_seo_banners" value="1" <?php if($multilingual_seo_banners) echo 'checked="checked"'; ?> /></td>
          <td><span class="help"><?php echo $this->language->get('text_seo_banner_help'); ?></span></td>
        </tr>
				<tr class="info">
			  <td><i class='iconic info'></i></td>
          <td colspan="2" style="color:#555;padding:40px 100px 40px 0;"><?php echo $this->language->get('text_info_general'); ?></td>
        </tr>
      </table>
		</div>
		<div id="tab-store">
			<div class="vtabs" id="stores">
			  <?php foreach ($stores as $store) { ?>
			  <a href="#tab-store-<?php echo $store['store_id']; ?>" id="store-<?php echo $store['store_id']; ?>"><?php echo $store['name']; ?></a>
			  <?php } ?>
			  </div>
			<?php foreach ($stores as $store) { ?>
			<div id="tab-store-<?php echo $store['store_id']; ?>" class="vtabs-content">
			  <div id="language-<?php echo $store['store_id']; ?>" class="htabs">
				<?php foreach ($languages as $language) { ?>
				<a href="#tab-language-<?php echo $store['store_id']; ?>-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" alt=""/> <?php echo $language['name']; ?></a>
				<?php } ?>
			  </div>
			  <?php foreach ($languages as $language) { ?>
			  <div id="tab-language-<?php echo $store['store_id']; ?>-<?php echo $language['language_id']; ?>">
				<table class="form">
				 <tr>
					<td><?php echo $this->language->get('entry_store_seo_title'); ?></td>
					<td><input type="text" name="multilingual_seo_store[<?php echo $store['store_id'] . $language['language_id']; ?>][seo_title]" value="<?php echo isset($multilingual_seo_store[$store['store_id'].$language['language_id']]['seo_title']) ? $multilingual_seo_store[$store['store_id'].$language['language_id']]['seo_title'] : ''; ?>" size="63"/></td>
				 </tr>
				 <tr>
					<td><?php echo $this->language->get('entry_store_title'); ?></td>
					<td><input type="text" name="multilingual_seo_store[<?php echo $store['store_id'] . $language['language_id']; ?>][title]" value="<?php echo isset($multilingual_seo_store[$store['store_id'].$language['language_id']]['title']) ? $multilingual_seo_store[$store['store_id'].$language['language_id']]['title'] : ''; ?>" size="63"/></td>
				 </tr>
				  <tr>
					<td><?php echo $this->language->get('entry_store_desc'); ?></td>
					<td><textarea name="multilingual_seo_store[<?php echo $store['store_id'] . $language['language_id']; ?>][description]" cols="60" rows="6"><?php echo isset($multilingual_seo_store[$store['store_id'].$language['language_id']]['description']) ? $multilingual_seo_store[$store['store_id'].$language['language_id']]['description'] : ''; ?></textarea></td>
				  </tr>
				   <tr>
					<td><?php echo $this->language->get('entry_store_keywords'); ?></td>
					<td><textarea name="multilingual_seo_store[<?php echo $store['store_id'] . $language['language_id']; ?>][keywords]" cols="60" rows="6"><?php echo isset($multilingual_seo_store[$store['store_id'].$language['language_id']]['keywords']) ? $multilingual_seo_store[$store['store_id'].$language['language_id']]['keywords'] : ''; ?></textarea></td>
				  </tr>
				</table>
			  </div>
			  <?php } ?>
			</div>
			<?php } ?>
			<table class="form">
				<tr class="info">
			  <td><i class='iconic info'></i></td>
			  <td><?php echo $this->language->get('text_info_store'); ?></td>
			</tr>
		</table>
		</div>
		<div id="tab-transform">
      <table class="form">
				<tr>
          <td style="width:250px;"><?php echo $this->language->get('text_seo_whitespace'); ?></td>
          <td><input type="text" name="multilingual_seo_whitespace" value="<?php echo $multilingual_seo_whitespace; ?>" size="1" /></td>
        </tr>
        <tr>
          <td><?php echo $this->language->get('text_seo_lowercase'); ?></td>
						<td><input class="switch" type="checkbox" id="multilingual_seo_lowercase" name="multilingual_seo_lowercase" value="1" <?php if($multilingual_seo_lowercase) echo 'checked="checked"'; ?> /></td>
        </tr>
				<tr>
          <td><?php echo $this->language->get('text_seo_duplicate'); ?></td>
						<td><input class="switch" type="checkbox" id="multilingual_seo_duplicate" name="multilingual_seo_duplicate" value="1" <?php if($multilingual_seo_duplicate) echo 'checked="checked"'; ?> /></td>
        </tr>
				<tr>
          <td><?php echo $this->language->get('text_seo_ascii'); ?></td>
						<td><input class="switch" type="checkbox" id="multilingual_seo_ascii" name="multilingual_seo_ascii" value="1" <?php if($multilingual_seo_ascii) echo 'checked="checked"'; ?> /></td>
        </tr>
        <tr>
          <td><?php echo $this->language->get('text_seo_autotitle'); ?></td>
			<td class="multiple_switch">
            <div>
				<span> <?php echo $this->language->get('text_insert'); ?></span>
				<input class="switch" type="checkbox" id="multilingual_seo_insertautotitle" name="multilingual_seo_insertautotitle" value="1" <?php if($multilingual_seo_insertautotitle) echo 'checked="checked"'; ?> />
			</div>
			<div>
				<span><?php echo $this->language->get('text_edit'); ?></span>
				<input class="switch" type="checkbox" id="multilingual_seo_editautotitle" name="multilingual_seo_editautotitle" value="1" <?php if($multilingual_seo_editautotitle) echo 'checked="checked"'; ?> />
			</div>
          </td>
        </tr>
        <tr>
          <td><?php echo $this->language->get('text_seo_autofill_desc'); ?></td>
			<td>
			<table class="form">
				<tr>
					<td><?php echo $this->language->get('text_seo_autofill'); ?> <?php echo $this->language->get('text_seo_mode_url'); ?> <?php echo $this->language->get('text_seo_autofill_on'); ?></td>
					<td class="multiple_switch">
					<div>
						<span><?php echo $this->language->get('text_insert'); ?></span>
						<input class="switch" type="checkbox" id="multilingual_seo_insertautourl" name="multilingual_seo_insertautourl" value="1" <?php if($multilingual_seo_insertautourl) echo 'checked="checked"'; ?> />
					</div>
					<div>
						<span><?php echo $this->language->get('text_edit'); ?></span>
						<input class="switch" type="checkbox" id="multilingual_seo_editautourl" name="multilingual_seo_editautourl" value="1" <?php if($multilingual_seo_editautourl) echo 'checked="checked"'; ?> />
					</div>
				  </td>
			  </tr>
			  <tr>
					<td><?php echo $this->language->get('text_seo_autofill'); ?> <?php echo $this->language->get('text_seo_mode_title'); ?> <?php echo $this->language->get('text_seo_autofill_on'); ?></td>
					<td class="multiple_switch">
					<div>
						<span><?php echo $this->language->get('text_insert'); ?></span>
						<input class="switch" type="checkbox" id="multilingual_seo_insertautoseotitle" name="multilingual_seo_insertautoseotitle" value="1" <?php if($multilingual_seo_insertautoseotitle) echo 'checked="checked"'; ?> />
					</div>
					<div>
						<span><?php echo $this->language->get('text_edit'); ?></span>
						<input class="switch" type="checkbox" id="multilingual_seo_editautoseotitle" name="multilingual_seo_editautoseotitle" value="1" <?php if($multilingual_seo_editautoseotitle) echo 'checked="checked"'; ?> />
					</div>
				  </td>
			  </tr>
			  <tr>
					<td><?php echo $this->language->get('text_seo_autofill'); ?> <?php echo $this->language->get('text_seo_mode_keyword'); ?> <?php echo $this->language->get('text_seo_autofill_on'); ?></td>
					<td class="multiple_switch">
					<div>
						<span><?php echo $this->language->get('text_insert'); ?></span>
						<input class="switch" type="checkbox" id="multilingual_seo_insertautometakeyword" name="multilingual_seo_insertautometakeyword" value="1" <?php if($multilingual_seo_insertautometakeyword) echo 'checked="checked"'; ?> />
					</div>
					<div>
						<span><?php echo $this->language->get('text_edit'); ?></span>
						<input class="switch" type="checkbox" id="multilingual_seo_editautometakeyword" name="multilingual_seo_editautometakeyword" value="1" <?php if($multilingual_seo_editautometakeyword) echo 'checked="checked"'; ?> />
					</div>
				  </td>
			  </tr>
			  <tr>
					<td><?php echo $this->language->get('text_seo_autofill'); ?> <?php echo $this->language->get('text_seo_mode_description'); ?> <?php echo $this->language->get('text_seo_autofill_on'); ?></td>
					<td class="multiple_switch">
					<div>
						<span><?php echo $this->language->get('text_insert'); ?></span>
						<input class="switch" type="checkbox" id="multilingual_seo_insertautometadesc" name="multilingual_seo_insertautometadesc" value="1" <?php if($multilingual_seo_insertautometadesc) echo 'checked="checked"'; ?> />
					</div>
					<div>
						<span><?php echo $this->language->get('text_edit'); ?></span>
						<input class="switch" type="checkbox" id="multilingual_seo_editautometadesc" name="multilingual_seo_editautometadesc" value="1" <?php if($multilingual_seo_editautometadesc) echo 'checked="checked"'; ?> />
					</div>
				  </td>
			  </tr>
		  </table>
		  </td>
        </tr>
			<tr class="info">
			  <td><i class='iconic info'></i></td>
          <td style="color:#555;padding:40px 100px 40px 0;"><?php echo $this->language->get('text_info_transform'); ?></td>
        </tr>
			</table>
		</div>
		<div id="tab-fpp">
			<table class="form">
				<tr>
          <td><?php echo $this->language->get('text_enable').' '.$this->language->get('tab_seo_fpp'); ?>:</td>
					<td><input class="switch" type="checkbox" id="full_product_path" name="full_product_path" value="1" <?php if($full_product_path) echo 'checked="checked"'; ?> /></td>
        </tr>
        <!-- start fpp -->
        <tr>
          <td><?php echo $this->language->get('text_fpp_largest'); ?></td>
					<td><input class="switch" type="checkbox" id="full_product_path_largest" name="full_product_path_largest" value="1" <?php if($full_product_path_largest) echo 'checked="checked"'; ?> /></td>
        </tr>
        <tr>
          <td><?php echo $this->language->get('text_fpp_bypasscat'); ?></td>
					<td><input class="switch" type="checkbox" id="full_product_path_bypasscat" name="full_product_path_bypasscat" value="1" <?php if($full_product_path_bypasscat) echo 'checked="checked"'; ?> /></td>
        </tr>
				<tr>
					<td><?php echo $this->language->get('entry_category'); ?></td>
					<td><div class="scrollbox" style="width:90%;height:350px">
							<?php $class = 'odd'; ?>
							<?php foreach ($categories as $category) { ?>
							<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
							<div class="<?php echo $class; ?>">
								<?php if (in_array($category['category_id'], $full_product_path_categories)) { ?>
								<input type="checkbox" name="full_product_path_categories[]" value="<?php echo $category['category_id']; ?>" checked="checked" />
								<?php echo $category['name']; ?>
								<?php } else { ?>
								<input type="checkbox" name="full_product_path_categories[]" value="<?php echo $category['category_id']; ?>" />
								<?php echo $category['name']; ?>
								<?php } ?>
							</div>
							<?php } ?>
						</div>
						<a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $this->language->get('text_select_all'); ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $this->language->get('text_unselect_all'); ?></a></td>
				</tr>
				<tr class="info">
				  <td><i class='iconic info'></i></td>
			  <td style="color:#555;padding:40px 100px 40px 0;"><?php echo $this->language->get('text_info_fpp'); ?></td>
        </tr>
        <!-- end fpp -->
      </table>
		</div>
		<div id="tab-friendly">
			<table class="form">
				<tr>
          <td><?php echo $this->language->get('text_enable').' '.$this->language->get('tab_seo_friendly'); ?>:</td>
					<td><input class="switch" type="checkbox" id="multilingual_seo_friendly" name="multilingual_seo_friendly" value="1" <?php if($multilingual_seo_friendly) echo 'checked="checked"'; ?> /></td>
        </tr>
				<tr>
          <td><?php echo $this->language->get('text_seo_friendly'); ?></td>
					<td>
						<div id="language-friendly" class="htabs">
							<?php foreach ($languages as $language) { ?>
							<a href="#tab-language-friendly-<?php echo $language['code']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
							<?php } ?>
						</div>
						<div id="friendly-display"><div><span>&nbsp;</span><b>&gt;</b><span>&nbsp;</span></div></div>
						<?php foreach ($languages as $language) { ?>
						<div id="tab-language-friendly-<?php echo $language['code']; ?>" class="friendly">
							<?php if(isset(${'multilingual_seo_urls_'.$language['code']})){ foreach (${'multilingual_seo_urls_'.$language['code']} as $key => $value) { ?>
								<div class="url"><input type="text" name="multilingual_seo_urls_<?php echo $language['code']; ?>[keys][]" value="<?php echo $key; ?>" /><span>&gt;</span><input type="text" name="multilingual_seo_urls_<?php echo $language['code']; ?>[values][]" value="<?php echo $value; ?>" /> <a class="delete" href="#"><img src="view/image/delete.png" /></a></div>
							<?php }} ?>
							
							<div class="btns">
								<div class="buttons">
									<a onclick="reset_urls('reset', '<?php echo $language['code']; ?>');" class="button orange"><i class='iconic undo'></i> <?php echo $this->language->get('text_seo_reset_urls'); ?> [<?php echo $language['code']; ?>]</a>
									<a onclick="reset_urls('clear', '<?php echo $language['code']; ?>');" class="button red"><i class='iconic x'></i> <?php echo $this->language->get('text_seo_remove_urls'); ?> [<?php echo $language['code']; ?>]</a>
								</div>
								<a class="button add green" lang="<?php echo $language['code']; ?>" href="#"><i class='iconic plus'></i> <?php echo $this->language->get('text_seo_add_url'); ?></a>
							</div>
						</div>
						<?php } ?>
					</td>
        </tr>
				<tr class="info">
			  <td><i class='iconic info'></i></td>
          <td style="color:#555;padding:40px 100px 40px 0;"><?php echo $this->language->get('text_info_friendly'); ?></td>
        </tr>
			</table>
		</div>
		<div id="tab-update">
			 <table class="form">
				<tr>
          <td><?php echo $this->language->get('text_seo_simulate'); ?>:</td>
					<td>
						<input class="switch" type="checkbox" id="simulate"  name="simulate" value="1" checked="checked"/>
					</td>
				</tr>
				<tr>
          <td><?php echo $this->language->get('text_seo_languages'); ?>:</td>
					<td>
						<?php foreach ($languages as $language) { ?>
							<label style="padding-right:40px;"><input type="checkbox" name="langs[]" value="<?php echo $language['language_id']; ?>"  checked="checked"/> <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></label>
						<?php } ?>
				</td>
				</tr>
				<tr>
				  <td><?php echo $this->language->get('text_seo_generator_product'); ?></td>
				  <td>
					<table class="generator">
						<tr>
							<td class="patterns" rowspan="4"><?php echo $this->language->get('text_seo_generator_product_desc'); ?></td>
							<td><input type="text" name="seo_product_url_pattern" value="<?php echo $seo_product_url_pattern; ?>" size="50" /></td>
							<td><a onclick="seo_update('product', 'url');" class="button"><span><?php echo $this->language->get('text_seo_generator_url'); ?></span></a></td>
						</tr>
						<tr>
							<td><input type="text" name="seo_product_title_pattern" value="<?php echo $seo_product_title_pattern; ?>" size="50" /></td>
							<td><a onclick="seo_update('product', 'title');" class="button"><span><?php echo $this->language->get('text_seo_generator_title'); ?></span></a></td>
						</tr>
						<tr>
							<td><input type="text" name="seo_product_keyword_pattern" value="<?php echo $seo_product_keyword_pattern; ?>" size="50" /></td>
							<td><a onclick="seo_update('product', 'keyword');" class="button"><span><?php echo $this->language->get('text_seo_generator_keywords'); ?></span></a></td>
						</tr>
						<tr>
							<td><input type="text" name="seo_product_description_pattern" value="<?php echo $seo_product_description_pattern; ?>" size="50" /></td>
							<td><a onclick="seo_update('product', 'description');" class="button"><span><?php echo $this->language->get('text_seo_generator_desc'); ?></span></a></td>
						</tr>
						</table>
					</td>
				</tr>
				<tr>
				  <td><?php echo $this->language->get('text_seo_generator_category'); ?></td>
				  <td>
					<table class="generator">
						<tr>
							<td class="patterns" rowspan="4"><?php echo $this->language->get('text_seo_generator_category_desc'); ?></td>
							<td><input type="text" name="seo_category_url_pattern" value="<?php echo $seo_category_url_pattern; ?>" size="50" /></td>
							<td><a onclick="seo_update('category', 'url');" class="button"><span><?php echo $this->language->get('text_seo_generator_url'); ?></span></a></td>
						</tr>
						<tr>
							<td><input type="text" name="seo_category_title_pattern" value="<?php echo $seo_category_title_pattern; ?>" size="50" /></td>
							<td><a onclick="seo_update('category', 'title');" class="button"><span><?php echo $this->language->get('text_seo_generator_title'); ?></span></a></td>
						</tr>
						<tr>
							<td><input type="text" name="seo_category_keyword_pattern" value="<?php echo $seo_category_keyword_pattern; ?>" size="50" /></td>
							<td><a onclick="seo_update('category', 'keyword');" class="button"><span><?php echo $this->language->get('text_seo_generator_keywords'); ?></span></a></td>
						</tr>
						<tr>
							<td><input type="text" name="seo_category_description_pattern" value="<?php echo $seo_category_description_pattern; ?>" size="50" /></td>
							<td><a onclick="seo_update('category', 'description');" class="button"><span><?php echo $this->language->get('text_seo_generator_desc'); ?></span></a></td>
						</tr>
						</table>
					</td>
				</tr>
				<tr>
				  <td><?php echo $this->language->get('text_seo_generator_information'); ?></td>
				  <td>
					<table class="generator">
						<tr>
							<td class="patterns" rowspan="4"><?php echo $this->language->get('text_seo_generator_information_desc'); ?></td>
							<td><input type="text" name="seo_information_url_pattern" value="<?php echo $seo_information_url_pattern; ?>" size="50" /></td>
							<td><a onclick="seo_update('information', 'url');" class="button"><span><?php echo $this->language->get('text_seo_generator_url'); ?></span></a></td>
						</tr>
						<tr>
							<td><input type="text" name="seo_information_title_pattern" value="<?php echo $seo_information_title_pattern; ?>" size="50" /></td>
							<td><a onclick="seo_update('information', 'title');" class="button"><span><?php echo $this->language->get('text_seo_generator_title'); ?></span></a></td>
						</tr>
						<tr>
							<td><input type="text" name="seo_information_keyword_pattern" value="<?php echo $seo_information_keyword_pattern; ?>" size="50" /></td>
							<td><a onclick="seo_update('information', 'keyword');" class="button"><span><?php echo $this->language->get('text_seo_generator_keywords'); ?></span></a></td>
						</tr>
						<tr>
							<td><input type="text" name="seo_information_description_pattern" value="<?php echo $seo_information_description_pattern; ?>" size="50" /></td>
							<td><a onclick="seo_update('information', 'description');" class="button"><span><?php echo $this->language->get('text_seo_generator_desc'); ?></span></a></td>
						</tr>
						</table>
					</td>
				</tr>
				<tr>
				  <td><?php echo $this->language->get('text_seo_generator_manufacturer'); ?></td>
				  <td>
					<table class="generator">
						<tr>
							<td class="patterns" rowspan="4"><?php echo $this->language->get('text_seo_generator_manufacturer_desc'); ?></td>
							<td><input type="text" name="seo_manufacturer_url_pattern" value="<?php echo $seo_manufacturer_url_pattern; ?>" size="50" /></td>
							<td><a onclick="seo_update('manufacturer', 'url');" class="button"><span><?php echo $this->language->get('text_seo_generator_url'); ?></span></a></td>
						</tr>
					 </table>
					</td>
				</tr>
				
				<tr>
          <td><?php echo $this->language->get('text_seo_result'); ?> <img id="loading" src="view/image/loading.gif" alt="" style="display:none" /></td>
					<td><div id="update_result"></div></td>
				</tr>
		<tr>
          <td><?php echo $this->language->get('text_cleanup'); ?></td>
          <td>
				<a onclick="seo_update('cleanup', 'url');" class="button"><span>- <?php echo $this->language->get('text_cleanup_btn'); ?> -</span></a>
			</td>
        </tr>
				<tr class="info">
			  <td><i class='iconic info'></i></td>
          <td style="color:#555;padding:40px 100px 40px 0;"><?php echo $this->language->get('text_info_update'); ?></td>
        </tr>
			</table>
		</div>
		</form>
		<div id="tab-about">
			<table class="form about">
				<tr>
					<td colspan="2" style="text-align:center;padding:30px 0 50px"><img src="view/seo_package/img/logo<?php echo rand(1,1); ?>.gif"/></td>
				</tr>
				<tr>
					<td>Version</td>
					<td><?php echo $module_version; ?></td>
				</tr>
				<tr>
					<td>Free support</td>
					<td>Top quality module guaranteed.<br/>In case of bug, incompatibility, or if you want a new feature, just contact me on my mail.</td>
				</tr>
				<tr>
					<td>Contact</td>
					<td><a href="mailto:sirius_box-dev@yahoo.fr">sirius_box-dev@yahoo.fr</a></td>
				</tr>
				<tr>
					<td>Links</td>
					<td>
						If you like this module, please consider to make a star rating <span style="position:relative;top:3px;width:80px;height:17px;display:inline-block;background:url(data:data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAARCAYAAADUryzEAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALEgAACxIB0t1+/AAAABZ0RVh0Q3JlYXRpb24gVGltZQAwNy8wNy8xMrG4sToAAAAcdEVYdFNvZnR3YXJlAEFkb2JlIEZpcmV3b3JrcyBDUzbovLKMAAACr0lEQVQ4jX1US0+TURA98/Xri0KBYqG8BDYItBoIBhFBBdRNTTQx0Q0gujBiAkEXxoXxD6iJbRcaY1iQEDXqTgwQWkWDIBU3VqWQoEgECzUU+n5910VbHhacZHLvzD05c+fMzaVhgxYJIwIYi+8B8FJ5bzjob9ucB4DmLttGMGyoAGMsyc1G7bEvA91roz2NL7Y7TziHHSxFmWsorbuUFgn79BaTLnMn3LYEZqPukCKruFAUGEd54w1ekqK69x8CSkoqMnJv72noTmN+O9Q5KlE44GqxmHTS7Qho5MH+X8SJUuMhAIbM/CrS1tSnCYsmkOoUnO7SiP3dHV8Mw5AoKkRCfTwR96ei+ZZGVVDDJQhIWAVbfhjDe8eQnd/Aq8+/VAIsAcGbR8ejQiR8jcwGbYZEkTFVd7I9B4IXcL+GEPwdK4SN0XJSDaCoAvHZsA4/93hWHNVNnbZpjoG5gl7XvpFnxggxAZRaA0rokliIAIkaxMnwdWLE7XW77jd12qYBgCMiNHfZlhgTCkZfPfUDBAYGItoiL0lK8N0+51txzD1u7Ji8njTGpk6bg/iUhSiU4GT5YOtPL940AOfiDyHod9/dMsYEzmLS5bBoKE/ES8ECCyACSF4IFledAdhd2SIFUdtmAp7i92QM+uKqVg6RJXDKakCcjyjSwcldMUDgG7I0h8WKdI0ewM2kFuTpmlb1bp2UMYBJyjBjm/FYh57MjA/1+1wuESNZOfjoLPwe516zUSdLIgi6l+sl3CIW5leD7/v7HPNTE+cOtr8tDXhWy+zWAcvnDx/XoiEPiirPBomgXxd32KAFEWp3FR0YdP60pop4sfHI5cmr+MfMRl2tXKnqzS5pyFuaHRusu2A5EyeoAEAQS2Q94VDg4pY/YUOf9ZgxnBaJJSeOdny6AgB/AYEpKtpaTusRAAAAAElFTkSuQmCC)"></span> on the module page :]<br/><br/>
						<b>Module page :</b> <a target="new" href="http://www.opencart.com/index.php?route=extension/extension/info&extension_id=9486">Complete SEO Package</a><br/>
						<b>Other modules :</b> <a target="new" href="http://www.opencart.com/index.php?route=extension/extension&filter_username=woodruff">My modules on opencart</a><br/>
					</td>
				</tr>
			</table>
		</div>
  </div>
</div>
<script type="text/javascript"><!--
$('input.switch').iToggle({easing: 'swing',speed: 200});

$('.friendly .url').live('hover', function(){
	$('#friendly-display div').html(
		'<span><?php echo HTTP_CATALOG; ?>index.php?route='+$(this).children('input:first').val()+'</span><b>&gt;</b><span><?php echo HTTP_CATALOG; ?>'+$(this).children('input:last').val()+'</span>'
	);
});
$('.friendly div .delete').live('click',function(e){
	e.preventDefault();
	$(this).parent().remove();
});
$('.friendly .add').click(function(e){
	e.preventDefault();
	$(this).parent().before('<div class="url"><input type="text" name="multilingual_seo_urls_'+$(this).attr('lang')+'[keys][]" value="" /><span>&gt;</span><input type="text" name="multilingual_seo_urls_'+$(this).attr('lang')+'[values][]" value="" /> <a class="delete" href="#"><img src="view/image/delete.png" /></a></div>');
});
$('#tabs a').tabs();
$('#language-friendly a').tabs();

$('#stores a').tabs();
<?php foreach ($stores as $store) { ?>
$('#language-<?php echo $store['store_id']; ?> a').tabs();
<?php } ?> 

function reset_urls(type, lang){
	location = '<?php echo str_replace('&amp;', '&', $this->url->link('module/complete_seo/reset_urls', 'token=' . $this->session->data['token'], 'SSL')); ?>&type='+type+'&lang='+lang;
}
function seo_update(type, mode){
	$('#loading').show();
	//$('#update_result *').fadeOut();
	$('#update_result').html('<img style="padding-left:40%" src="view/seo_package/img/bigloader.gif"/>');
	$.ajax({
		url: 'index.php?route=module/complete_seo/generator&type='+type+'&mode='+mode+'&token=<?php echo $token; ?>',
		data: $('#tab-update :input').serialize(),
		dataType: 'text',
		success: function(data){
			$('#update_result').html(data);
			$('#loading').hide();
		}
	});
}
function display_old(){
	$('.toggle').toggleClass('active');
	$('.res_table td:nth-child(3)').toggle();
}
function fullscreen(){
	if($('#update_result').hasClass('full')){
		$('.fullscreen').removeClass('active');
		$('#update_result').removeClass('full');
		$('html, body').css({'overflow': 'auto','height': 'auto'});
	} else {
		$('.fullscreen').addClass('active');
		$('#update_result').addClass('full');
		$('html, body').css({'overflow': 'hidden', 'height': '100%'});
	}
}
//--></script> 