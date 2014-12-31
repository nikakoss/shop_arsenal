<?php
class ControllerModuleAninews extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/aninews');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		$this->load->model('aninews/aninews');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('aninews', $this->request->post);
			
			
			$this->model_aninews_aninews->saveSettings($this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['entry_status'] = $this->language->get('entry_status');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		
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
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/aninews', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/aninews', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		
		$style_array = $this->model_aninews_aninews->getAssets('ani_style');
		$this->data['style_array'] = $style_array;
		
		$text_array = $this->model_aninews_aninews->getAssets('ani_text');
		$this->data['text_array'] = $text_array;
			
		if (isset($this->request->post['aninews_module'])) {
			$this->data['aninews_module_status'] = $this->request->post['aninews_module'];
		} elseif ($this->config->get('aninews_module_status')) { 
			$this->data['aninews_module_status'] = $this->config->get('aninews_module_status');
		}	
		
		if (isset($this->request->post['ani_background_color'])) {
			$this->data['ani_background_color'] = $this->request->post['ani_background_color'];
		} else { 
			$this->data['ani_background_color'] = $style_array['ani_background_color'];
		}	


		if (isset($this->request->post['ani_heading'])) {
			$this->data['ani_heading'] = $this->request->post['ani_heading'];
		} else { 
			$this->data['ani_heading'] = $text_array['ani_heading'];
		}	
		
		$this->template = 'module/aninews.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}


    public function install(){
        $this->load->model('aninews/aninews');
        $this->load->model('setting/setting');
        
        $this->model_aninews_aninews->install();
        
        $this->model_setting_setting->editSetting('aninews', array('aninews_module_status' => '1'));
    }
    
    public function uninstall(){        
        $this->load->model('aninews/aninews');
        
        $this->model_aninews_aninews->uninstall();
    }

	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/aninews')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>