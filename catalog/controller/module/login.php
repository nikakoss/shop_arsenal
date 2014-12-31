<?php  
class ControllerModuleLogin extends Controller {
	protected function index() {
		$this->language->load('module/login');
        if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$this->data['base'] = $this->config->get('config_ssl');
		} else {
			$this->data['base'] = $this->config->get('config_url');
		}
        $this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_logged'] = sprintf($this->language->get('text_logged'),  $this->customer->getFirstName());
        $this->data['text_forgotten'] = $this->language->get('text_forgotten');
        $this->data['text_account'] = $this->language->get('text_account');
		
                
                
		$this->data['entry_email_address'] = $this->language->get('entry_email_address');
		$this->data['entry_password'] = $this->language->get('entry_password');
		
		$this->data['button_login'] = $this->language->get('button_login');
		$this->data['button_logout'] = $this->language->get('button_logout');
		$this->data['button_create'] = $this->language->get('button_create');
		$this->data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');
        $this->data['account'] = $this->url->link('account/account', '', 'SSL');
		
                
		$this->data['action'] = $this->url->link('account/login', '', 'SSL');
 		$this->data['button_logout_url'] = $this->url->link('account/logout', '', 'SSL');
		$this->id       = 'login';
		//$this->template = $this->config->get('config_template') . 'module/login.tpl';
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/login.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/module/login.tpl';
        } elseif (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . 'module/login.tpl')) { //v1.3.2
				$this->template = $this->config->get('config_template') . 'module/login.tpl';
		} else {
            $this->template = 'default/template/module/login.tpl';
        }
		
		$this->render();
		
	}
}
?>