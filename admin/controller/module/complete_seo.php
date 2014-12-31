<?php
class ControllerModuleCompleteSeo extends Controller {
	private $error = array(); 
	
	public function index() {
		$this->document->addScript('view/seo_package/itoggle.js');
		$this->document->addStyle('view/seo_package/style.css');
		$this->document->addStyle('view/seo_package/iconic/iconic_stroke.css');
		$this->document->addStyle('view/seo_package/awesome/css/font-awesome.min.css');
		
		$this->load->language('module/complete_seo');
		$this->document->setTitle(strip_tags($this->language->get('heading_title')));
		$this->load->model('setting/setting');
		
		// get languages 
		$this->load->model('localisation/language');
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
    // module installation check
    if(!is_file(DIR_CATALOG.'../vqmod/xml/multilingual_seo.xml'))
      $this->session->data['error'] = 'Install not complete : <b>/vqmod/xml/multilingual_seo.xml</b> cannot be found, please manually rename <b>multilingual_seo.xml.disabled</b> to <b>multilingual_seo.xml</b>';
    $index = file_get_contents(DIR_CATALOG.'../index.php');
	
    if(strpos($index, 'new multilingual_seo') === false)
      $this->session->data['error'] = 'Install not complete : multilingual_seo class declaration not found in index.php, maybe the file was not writeable, please change the right and retry to install or manually insert class declaration (see manual)';
    $admin = file_get_contents(DIR_APPLICATION.'/index.php');
	
	
		if(strpos($admin, 'new multilingual_seo') === false)
      $this->session->data['error'] = 'Install not complete : multilingual_seo class declaration not found in admin/index.php, maybe the file was not writeable, please change the right and retry to install or manually insert class declaration (see manual)';
      
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			unset($this->request->post['langs'], $this->request->post['simulate']);
			/* < Complete seo package */
			// full product path 
			if (isset($this->request->post['full_product_path']) && is_file(DIR_CATALOG.'../vqmod/xml/full_product_path.xml.disabled')) {
				if(!rename(DIR_CATALOG.'../vqmod/xml/full_product_path.xml.disabled', DIR_CATALOG.'../vqmod/xml/full_product_path.xml'))
					$this->session->data['error'] = 'Error: /vqmod/xml/ is not writeable.';
			}
			elseif(!isset($this->request->post['full_product_path']) && is_file(DIR_CATALOG.'../vqmod/xml/full_product_path.xml')) {
				if(!rename(DIR_CATALOG.'../vqmod/xml/full_product_path.xml', DIR_CATALOG.'../vqmod/xml/full_product_path.xml.disabled'))
					$this->session->data['error'] = 'Error: /vqmod/xml/ is not writeable.';
			}
			
			// urls management
			foreach($this->data['languages'] as $lang)
			{
				if(isset($this->request->post['multilingual_seo_urls_'.$lang['code']]))
				$this->request->post['multilingual_seo_urls_'.$lang['code']] =  array_combine($this->request->post['multilingual_seo_urls_'.$lang['code']]['keys'], $this->request->post['multilingual_seo_urls_'.$lang['code']]['values']);
			}
			/* Complete seo package > */
			$this->request->post['multilingual_seo_default_lang'] = $this->config->get('config_language');
			$this->model_setting_setting->editSetting('multilingual_seo', $this->request->post);		
			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect($this->url->link('module/complete_seo', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		$this->data['module_version'] = simplexml_load_file(DIR_SYSTEM.'../vqmod/xml/multilingual_seo.xml')->version;
		
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else $this->data['success'] = '';
		
		if (isset($this->session->data['error'])) {
			$this->data['error'] = $this->session->data['error'];
			unset($this->session->data['error']);
		} else $this->data['error'] = '';
		
		$this->data['heading_title'] = $this->language->get('module_title');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['token'] = $this->session->data['token'];
		
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => strip_tags($this->language->get('heading_title')),
			'href'      => $this->url->link('module/complete_seo', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/complete_seo', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->post['multilingual_seo_whitespace'])) {
			$this->data['multilingual_seo_whitespace'] = $this->request->post['multilingual_seo_whitespace'];
		} else {
			$this->data['multilingual_seo_whitespace'] = $this->config->get('multilingual_seo_whitespace');
			if(!$this->data['multilingual_seo_whitespace'])
				$this->data['multilingual_seo_whitespace'] = '-';
		}
		
		if (isset($this->request->post['multilingual_seo_lowercase'])) {
			$this->data['multilingual_seo_lowercase'] = (isset($this->request->post['multilingual_seo_lowercase'])) ? true : false;
		} else {
			$this->data['multilingual_seo_lowercase'] = $this->config->get('multilingual_seo_lowercase');
		}
		
		if (isset($this->request->post['multilingual_seo_extension'])) {
			$this->data['multilingual_seo_extension'] = $this->request->post['multilingual_seo_extension'];
		} else {
			$this->data['multilingual_seo_extension'] = $this->config->get('multilingual_seo_extension');
			if(!$this->data['multilingual_seo_extension'])
				$this->data['multilingual_seo_extension'] = '';
		}
		
		if (isset($this->request->post['multilingual_seo_flag'])) {
			$this->data['multilingual_seo_flag'] = (isset($this->request->post['multilingual_seo_flag'])) ? true : false;
		} else {
			$this->data['multilingual_seo_flag'] = $this->config->get('multilingual_seo_flag');
		}
		
		if (isset($this->request->post['multilingual_seo_flag_upper'])) {
			$this->data['multilingual_seo_flag_upper'] = (isset($this->request->post['multilingual_seo_flag_upper'])) ? true : false;
		} else {
			$this->data['multilingual_seo_flag_upper'] = $this->config->get('multilingual_seo_flag_upper');
		}
		
		if (isset($this->request->post['multilingual_seo_flag_default'])) {
			$this->data['multilingual_seo_flag_default'] = (isset($this->request->post['multilingual_seo_flag_default'])) ? true : false;
		} else {
			$this->data['multilingual_seo_flag_default'] = $this->config->get('multilingual_seo_flag_default');
		}
		
		if (isset($this->request->post['multilingual_seo_duplicate'])) {
			$this->data['multilingual_seo_duplicate'] = (isset($this->request->post['multilingual_seo_duplicate'])) ? true : false;
		} else {
			$this->data['multilingual_seo_duplicate'] = $this->config->get('multilingual_seo_duplicate');
		}
		
		if (isset($this->request->post['multilingual_seo_friendly'])) {
			$this->data['multilingual_seo_friendly'] = (isset($this->request->post['multilingual_seo_friendly'])) ? true : false;
		} else {
			$this->data['multilingual_seo_friendly'] = $this->config->get('multilingual_seo_friendly');
		}
		/* < Complete seo package */
		foreach($this->data['languages'] as $lang)
		{
			if (isset($this->request->post['multilingual_seo_urls_'.$lang['code']])) {
				$this->data['multilingual_seo_urls_'.$lang['code']] = $this->request->post['multilingual_seo_urls_'.$lang['code']];
			} else {
				$this->data['multilingual_seo_urls_'.$lang['code']] = $this->config->get('multilingual_seo_urls_'.$lang['code']);
			}
		}
		/* Complete seo package >*/
		
		// Store SEO tab
		$this->load->model('setting/store');
		$this->data['stores'] = array();
		$this->data['stores'][] = array(
			'store_id' => 0,
			'name'     => $this->config->get('config_name')
		);

		$stores = $this->model_setting_store->getStores();

		foreach ($stores as $store) {
			$action = array();

			$this->data['stores'][] = array(
				'store_id' => $store['store_id'],
				'name'     => $store['name']
			);
		}
		
		if (isset($this->request->post['multilingual_seo_store'])) {
			$this->data['multilingual_seo_store'] = $this->request->post['multilingual_seo_store'];
		} else {
			$this->data['multilingual_seo_store'] = $this->config->get('multilingual_seo_store');
		}
		
		
		// Keyword options
		if (isset($this->request->post['multilingual_seo_absolute'])) {
			$this->data['multilingual_seo_absolute'] = (isset($this->request->post['multilingual_seo_absolute'])) ? true : false;
		} else {
			$this->data['multilingual_seo_absolute'] = $this->config->get('multilingual_seo_absolute');
		}
		
		if (isset($this->request->post['multilingual_seo_ascii'])) {
			$this->data['multilingual_seo_ascii'] = (isset($this->request->post['multilingual_seo_ascii'])) ? true : false;
		} else {
			$this->data['multilingual_seo_ascii'] = $this->config->get('multilingual_seo_ascii');
		}
		
		if (isset($this->request->post['multilingual_seo_prodkw'])) {
			$this->data['multilingual_seo_prodkw'] = $this->request->post['multilingual_seo_prodkw'];
		} else {
			$this->data['multilingual_seo_prodkw'] = $this->config->get('multilingual_seo_prodkw');
		}
		
    if (isset($this->request->post['multilingual_seo_banners'])) {
			$this->data['multilingual_seo_banners'] = (isset($this->request->post['multilingual_seo_banners'])) ? true : false;
		} else {
			$this->data['multilingual_seo_banners'] = $this->config->get('multilingual_seo_banners');
		}
    
    if (isset($this->request->post['multilingual_seo_insertautotitle'])) {
			$this->data['multilingual_seo_insertautotitle'] = (isset($this->request->post['multilingual_seo_insertautotitle'])) ? true : false;
		} else {
			$this->data['multilingual_seo_insertautotitle'] = $this->config->get('multilingual_seo_insertautotitle');
		}
    
    if (isset($this->request->post['multilingual_seo_editautotitle'])) {
			$this->data['multilingual_seo_editautotitle'] = (isset($this->request->post['multilingual_seo_editautotitle'])) ? true : false;
		} else {
			$this->data['multilingual_seo_editautotitle'] = $this->config->get('multilingual_seo_editautotitle');
		}
    
	 if (isset($this->request->post['multilingual_seo_insertautourl'])) {
			$this->data['multilingual_seo_insertautourl'] = (isset($this->request->post['multilingual_seo_insertautourl'])) ? true : false;
		} else {
			$this->data['multilingual_seo_insertautourl'] = $this->config->get('multilingual_seo_insertautourl');
		}
    
    if (isset($this->request->post['multilingual_seo_editautourl'])) {
			$this->data['multilingual_seo_editautourl'] = (isset($this->request->post['multilingual_seo_editautourl'])) ? true : false;
		} else {
			$this->data['multilingual_seo_editautourl'] = $this->config->get('multilingual_seo_editautourl');
		}
		
	if (isset($this->request->post['multilingual_seo_insertautoseotitle'])) {
			$this->data['multilingual_seo_insertautoseotitle'] = (isset($this->request->post['multilingual_seo_insertautoseotitle'])) ? true : false;
		} else {
			$this->data['multilingual_seo_insertautoseotitle'] = $this->config->get('multilingual_seo_insertautoseotitle');
		}
    
    if (isset($this->request->post['multilingual_seo_editautoseotitle'])) {
			$this->data['multilingual_seo_editautoseotitle'] = (isset($this->request->post['multilingual_seo_editautoseotitle'])) ? true : false;
		} else {
			$this->data['multilingual_seo_editautoseotitle'] = $this->config->get('multilingual_seo_editautoseotitle');
		}
		
    if (isset($this->request->post['multilingual_seo_insertautometakeyword'])) {
			$this->data['multilingual_seo_insertautometakeyword'] = (isset($this->request->post['multilingual_seo_insertautometakeyword'])) ? true : false;
		} else {
			$this->data['multilingual_seo_insertautometakeyword'] = $this->config->get('multilingual_seo_insertautometakeyword');
		}
    
    if (isset($this->request->post['multilingual_seo_editautometakeyword'])) {
			$this->data['multilingual_seo_editautometakeyword'] = (isset($this->request->post['multilingual_seo_editautometakeyword'])) ? true : false;
		} else {
			$this->data['multilingual_seo_editautometakeyword'] = $this->config->get('multilingual_seo_editautometakeyword');
		}
		    
	if (isset($this->request->post['multilingual_seo_insertautometadesc'])) {
			$this->data['multilingual_seo_insertautometadesc'] = (isset($this->request->post['multilingual_seo_insertautometadesc'])) ? true : false;
		} else {
			$this->data['multilingual_seo_insertautometadesc'] = $this->config->get('multilingual_seo_insertautometadesc');
		}
    
    if (isset($this->request->post['multilingual_seo_editautometadesc'])) {
			$this->data['multilingual_seo_editautometadesc'] = (isset($this->request->post['multilingual_seo_editautometadesc'])) ? true : false;
		} else {
			$this->data['multilingual_seo_editautometadesc'] = $this->config->get('multilingual_seo_editautometadesc');
		}
		
		// mass update
		if (isset($this->request->post['seo_product_url_pattern'])) {
			$this->data['seo_product_url_pattern'] = $this->request->post['seo_product_url_pattern'];
		} else {
			$this->data['seo_product_url_pattern'] = $this->config->get('seo_product_url_pattern');
		}
		
		if (isset($this->request->post['seo_product_title_pattern'])) {
			$this->data['seo_product_title_pattern'] = $this->request->post['seo_product_title_pattern'];
		} else {
			$this->data['seo_product_title_pattern'] = $this->config->get('seo_product_title_pattern');
		}
		
		if (isset($this->request->post['seo_product_keyword_pattern'])) {
			$this->data['seo_product_keyword_pattern'] = $this->request->post['seo_product_keyword_pattern'];
		} else {
			$this->data['seo_product_keyword_pattern'] = $this->config->get('seo_product_keyword_pattern');
		}
		
		if (isset($this->request->post['seo_product_description_pattern'])) {
			$this->data['seo_product_description_pattern'] = $this->request->post['seo_product_description_pattern'];
		} else {
			$this->data['seo_product_description_pattern'] = $this->config->get('seo_product_description_pattern');
		}
		
		if (isset($this->request->post['seo_category_url_pattern'])) {
			$this->data['seo_category_url_pattern'] = $this->request->post['seo_category_url_pattern'];
		} else {
			$this->data['seo_category_url_pattern'] = $this->config->get('seo_category_url_pattern');
		}
		
		if (isset($this->request->post['seo_category_title_pattern'])) {
			$this->data['seo_category_title_pattern'] = $this->request->post['seo_category_title_pattern'];
		} else {
			$this->data['seo_category_title_pattern'] = $this->config->get('seo_category_title_pattern');
		}
		
		if (isset($this->request->post['seo_category_keyword_pattern'])) {
			$this->data['seo_category_keyword_pattern'] = $this->request->post['seo_category_keyword_pattern'];
		} else {
			$this->data['seo_category_keyword_pattern'] = $this->config->get('seo_category_keyword_pattern');
		}
		
		if (isset($this->request->post['seo_category_description_pattern'])) {
			$this->data['seo_category_description_pattern'] = $this->request->post['seo_category_description_pattern'];
		} else {
			$this->data['seo_category_description_pattern'] = $this->config->get('seo_category_description_pattern');
		}
		
		if (isset($this->request->post['seo_information_url_pattern'])) {
			$this->data['seo_information_url_pattern'] = $this->request->post['seo_information_url_pattern'];
		} else {
			$this->data['seo_information_url_pattern'] = $this->config->get('seo_information_url_pattern');
		}
		
		if (isset($this->request->post['seo_information_title_pattern'])) {
			$this->data['seo_information_title_pattern'] = $this->request->post['seo_information_title_pattern'];
		} else {
			$this->data['seo_information_title_pattern'] = $this->config->get('seo_information_title_pattern');
		}
		
		if (isset($this->request->post['seo_information_keyword_pattern'])) {
			$this->data['seo_information_keyword_pattern'] = $this->request->post['seo_information_keyword_pattern'];
		} else {
			$this->data['seo_information_keyword_pattern'] = $this->config->get('seo_information_keyword_pattern');
		}
		
		if (isset($this->request->post['seo_information_description_pattern'])) {
			$this->data['seo_information_description_pattern'] = $this->request->post['seo_information_description_pattern'];
		} else {
			$this->data['seo_information_description_pattern'] = $this->config->get('seo_information_description_pattern');
		}
		
		if (isset($this->request->post['seo_manufacturer_url_pattern'])) {
			$this->data['seo_manufacturer_url_pattern'] = $this->request->post['seo_manufacturer_url_pattern'];
		} else {
			$this->data['seo_manufacturer_url_pattern'] = $this->config->get('seo_manufacturer_url_pattern');
		}
		
			
			// full product path
			
			$this->data['full_product_path'] = (is_file(DIR_CATALOG.'../vqmod/xml/full_product_path.xml'));
			
			if (isset($this->request->post['full_product_path_largest'])) {
				$this->data['full_product_path_largest'] = (isset($this->request->post['full_product_path_largest'])) ? true : false;
			} else {
				$this->data['full_product_path_largest'] = $this->config->get('full_product_path_largest');
			}
      
      if (isset($this->request->post['full_product_path_bypasscat'])) {
        $this->data['full_product_path_bypasscat'] = (isset($this->request->post['full_product_path_bypasscat'])) ? true : false;
      }elseif ($this->request->server['REQUEST_METHOD'] == 'POST') {
        $this->data['full_product_path_bypasscat'] = false;
      } else {
        $this->data['full_product_path_bypasscat'] = $this->config->get('full_product_path_bypasscat');
      }
			
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && isset($this->request->post['full_product_path_categories'])) {
				$this->data['full_product_path_categories'] = $this->request->post['full_product_path_categories'];
			}elseif ($this->request->server['REQUEST_METHOD'] == 'POST') {
				$this->data['full_product_path_categories'] = array();
			} else {
				$this->data['full_product_path_categories'] = $this->config->get('full_product_path_categories') ? $this->config->get('full_product_path_categories') : array();
			}		
			
			// categories management
			$this->load->model('catalog/category');
			$this->data['categories'] = $this->model_catalog_category->getCategories(0);
			
		/*** Full product path ***/
		
		$this->template = 'module/complete_seo.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	public function reset_urls()
	{
    $this->load->language('module/complete_seo');
		$this->load->model('setting/friendlyurls');
		$this->load->model('setting/setting');
		$settings = $this->model_setting_setting->getSetting('multilingual_seo');
		
		if($this->request->get['type'] == 'reset')
			$settings['multilingual_seo_urls_'.$this->request->get['lang']] = $this->model_setting_friendlyurls->getFriendlyUrls($this->request->get['lang']);
		else
			$settings['multilingual_seo_urls_'.$this->request->get['lang']] = array();
			
		$this->model_setting_setting->editSetting('multilingual_seo', $settings);
		$this->session->data['success'] = $this->language->get('text_success');
		$this->redirect($this->url->link('module/complete_seo', 'token=' . $this->session->data['token'], 'SSL'));
	}
	
	public function generator_product($mode, $simulate) {
		if (!isset($this->request->get['langs'])) { $this->data['langs'] = array(); return;}
		
		// get languages 
		$this->load->model('tool/seo_package');
		$this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();
		foreach($languages as $language)
		{
			$lang_code[$language['language_id']] = $language['code'];
			$lang_img[$language['language_id']] = $language['image'];
		}
		unset($languages);
		
		$values = array();
		foreach($this->request->get['langs'] as $lang)
		{
			$values[$lang]['lang_img'] = $lang_img[$lang];
			$change_count = 0;
			
			if($mode == 'url') {
				if(!$simulate) {
					$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query LIKE 'product_id=%' AND language_id IN (".$lang.", 0)");
				}
			}
			
			$pattern = $this->request->get['seo_product_'.$mode.'_pattern'];
			
			$rows = $this->db->query("SELECT pd.name, pd.product_id, pd.description, pd.seo_keyword, pd.seo_title, pd.meta_keyword, pd.meta_description, pd.language_id, p.model, p.sku, p.model, p.upc, p.ean, p.jan, p.isbn, p.mpn, p.location, p.manufacturer_id FROM " . DB_PREFIX . "product_description pd LEFT JOIN " . DB_PREFIX . "product p ON p.product_id = pd.product_id WHERE language_id=".$lang." ORDER BY product_id,language_id")->rows;
			foreach ($rows as $row)
			{
				$value = $this->model_tool_seo_package->transformProduct($pattern, $lang, $row);
				
				// urls
				if($mode == 'url')
				{
					$value = $this->model_tool_seo_package->filter_seo($value, 'product', $row['product_id']);
					
					if(!$simulate){
						$this->db->query("UPDATE " . DB_PREFIX . "product_description SET seo_keyword = '". $this->db->escape($value) ."' WHERE product_id = '" . $row['product_id'] . "' AND language_id = '" . $row['language_id'] . "' ");
						$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . $row['product_id'] . "', language_id = '" . $row['language_id'] . "', keyword = '" . $this->db->escape($value) . "'");
					}
					$field = 'seo_keyword';
				}
				// Meta title
				elseif($mode == 'title')
				{
					if(!$simulate){
						$this->db->query("UPDATE " . DB_PREFIX . "product_description SET seo_title = '" . $this->db->escape($value) . "' WHERE product_id = '" . $row['product_id'] . "' AND language_id = '" . $row['language_id'] . "' ");
					}
					$field = 'seo_title';
				}
				// Meta keywords
				elseif($mode == 'keyword')
				{
					if(!$simulate){
						$this->db->query("UPDATE " . DB_PREFIX . "product_description SET meta_keyword = '" . $this->db->escape($value) . "' WHERE product_id = '" . $row['product_id'] . "' AND language_id = '" . $row['language_id'] . "' ");
					}
					$field = 'meta_keyword';
				}
				// Meta description
				elseif($mode == 'description')
				{
					if(!$simulate){
						$this->db->query("UPDATE " . DB_PREFIX . "product_description SET meta_description = '" . $this->db->escape($value) . "' WHERE product_id = '" . $row['product_id'] . "' AND language_id = '" . $row['language_id'] . "' ");
					}
					$field = 'meta_description';
				}
				$values[$lang]['rows'][] = array(
					'link' =>  $this->url->link('catalog/product/update', 'token=' . $this->session->data['token'] . '&product_id=' . $row['product_id'], 'SSL'),
					'name' =>  $row['name'],
					'old_value' =>  $row[$field],
					'value' =>  $value,
					'changed' =>  !($value === $row[$field]),
				);
				!($value === $row[$field]) and $change_count++;
			} // end foreach $rows
			$values[$lang]['count'] = $change_count;
		}
		$this->data['langs'] = &$values;
	}
	
	public function generator_category($mode, $simulate) {
		if (!isset($this->request->get['langs'])) { $this->data['langs'] = array(); return;}
		
		// get languages 
		$this->load->model('tool/seo_package');
		$this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();
		foreach($languages as $language)
		{
			$lang_code[$language['language_id']] = $language['code'];
			$lang_img[$language['language_id']] = $language['image'];
		}
		unset($languages);
		
		$values = array();
		foreach($this->request->get['langs'] as $lang)
		{
			$values[$lang]['lang_img'] = $lang_img[$lang];
			$change_count = 0;
			
			if($mode == 'url') {
				if(!$simulate) {
					$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query LIKE 'category_id=%' AND language_id IN (".$lang.", 0)");
				}
			}
			
			$pattern = $this->request->get['seo_category_'.$mode.'_pattern'];
			
			$rows = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_description WHERE language_id=".$lang." ORDER BY category_id")->rows;
			foreach ($rows as $row)
			{
				$value = $this->model_tool_seo_package->transformCategory($pattern, $lang, $row);
						
				// urls
				if($mode == 'url')
				{
					$value = $this->model_tool_seo_package->filter_seo($value, 'category', $row['category_id']);
					
					if(!$simulate){
						$this->db->query("UPDATE " . DB_PREFIX . "category_description SET seo_keyword = '". $this->db->escape($value) ."' WHERE category_id = '" . $row['category_id'] . "' AND language_id = '" . $row['language_id'] . "' ");
						$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'category_id=" . $row['category_id'] . "', language_id = '" . $row['language_id'] . "', keyword = '" . $this->db->escape($value) . "'");
					}
					$field = 'seo_keyword';
				}
				// Meta title
				elseif($mode == 'title')
				{
					if(!$simulate){
						$this->db->query("UPDATE " . DB_PREFIX . "category_description SET seo_title = '" . $this->db->escape($value) . "' WHERE category_id = '" . $row['category_id'] . "' AND language_id = '" . $row['language_id'] . "' ");
					}
					$field = 'seo_title';
				}
				// Meta keywords
				elseif($mode == 'keyword')
				{
					if(!$simulate){
						$this->db->query("UPDATE " . DB_PREFIX . "category_description SET meta_keyword = '" . $this->db->escape($value) . "' WHERE category_id = '" . $row['category_id'] . "' AND language_id = '" . $row['language_id'] . "' ");
					}
					$field = 'meta_keyword';
				}
				// Meta description
				elseif($mode == 'description')
				{
					if(!$simulate){
						$this->db->query("UPDATE " . DB_PREFIX . "category_description SET meta_description = '" . $this->db->escape($value) . "' WHERE category_id = '" . $row['category_id'] . "' AND language_id = '" . $row['language_id'] . "' ");
					}
					$field = 'meta_description';
				}
				$values[$lang]['rows'][] = array(
					'link' =>  $this->url->link('catalog/category/update', 'token=' . $this->session->data['token'] . '&category_id=' . $row['category_id'], 'SSL'),
					'name' =>  $row['name'],
					'old_value' =>  $row[$field],
					'value' =>  $value,
					'changed' =>  !($value === $row[$field]),
				);
				!($value === $row[$field]) and $change_count++;
			} // end foreach $rows
			$values[$lang]['count'] = $change_count;
		}
		$this->data['langs'] = &$values;
	}
	
	public function generator_information($mode, $simulate) {
		if (!isset($this->request->get['langs'])) { $this->data['langs'] = array(); return;}
		
		// get languages 
		$this->load->model('tool/seo_package');
		$this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();
		foreach($languages as $language)
		{
			$lang_code[$language['language_id']] = $language['code'];
			$lang_img[$language['language_id']] = $language['image'];
		}
		unset($languages);
		
		$values = array();
		foreach($this->request->get['langs'] as $lang)
		{
			$values[$lang]['lang_img'] = $lang_img[$lang];
			$change_count = 0;
			
			if($mode == 'url') {
				if(!$simulate) {
					$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query LIKE 'information_id=%' AND language_id IN (".$lang.", 0)");
				}
			}
			
			$pattern = $this->request->get['seo_information_'.$mode.'_pattern'];
			
			$rows = $this->db->query("SELECT * FROM " . DB_PREFIX . "information_description WHERE language_id=".$lang." ORDER BY information_id")->rows;
			foreach ($rows as $row)
			{
				$value = $this->model_tool_seo_package->transformInformation($pattern, $lang, $row);
						
				// urls
				if($mode == 'url')
				{
					$value = $this->model_tool_seo_package->filter_seo($value, 'information', $row['information_id']);
					
					if(!$simulate){
						$this->db->query("UPDATE " . DB_PREFIX . "information_description SET seo_keyword = '". $this->db->escape($value) ."' WHERE information_id = '" . $row['information_id'] . "' AND language_id = '" . $row['language_id'] . "' ");
						$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'information_id=" . $row['information_id'] . "', language_id = '" . $row['language_id'] . "', keyword = '" . $this->db->escape($value) . "'");
					}
					$field = 'seo_keyword';
				}
				// Meta title
				elseif($mode == 'title')
				{
					if(!$simulate){
						$this->db->query("UPDATE " . DB_PREFIX . "information_description SET seo_title = '" . $this->db->escape($value) . "' WHERE information_id = '" . $row['information_id'] . "' AND language_id = '" . $row['language_id'] . "' ");
					}
					$field = 'seo_title';
				}
				// Meta keywords
				elseif($mode == 'keyword')
				{
					if(!$simulate){
						$this->db->query("UPDATE " . DB_PREFIX . "information_description SET meta_keyword = '" . $this->db->escape($value) . "' WHERE information_id = '" . $row['information_id'] . "' AND language_id = '" . $row['language_id'] . "' ");
					}
					$field = 'meta_keyword';
				}
				// Meta description
				elseif($mode == 'description')
				{
					if(!$simulate){
						$this->db->query("UPDATE " . DB_PREFIX . "information_description SET meta_description = '" . $this->db->escape($value) . "' WHERE information_id = '" . $row['information_id'] . "' AND language_id = '" . $row['language_id'] . "' ");
					}
					$field = 'meta_description';
				}
				$values[$lang]['rows'][] = array(
					'link' =>  $this->url->link('catalog/information/update', 'token=' . $this->session->data['token'] . '&information_id=' . $row['information_id'], 'SSL'),
					'name' =>  $row['title'],
					'old_value' =>  $row[$field],
					'value' =>  $value,
					'changed' =>  !($value === $row[$field]),
				);
				!($value === $row[$field]) and $change_count++;
			} // end foreach $rows
			$values[$lang]['count'] = $change_count;
		}
		$this->data['langs'] = &$values;
	}
	
	public function generator_manufacturer($mode, $simulate) {
		$this->load->model('tool/seo_package');
		
		$values = array();
		$values['lang_img'] = '';
		$values['no_old'] = true;
		
		if($mode == 'url' && !$simulate) {
			$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query LIKE 'manufacturer_id=%' AND language_id=0");
		}
		
		$pattern = $this->request->get['seo_information_'.$mode.'_pattern'];
		
		$rows = $this->db->query("SELECT name, manufacturer_id FROM " . DB_PREFIX . "manufacturer ORDER BY manufacturer_id")->rows;
		
		foreach ($rows as $row)
		{
			$value = $this->model_tool_seo_package->transformManufacturer($pattern, false, $row);
			
			if($mode == 'url')
			{
				$value = $this->model_tool_seo_package->filter_seo($value, 'manufacturer', $row['manufacturer_id']);

				if(!$simulate){
					$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'manufacturer_id=" . $row['manufacturer_id'] . "', language_id = 0, keyword = '" . $this->db->escape($value) . "'");
				}
			}
			$values['rows'][] = array(
					'link' =>  $this->url->link('catalog/manufacturer/update', 'token=' . $this->session->data['token'] . '&manufacturer_id=' . $row['manufacturer_id'], 'SSL'),
					'name' =>  $row['name'],
					'old_value' =>  '',
					'value' =>  $value,
					'changed' =>  0,
				);
		}
		$this->data['langs'][0] = &$values;
	  }
	  
	public function generator_cleanup($mode, $simulate) {
		$values = array();
		$values['lang_img'] = '';
		$values['no_old'] = true;
		$values['rows'] = array();
		
		$urls = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE (query LIKE 'category_id=%' OR query LIKE 'product_id=%') AND language_id=0")->rows;
			foreach ($urls as $url)
			{
				$values['rows'][] = array(
					'link' =>  0,
					'name' =>  $url['query'] . ' ('.$url['keyword'].')',
					'old_value' =>  '',
					'value' =>  'deleted',
					'changed' =>  0,
				);
			}
			if(!$simulate)
				$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE (query LIKE 'category_id=%' OR query LIKE 'product_id=%') AND language_id=0");
				
			$this->data['langs'][0] = &$values;
			$this->data['langs'][0]['count'] = count($urls);
	}
	
	public function generator() {
	//sleep (2);
		$this->load->language('module/complete_seo');
		
		if (!isset($this->request->get['type'])) return;
		if (!isset($this->request->get['mode'])) return;
		
		$this->data['type'] = $type = $this->request->get['type'];
		$this->data['mode'] = $mode = $this->request->get['mode'];
		$this->data['simulate'] = $simulate = isset($this->request->get['simulate']);
		
		$this->{'generator_'.$type}($mode, $simulate);
		
		$this->template = 'module/seo_generator.tpl';
		echo $this->render();
	}
	
	public function install() {
		if(!$this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "product_description` LIKE 'seo_keyword'")->row)
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "product_description` ADD `seo_keyword` VARCHAR(64) NOT NULL");
		if(!$this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "information_description` LIKE 'seo_keyword'")->row)
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "information_description` ADD `seo_keyword` VARCHAR(64) NOT NULL");
		if(!$this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "category_description` LIKE 'seo_keyword'")->row)
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "category_description` ADD `seo_keyword` VARCHAR(64) NOT NULL");
    if(!$this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "product_description` LIKE 'seo_title'")->row)
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "product_description` ADD `seo_title` VARCHAR(255) NOT NULL");
		if(!$this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "information_description` LIKE 'seo_title'")->row)
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "information_description` ADD `seo_title` VARCHAR(255) NOT NULL");
    if(!$this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "information_description` LIKE 'meta_description'")->row)
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "information_description` ADD `meta_description` VARCHAR(255) NOT NULL");
    if(!$this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "information_description` LIKE 'meta_keyword'")->row)
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "information_description` ADD `meta_keyword` VARCHAR(255) NOT NULL");
		if(!$this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "category_description` LIKE 'seo_title'")->row)
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "category_description` ADD `seo_title` VARCHAR(255) NOT NULL");
		if(!$this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "url_alias` LIKE 'language_id'")->row)
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "url_alias` ADD `language_id` INT(2) NOT NULL DEFAULT '0'");
			
		if(is_file(DIR_CATALOG.'../vqmod/xml/multilingual_seo.xml.disabled'))
			if(!rename(DIR_CATALOG.'../vqmod/xml/multilingual_seo.xml.disabled', DIR_CATALOG.'../vqmod/xml/multilingual_seo.xml'))
				die('Error: /vqmod/xml/ is not writeable.');
		
		// get languages 
		$this->load->model('localisation/language');
		$this->load->model('setting/friendlyurls');
		$languages = $this->model_localisation_language->getLanguages();
		$friendly_urls = array();
		foreach($languages as $language)
		{
			$friendly_urls['multilingual_seo_urls_'.$language['code']] = $this->model_setting_friendlyurls->getFriendlyUrls($language['code']);
		}
		$this->load->model('setting/setting');
		$this->model_setting_setting->editSetting('multilingual_seo', array(
				'multilingual_seo_whitespace' => '-',
				'multilingual_seo_extension' => '',
				'multilingual_seo_absolute' => true,
				'multilingual_seo_lowercase' => true,
				'multilingual_seo_duplicate' => true,
				'multilingual_seo_default_lang' => $this->config->get('config_language'),
				'multilingual_seo_insertautotitle' => true,
				'multilingual_seo_insertautourl' => true,
				'multilingual_seo_editautourl' => true,
				'multilingual_seo_insertautometakeyword' => true,
				'multilingual_seo_editautometakeyword' => true,
				'multilingual_seo_insertautoseotitle' => true,
				'multilingual_seo_editautoseotitle' => true,
				'multilingual_seo_insertautometadesc' => true,
				'multilingual_seo_editautometadesc' => true,
				'multilingual_seo_banners' => true,
				'seo_product_url_pattern' => '[model]-[name]-[brand]',
				'seo_product_title_pattern' => '[name] - [model] - [category]',
				'seo_product_keyword_pattern' => '[name] [model] [category]',
				'seo_product_description_pattern' => '[name] - [model] - [category] - [desc]',
				'seo_category_url_pattern' => '[name]',
				'seo_category_title_pattern' => '[name]',
				'seo_category_keyword_pattern' => '[name] [desc]',
				'seo_category_description_pattern' => '[name] - [desc]',
				'seo_information_url_pattern' => '[name]',
				'seo_information_title_pattern' => '[name]',
				'seo_information_keyword_pattern' => '[name] [desc]',
				'seo_information_description_pattern' => '[name] - [desc]',
				'seo_manufacturer_url_pattern' => '[name]',
			) + $friendly_urls);
			
		
		if(is_writable(DIR_CATALOG.'../index.php'))
		{
			$index = file_get_contents(DIR_CATALOG.'../index.php');
			if(strpos($index, 'new multilingual_seo') === false){
				$index = str_replace('$languages = array();', '$languages = array();'."\n".'$multilingual = new multilingual_seo($registry); $multilingual->detect();', $index);
				file_put_contents(DIR_CATALOG.'../index.php', $index);
			}
		}
		else
		{
			die('The automatic installation failed, please follow the steps for manual installation in the readme file. 1');
		}
			
		if(is_writable(DIR_APPLICATION.'/index.php'))
		{
		$admin = file_get_contents(DIR_APPLICATION.'/index.php');
		if(strpos($admin, 'new multilingual_seo') === false){
			if(strpos($admin, 'VQMod') !== false)
			{
			$admin = str_replace('$registry->set(\'language\', $language);', '$registry->set(\'language\', $language);'."\n".'require_once(DIR_SYSTEM . \'library/multilingual_seo.php\'); $multilingual = new multilingual_seo($registry); $registry->set(\'multilingual_seo\', $multilingual);', $admin);
			file_put_contents(DIR_APPLICATION.'/index.php', $admin);
		}
				else
				{
					die('Vqmod is not installed, please refer to the readme and follow the installation steps, then come back and reinstall the module.');
				}
			}
			}
		else
		{
			die('The automatic installation failed, please follow the steps for manual installation in the readme file (only for admin part).');
		}
		
		$this->load->model('user/user_group');
		$this->model_user_user_group->addPermission($this->user->getId(), 'access', 'module/complete_seo');
		$this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'module/complete_seo');
		
		header('Location:index.php?route=extension/module&token=' . $this->session->data['token']);
	}
	
	public function uninstall() {
    if($this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "product_description` LIKE 'seo_keyword'")->row)
		$this->db->query("ALTER TABLE `" . DB_PREFIX . "product_description` DROP `seo_keyword`");
    if($this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "information_description` LIKE 'seo_keyword'")->row)
		$this->db->query("ALTER TABLE `" . DB_PREFIX . "information_description` DROP `seo_keyword`");
    if($this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "category_description` LIKE 'seo_keyword'")->row)
		$this->db->query("ALTER TABLE `" . DB_PREFIX . "category_description` DROP `seo_keyword`");
    if($this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "product_description` LIKE 'seo_title'")->row)
      $this->db->query("ALTER TABLE `" . DB_PREFIX . "product_description` DROP `seo_title`");
    if($this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "information_description` LIKE 'seo_title'")->row)
      $this->db->query("ALTER TABLE `" . DB_PREFIX . "information_description` DROP `seo_title`");
    if($this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "information_description` LIKE 'meta_description'")->row)
      $this->db->query("ALTER TABLE `" . DB_PREFIX . "information_description` DROP `meta_description`");
    if($this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "information_description` LIKE 'meta_keyword'")->row)
      $this->db->query("ALTER TABLE `" . DB_PREFIX . "information_description` DROP `meta_keyword`");
    if($this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "category_description` LIKE 'seo_title'")->row)
      $this->db->query("ALTER TABLE `" . DB_PREFIX . "category_description` DROP `seo_title`");
    
		//$default_lang = $this->db->query("SELECT language_id FROM " . DB_PREFIX . "language WHERE code = '" . $this->config->get('config_language') . "'")->row['language_id'];
		$default_lang = $this->config->get('config_language_id');
		$this->db->query("DELETE FROM `" . DB_PREFIX . "url_alias` WHERE language_id <> " . $default_lang);
		$this->db->query("ALTER TABLE `" . DB_PREFIX . "url_alias` DROP `language_id`");
		
		if(is_file(DIR_CATALOG.'../vqmod/xml/multilingual_seo.xml'))
			rename(DIR_CATALOG.'../vqmod/xml/multilingual_seo.xml', DIR_CATALOG.'../vqmod/xml/multilingual_seo.xml.disabled');
		$index = file_get_contents(DIR_CATALOG.'../index.php');
		$index = str_replace('$multilingual = new multilingual_seo($registry); $multilingual->detect();', '', $index);
		file_put_contents(DIR_CATALOG.'../index.php', $index);
		
		$admin = file_get_contents(DIR_APPLICATION.'/index.php');
		$admin = str_replace('require_once(DIR_SYSTEM . \'library/multilingual_seo.php\'); $multilingual = new multilingual_seo($registry); $registry->set(\'multilingual_seo\', $multilingual);', '', $admin);
		file_put_contents(DIR_APPLICATION.'index.php', $admin);
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/complete_seo')) {
			$this->error['error'] = $this->language->get('error_permission');
		}
		
		if (!$this->error)
			return true;
		return false;
	}
}
?>