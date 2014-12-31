<?php  
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));

		$this->data['heading_title'] = $this->config->get('config_title');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/home.tpl';
		} else {
			$this->template = 'default/template/common/home.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/column_center',
			'common/content_top',
			'common/content_bottom',			
			'common/footer',
                        'common/footer_menu',
			'common/header'
		);
		
		// seo meta
		$seo_meta = $this->config->get('multilingual_seo_store');
		if (isset($seo_meta[$this->config->get('config_store_id').$this->config->get('config_language_id')])) {
			$seo_meta = $seo_meta[$this->config->get('config_store_id').$this->config->get('config_language_id')];
		}
		
		if (isset($seo_meta['seo_title']) && $seo_meta['seo_title']) {
			$this->document->setTitle($seo_meta['seo_title']);
		} else {
			$this->document->setTitle($this->config->get('config_title'));
		}
		
		if (isset($seo_meta['description']) && $seo_meta['description']) {
			$this->document->setDescription($seo_meta['description']);
		} else {
			$this->document->setDescription($this->config->get('config_meta_description'));
		}
		
		if (isset($seo_meta['keywords']) && $seo_meta['keywords']) {
			$this->document->setKeywords($seo_meta['keywords']);
		}
		
		if (isset($seo_meta['title']) && $seo_meta['title']) {
			$this->data['heading_title'] = $seo_meta['title'];
		} else {
			$this->data['heading_title'] = $this->config->get('config_title');
		}
		// end - seo meta
										
		$this->response->setOutput($this->render());
	}
}
?>