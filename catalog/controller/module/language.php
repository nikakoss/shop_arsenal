<?php  
class ControllerModuleLanguage extends Controller {
	protected function index() {
    	if (isset($this->request->post['language_code'])) {
			$this->session->data['language'] = $this->request->post['language_code'];
		
			if (isset($this->request->post['redirect'])) {
				//$this->redirect($this->request->post['redirect']);
				if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
          $connection = 'SSL';
       		 } else {
				  $connection = 'NONSSL';
				}
				$redir_route = $this->request->post['redirect'];
				if($redir_params = strstr($redir_route, '&'))
					$redir_route = str_replace($redir_params, '', $redir_route);
				else $redir_params = '';
				$this->redirect($this->url->link($redir_route, str_replace('&amp;', '&', $redir_params), $connection));
			} else {
				$this->redirect($this->url->link('common/home'));
			}
    	}		
		
		$this->language->load('module/language');
		
		$this->data['text_language'] = $this->language->get('text_language');
		
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$connection = 'SSL';
		} else {
			$connection = 'NONSSL';
		}
			
		$this->data['action'] = $this->url->link('module/language', '', $connection);

		$this->data['language_code'] = $this->session->data['language'];
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = array();
		
		$results = $this->model_localisation_language->getLanguages();
		
		foreach ($results as $result) {
			if ($result['status']) {
				$this->data['languages'][] = array(
					'name'  => $result['name'],
					'code'  => $result['code'],
					'image' => $result['image']
				);	
			}
		}

		if (!isset($this->request->get['route'])) {
			//$this->data['redirect'] = $this->url->link('common/home');
			$this->data['redirect'] = 'common/home';
		} else {
			$data = $this->request->get;
			
			//unset($data['_route_']);
			unset($data['site_language']);
			$route = $data['route'];
			
			unset($data['route']);
			
			$url = '';
			
			if ($data) {
				$url = '&' . urldecode(http_build_query($data, '', '&'));
			}	
					
			//$this->data['redirect'] = $this->url->link($route, $url, $connection);
			$this->data['redirect'] = $route . $url;
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/language.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/language.tpl';
		} else {
			$this->template = 'default/template/module/language.tpl';
		}
		
		$this->render();
	}
}
?>