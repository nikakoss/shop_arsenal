<?php  
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
                
               $this->document->addScript('catalog/view/javascript/jquery/fancybox/jquery.mousewheel-3.0.4.pack.js');
               $this->document->addScript('catalog/view/javascript/jquery/fancybox/jquery.fancybox-1.3.4.pack.js');
                $this->document->addStyle('catalog/view/javascript/jquery/fancybox/jquery.fancybox-1.3.4.css');
                 
		$this->data['heading_title'] = $this->config->get('config_title');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/home.tpl';
		} else {
			$this->template = 'default/template/common/home.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/news_and_blog',
			'common/news_and_blog_two',
			'common/footer',
			'common/header'
		);
										
		$this->response->setOutput($this->render());
	}
}
?>