<?php
/*
Code by: bequangtuyen
Y!M: laptrinhvien_ls
Home page: http://opencart.asia
Free module for opencart
*/
class ControllerModuleAdvcategory extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/advcategory');
		
		$this->document->setTitle($this->language->get('heading_title_normal'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->model_setting_setting->editSetting('advcategory', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect(HTTPS_SERVER . 'index.php?route=extension/module&token=' . $this->session->data['token']);
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['button_add_module'] = $this->language->get('button_add_module');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=common/home&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$this->data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=extension/module&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('text_module'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=module/advcategory&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = HTTPS_SERVER . 'index.php?route=module/advcategory&token=' . $this->session->data['token'];
		
		$this->data['cancel'] = HTTPS_SERVER . 'index.php?route=extension/module&token=' . $this->session->data['token'];
		
		
		
		
		
		
		$this->data['modules'] = array();
		
		if (isset($this->request->post['advcategory_module'])) {
			$this->data['modules'] = $this->request->post['advcategory_module'];
		} elseif ($this->config->get('advcategory_module')) { 
			$this->data['modules'] = $this->config->get('advcategory_module');
		}	
		
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		/*
		if (isset($this->request->post['advcategory_position'])) {
			$this->data['advcategory_position'] = $this->request->post['advcategory_position'];
		} else {
			$this->data['advcategory_position'] = $this->config->get('advcategory_position');
		}
		
		if (isset($this->request->post['advcategory_status'])) {
			$this->data['advcategory_status'] = $this->request->post['advcategory_status'];
		} else {
			$this->data['advcategory_status'] = $this->config->get('advcategory_status');
		}
		
		if (isset($this->request->post['advcategory_sort_order'])) {
			$this->data['advcategory_sort_order'] = $this->request->post['advcategory_sort_order'];
		} else {
			$this->data['advcategory_sort_order'] = $this->config->get('advcategory_sort_order');
		}	*/			
		
		$this->template = 'module/advcategory.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/advcategory')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
?>