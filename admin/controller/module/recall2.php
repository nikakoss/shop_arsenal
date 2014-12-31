<?php
class ControllerModuleRecall2 extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/recall2');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			$this->model_setting_setting->editSetting('recall2', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		$this->data['text_sendsms'] = $this->language->get('text_sendsms');
		$this->data['text_smslength'] = $this->language->get('text_smslength');
		$this->data['text_show'] = $this->language->get('text_show');
		$this->data['text_required'] = $this->language->get('text_required');
		$this->data['text_fields'] = $this->language->get('text_fields');
		$this->data['text_name'] = $this->language->get('text_name');
		$this->data['text_email'] = $this->language->get('text_email');
		$this->data['text_time'] = $this->language->get('text_time');
		$this->data['text_comment'] = $this->language->get('text_comment');
		$this->data['text_phone'] = $this->language->get('text_phone');

		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
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
			'href'      => $this->url->link('module/recall2', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/recall2', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['modules'] = array();
		
		if (isset($this->request->post['recall2_module'])) {
			$this->data['modules'] = $this->request->post['recall2_module'];
		} elseif ($this->config->get('recall2_module')) { 
			$this->data['modules'] = $this->config->get('recall2_module');
		}	
				
		if (isset($this->request->post['sendsms'])) {
			$this->data['sendsms'] = $this->request->post['sendsms'];
		} elseif ($this->config->get('sendsms')) {
			$this->data['sendsms'] = $this->config->get('sendsms');
		}else{
			$this->data['sendsms'] = false;
		}

		if (isset($this->request->post['smslength'])) {
			$this->data['smslength'] = $this->request->post['smslength'];
		} elseif ($this->config->get('smslength')) {
			$this->data['smslength'] = $this->config->get('smslength');
		} else {
			$this->data['smslength'] = 70;
		}

		if (isset($this->request->post['show_name'])) {
			$this->data['show_name'] = $this->request->post['show_name'];
		} elseif ($this->config->get('show_name')) {
			$this->data['show_name'] = $this->config->get('show_name');
		} else {
			$this->data['show_name'] = false;
		}

		if (isset($this->request->post['show_email'])) {
			$this->data['show_email'] = $this->request->post['show_email'];
		} elseif ($this->config->get('show_email')) {
			$this->data['show_email'] = $this->config->get('show_email');
		} else {
			$this->data['show_email'] = false;
		}

		if (isset($this->request->post['show_time'])) {
			$this->data['show_time'] = $this->request->post['show_time'];
		} elseif ($this->config->get('show_time')) {
			$this->data['show_time'] = $this->config->get('show_time');
		} else {
			$this->data['show_time'] = false;
		}

		if (isset($this->request->post['show_comment'])) {
			$this->data['show_comment'] = $this->request->post['show_comment'];
		} elseif ($this->config->get('show_comment')) {
			$this->data['show_comment'] = $this->config->get('show_comment');
		} else {
			$this->data['show_comment'] = false;
		}

		if (isset($this->request->post['required_name'])) {
			$this->data['required_name'] = $this->request->post['required_name'];
		} elseif ($this->config->get('required_name')) {
			$this->data['required_name'] = $this->config->get('required_name');
		} else {
			$this->data['required_name'] = false;
		}

		if (isset($this->request->post['required_email'])) {
			$this->data['required_email'] = $this->request->post['required_email'];
		} elseif ($this->config->get('required_email')) {
			$this->data['required_email'] = $this->config->get('required_email');
		} else {
			$this->data['required_email'] = false;
		}

		if (isset($this->request->post['required_time'])) {
			$this->data['required_time'] = $this->request->post['required_time'];
		} elseif ($this->config->get('required_time')) {
			$this->data['required_time'] = $this->config->get('required_time');
		} else {
			$this->data['required_time'] = false;
		}

		if (isset($this->request->post['required_comment'])) {
			$this->data['required_comment'] = $this->request->post['required_comment'];
		} elseif ($this->config->get('required_comment')) {
			$this->data['required_comment'] = $this->config->get('required_comment');
		} else {
			$this->data['required_comment'] = false;
		}

		if (isset($this->request->post['required_phone'])) {
			$this->data['required_phone'] = $this->request->post['required_phone'];
		} elseif ($this->config->get('required_phone')) {
			$this->data['required_phone'] = $this->config->get('required_phone');
		} else {
			$this->data['required_phone'] = false;
		}

		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/recall2.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
				
		$this->response->setOutput($this->render());
	}

	public function install(){
		$this->load->model('setting/setting');
		$this->model_setting_setting->editSetting('recall2', array('smslength' => 70, 'sendsms' => false, 
			'show_comment' => false, 'show_time' => false, 'show_email' => false, 'show_name' => false, 
			'required_comment' => false, 'required_time' => false, 'required_email' => false, 'required_name' => false, 'required_phone' => true));
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/recall2')) {
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