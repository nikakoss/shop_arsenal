<?php
// English   Multilingual SEO      Author: Sirius Dev
// Heading
$_['heading_title']		  = '<img src="view/seo_package/img/icon.png" style="vertical-align:top;padding-right:4px"/>Complete SEO Package';
$_['module_title']		  = 'Complete SEO <span>Package</span>';
  
// Tab seo configuration
$_['tab_seo_options']      	= 'SEO configuration';
$_['text_info_general']		= 'These settings impact the global functionning of SEOs, they take effect immediatly and can be changed at any time.';
$_['text_seo_absolute']		= 'Absolute path:<span class="help">Allow to use same keyword for sub-categories (ex: /men/shoes /women/shoes)</span>';
$_['text_seo_extension']		= 'Extension:<span class="help">Add the extension of your choice at the end of a product keyword (ex: .html)</span>';
$_['text_seo_flag']				= 'Flag mode:<span class="help">Add language tag at start of the url (/en, /fr, ...)<br />Please use seo.htaccess when activated</span>';
$_['text_seo_flag_upper']	= 'Flag in uppercase:<span class="help">/EN /FR</span>';
$_['text_seo_flag_default']	= 'No flag for default:<span class="help">Default language does not use flag</span>';
$_['text_seo_banner']		= 'Banner links rewrite:<span class="help">Dynamically generate seo link on banners (used in banner, carrousel, slideshow modules)</span>';
$_['text_seo_banner_help']	= 'In banners section, do not enter the seo link (/category/product_name) but enter instead the default opencart link : <b>index.php?route=product/product&path=10_21&product_id=54</b>.<br />You can also strip out the index.php, like this : <b>product/product&path=23&product_id=48</b>';

// Tab store seo
$_['tab_seo_store']      			= 'Store SEO';
$_['text_info_store']				= 'In this section you can customize the seo title, h1, meta keywords and description on home page for each store and each language!<br/>Anything entered here will bypass the values entered in opencart settings.';
$_['entry_store_seo_title']      = 'SEO Title:';
$_['entry_store_title']      		= 'Heading Title H1:';
$_['entry_store_desc']      		= 'Meta Description:';
$_['entry_store_keywords']	= 'Meta Keywords:';

// Tab keyword options
$_['tab_seo_transform']			= 'Keyword options';
$_['text_info_transform']		= 'All these settings define the way that the keyword will be generated when saving an item or using the mass update.';
$_['text_seo_whitespace']		= 'Spaces:<span class="help">Replace space chars by...</span>';
$_['text_seo_lowercase']		= 'Lowercase:<span class="help">QWERTY => qwerty</span>';
$_['text_seo_duplicate']			= 'Duplicates:<span class="help">Allow duplicate keyword for a same product</span>';
$_['text_seo_ascii']				= 'ASCII mode:<span class="help">Replace accentuated chars by their ascii equivalent<br/>"éàôï" => "eaoi"</span>';
$_['text_seo_autofill']				= 'Auto fill';
$_['text_seo_autofill_on']		= 'on:';
$_['text_seo_autofill_desc']		= 'Auto fill:<span class="help">If left the field blank on insert or edit, a value will be created automatically based on the pattern in mass update tab.<br/><br/>This works for : <br/>- products<br/>- categories<br/>- informations</span>';
$_['text_seo_autourl']			= 'Auto URL:<span class="help">If left blank on insert or edit, seo url keyword will be generated automatically using the parameter set in "Mass update" tab<br/>This works for products, categories and informations</span>';
$_['text_seo_autotitle']			= 'Auto title and desc for other langs:<span class="help">If left blank on insert or edit, titles and descriptions of other languages will copy the default language title and description<br/>This works for products, categories and informations</span>';
$_['text_insert']						= 'Insert';

// Tab friendly urls
$_['tab_seo_friendly']				= 'Friendly URLs';
$_['text_info_friendly']			= 'Here you can manage the friendly urls, edit them as you want.<br/>You have also the possiblity to add new url, it works for exemple for any custom module you installed, just fill the 1st field with the value in route (?route=mymodule/action) and the 2nd field with the keyword you want to appear in the url.';
$_['text_seo_friendly']			= 'Friendly URLs:';

// Tab full product path
$_['tab_seo_fpp']			= 'Full product path';
$_['entry_category']		= 'Banned categories:<span class="help">Choose the categories that will never be displayed in case of multiple paths</span>';
$_['text_fpp_largest']		= 'Largest path:<span class="help">Display always the largest path when selected, or the shortest if not</span>';
$_['text_fpp_bypasscat']	= 'Rewrite category path:<span class="help">The category link remains the same in order to preserve normal breadcrumbs, but you can enable this option to give the same link for products in multiple categories.<br>In any case the canonical path is preserved so google will only see the url generated by the module for a given product.</span>';
$_['text_info_fpp']			= 'Full product path allows you to display the full url (including the categories) of a product, anywhere.<br/>For example, in modules like latest, featured, etc., the link of the product is <b>yourstore.com/product</b>, with full product path enabled you now have a link like <b>yourstore.com/category/sub_category/product</b>';

// Tab mass update
$_['tab_seo_update']       = 'Mass update';
$_['text_info_update']     = 'Be careful when using this function since it will overwrite all your keywords.<br/>You can use the simulate function to check the result before really update.<br/>Select the language flags to update only these languages.';
$_['text_cleanup']				= 'Clean up:<span class="help">Remove old urls in database, make a clean up if you have troubles with some urls</span>';
$_['text_cleanup_btn']		= 'Clean up';
$_['text_cleanup_done']		= 'Clean up done, %d entries deleted';
$_['text_seo_languages']   = 'Select languages';
$_['text_seo_simulate']    = 'Simulation';
$_['text_seo_reset_urls']  = 'Restore default URLs';
$_['text_seo_remove_urls'] = 'Remove all URLs';
$_['text_seo_add_url']      = 'Add new field';
$_['text_enable']   	 		 = 'Enable';

// Tab about
$_['tab_seo_about']			 = 'About';

$_['text_seo_no_language']    				= 'No language selected';
$_['text_seo_fullscreen']    						= 'Fullscreen';
$_['text_seo_show_old']    						= 'Display old value';
$_['text_seo_change_count']    				= 'lines changed';
$_['text_seo_old_value']    						= 'Old value';
$_['text_seo_new_value']    					= 'New value';
$_['text_seo_simulation_mode']    			= '<span>SIMULATION MODE</span><br/>No changes made to database';
$_['text_seo_write_mode']		    			= '<span>WRITE MODE</span><br/>Modifications have been saved';
$_['text_seo_product']							= 'Product';
$_['text_seo_category']							= 'Category';
$_['text_seo_manufacturer']					= 'Manufacturer';
$_['text_seo_information']						= 'Information';
$_['text_seo_cleanup']							= 'Entry (url)';
$_['text_seo_type_product']					= 'Products';
$_['text_seo_type_category']					= 'Categories';
$_['text_seo_type_manufacturer']			= 'Manufacturers';
$_['text_seo_type_information']				= 'Informations';
$_['text_seo_type_cleanup']					= 'Clean up';
$_['text_seo_generator_product']			= 'Products:';
$_['text_seo_generator_product_desc']	= '<span class="help">Available patterns:<br/><b>[name]</b> : Product name<br/><b>[model]</b> : Model<br/><b>[category]</b> : Category name<br/><b>[brand]</b> : Brand name<br/><b>[desc]</b> : Description extract<br/><br/>Other : <b>[upc]</b> <b>[sku]</b> <b>[ean]</b> <b>[jan]</b> <b>[isbn]</b> <b>[mpn]</b> <b>[location]</b></span>';
$_['text_seo_generator_category']			= 'Categories:';
$_['text_seo_generator_category_desc']	= '<span class="help">Available patterns:<br/><b>[name]</b> : Category name<br/><b>[desc]</b> : Description extract</span>';
$_['text_seo_generator_information']		= 'Informations pages:';
$_['text_seo_generator_information_desc']= '<span class="help">Available patterns:<br/><b>[name]</b> : Information title<br/><b>[desc]</b> : Description extract</span>';
$_['text_seo_generator_manufacturer']	= 'Manufacturers:';
$_['text_seo_generator_manufacturer_desc']= '<span class="help">Available patterns:<br/><b>[name]</b> : Manufacturer name';
$_['text_seo_mode_url']					= 'SEO URLs';
$_['text_seo_mode_title']				= 'Custom SEO Title';
$_['text_seo_mode_keyword'] 		= 'Meta Keywords';
$_['text_seo_mode_description']		= 'Meta Description';
$_['text_seo_generator_url']			= 'Generate URLs';
$_['text_seo_generator_title']			= 'Generate Custom SEO Title';
$_['text_seo_generator_keywords'] = 'Generate Meta Keywords';
$_['text_seo_generator_desc']		= 'Generate Meta Description';

$_['text_seo_result']      = 'Result:';




$_['text_module']          = 'Modules';
$_['text_success']         = 'Success: You have modified module SEO module!';

$_['text_man_ext']				 = 'Manufacturer extended';

// Full product path



// Error
$_['error_permission'] = 'Warning: You do not have permission to modify this module!';
?>