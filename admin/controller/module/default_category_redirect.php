<?php
class ControllerModuleDefaultCategoryRedirect extends Controller {
	private $error = array();
	
	public function index() {
		
		$this->language->load('module/default_category_redirect');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			foreach ($this->request->post['default_category_redirect'] as $store) {
				
				$this->model_setting_setting->editSetting('default_category_redirect', $store['default_category_redirect'], $store['store_id']);
			}
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->redirect($this->url->link('module/default_category_redirect', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		$languages = array(
			'heading_title',
			'text_enabled',
			'text_disabled',
			'text_content_top',
			'text_content_bottom',
			'text_column_left',
			'text_column_right',
			'entry_always_redirect',
			'entry_selective_redirect',
			'entry_redirect_if_no_path',
			'entry_status',
			'help_always_redirect',
			'help_selective_redirect',
			'help_redirect_if_no_path',
			'button_save',
			'button_cancel',
			'button_add_module',
			'button_remove',
		);
		
		foreach ($languages as $language) {
			$this->data[$language] = $this->language->get($language);
		}
		
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
		
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
			'href'      => $this->url->link('module/default_category_redirect', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);
		
		$this->data['action'] = $this->url->link('module/default_category_redirect', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['token'] = $this->session->data['token'];
		
		$this->load->model('setting/store');
		
		$stores = $this->model_setting_store->getStores();
		
		$this->data['stores'][] = array(
			'store_id' => 0,
			'name'     => $this->config->get('config_name') . $this->language->get('text_default'),
			'url'      => HTTP_CATALOG,
		);
		
		foreach ($stores as $store) {
			$this->data['stores'][] = $store;
		}
		
		$this->load->model('setting/setting');
		
		$this->data['default_category_redirect'] = array();
		
		if (isset($this->request->post['default_category_redirect'])) {
			$this->data['default_category_redirect'] = $this->request->post['default_category_redirect'];
		} elseif($this->model_setting_setting->getSetting('default_category_redirect')) {
			foreach ($this->data['stores'] as $store) {
				$this->data['default_category_redirect'][$store['store_id']]['default_category_redirect'] = $this->model_setting_setting->getSetting('default_category_redirect',$store['store_id']);
			}
		}
		
		$this->template = 'module/default_category_redirect.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
		
		$this->response->setOutput($this->render());
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/default_category_redirect')) {
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