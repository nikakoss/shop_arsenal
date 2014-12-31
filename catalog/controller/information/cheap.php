<?php 
class ControllerInformationCheap extends Controller {
	private $error = array(); 
	    
  	public function index() {
		$this->language->load('information/cheap');

    	$this->document->setTitle($this->language->get('heading_title')); 
		$this->document->setTitle($this->language->get('heading_title2')); 
	 
    	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->hostname = $this->config->get('config_smtp_host');
			$mail->username = $this->config->get('config_smtp_username');
			$mail->password = $this->config->get('config_smtp_password');
			$mail->port = $this->config->get('config_smtp_port');
			$mail->timeout = $this->config->get('config_smtp_timeout');				
			$mail->setTo($this->config->get('config_email'));
	  		$mail->setFrom($this->request->post['email']);
	  		$mail->setSender($this->request->post['name2']);
	  		$mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
	  		$mail->setText(strip_tags(html_entity_decode('Сообщение: '.$this->request->post['enquiry'] .'

Модель: '. $this->request->post['name'] .'
E@mail: '. $this->request->post['email'] .'
Имя нашедшего: '. $this->request->post['name2'] .'
Телефон: '. $this->request->post['name3'] .'
Ссылка: '. $this->request->post['name4'], ENT_QUOTES, 'UTF-8')));
      		$mail->send();

	  		$this->redirect($this->url->link('information/cheap/cheap'));
    	}
			
    	$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['heading_title2'] = $this->language->get('heading_title2');
    	$this->data['text_close'] = $this->language->get('text_close');

    	$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_name2'] = $this->language->get('entry_name2');
		$this->data['entry_name3'] = $this->language->get('entry_name3');
		$this->data['entry_name4'] = $this->language->get('entry_name4');
    	$this->data['entry_email'] = $this->language->get('entry_email');
    	$this->data['entry_enquiry'] = $this->language->get('entry_enquiry');
		$this->data['entry_captcha'] = $this->language->get('entry_captcha');

		if (isset($this->error['name'])) {
    		$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = '';
		}
		
		if (isset($this->error['name2'])) {
    		$this->data['error_name2'] = $this->error['name2'];
		} else {
			$this->data['error_name2'] = '';
		}
		
		if (isset($this->error['name3'])) {
    		$this->data['error_name3'] = $this->error['name3'];
		} else {
			$this->data['error_name3'] = '';
		}
		
		if (isset($this->error['name4'])) {
    		$this->data['error_name4'] = $this->error['name4'];
		} else {
			$this->data['error_name4'] = '';
		}
		
		if (isset($this->error['email'])) {
			$this->data['error_email'] = $this->error['email'];
		} else {
			$this->data['error_email'] = '';
		}		
		
		if (isset($this->error['enquiry'])) {
			$this->data['error_enquiry'] = $this->error['enquiry'];
		} else {
			$this->data['error_enquiry'] = '';
		}		
		
 		if (isset($this->error['captcha'])) {
			$this->data['error_captcha'] = $this->error['captcha'];
		} else {
			$this->data['error_captcha'] = '';
		}	

    	$this->data['button_continue'] = $this->language->get('button_continue');
    
		$this->data['action'] = $this->url->link('information/cheap');
		$this->data['store'] = $this->config->get('config_name');
    	$this->data['address'] = nl2br($this->config->get('config_address'));
    	$this->data['telephone'] = $this->config->get('config_telephone');
    	$this->data['fax'] = $this->config->get('config_fax');
    	
		if (isset($this->request->post['name'])) {
			$this->data['name'] = $this->request->post['name'];
		} else {
			$this->data['name'] = '';
		}
		
		if (isset($this->request->post['name2'])) {
			$this->data['name2'] = $this->request->post['name2'];
		} else {
			$this->data['name2'] = $this->customer->getFirstName();
		}
		
		if (isset($this->request->post['name3'])) {
			$this->data['name3'] = $this->request->post['name3'];
		} else {
			$this->data['name3'] = '';
		}
		
		if (isset($this->request->post['name4'])) {
			$this->data['name4'] = $this->request->post['name4'];
		} else {
			$this->data['name4'] = '';
		}

		if (isset($this->request->post['email'])) {
			$this->data['email'] = $this->request->post['email'];
		} else {
			$this->data['email'] = $this->customer->getEmail();
		}
		
		if (isset($this->request->post['enquiry'])) {
			$this->data['enquiry'] = $this->request->post['enquiry'];
		} else {
			$this->data['enquiry'] = '';
		}
		
		if (isset($this->request->post['captcha'])) {
			$this->data['captcha'] = $this->request->post['captcha'];
		} else {
			$this->data['captcha'] = '';
		}		

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/cheap.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/information/cheap.tpl';
		} else {
			$this->template = 'default/template/information/cheap.tpl';
		}
				
 		$this->response->setOutput($this->render());		
  	}

  	public function cheap() {
		$this->language->load('information/cheap');

		$this->document->setTitle($this->language->get('heading_title')); 
		
		$this->document->setTitle($this->language->get('heading_title2'));
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['heading_title'] = $this->language->get('heading_title2');

    	$this->data['text_message'] = $this->language->get('text_message');

    	$this->data['button_continue'] = $this->language->get('button_continue');

    	$this->data['continue'] = $this->url->link('common/home');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/cheap.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/cheap.tpl';
		} else {
			$this->template = 'default/template/common/cheap.tpl';
		}
				
 		$this->response->setOutput($this->render()); 
	}
	
  	private function validate() {
    	if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 100)) {
      		$this->error['name'] = $this->language->get('error_name');
    	}
		
		 if ((utf8_strlen($this->request->post['name2']) < 3) || (utf8_strlen($this->request->post['name2']) > 32)) {
      		$this->error['name2'] = $this->language->get('error_name2');
    	}
		
		 if ((utf8_strlen($this->request->post['name3']) < 10) || (utf8_strlen($this->request->post['name3']) > 15)) {
      		$this->error['name3'] = $this->language->get('error_name3');
    	}
		
		 if ((utf8_strlen($this->request->post['name4']) < 10) || (utf8_strlen($this->request->post['name4']) > 200)) {
      		$this->error['name4'] = $this->language->get('error_name4');
    	}

    	if (!preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
      		$this->error['email'] = $this->language->get('error_email');
    	}

    	if ((utf8_strlen($this->request->post['enquiry']) < 5) || (utf8_strlen($this->request->post['enquiry']) > 500)) {
      		$this->error['enquiry'] = $this->language->get('error_enquiry');
    	}

    	if (empty($this->session->data['captcha']) || ($this->session->data['captcha'] != $this->request->post['captcha'])) {
      		$this->error['captcha'] = $this->language->get('error_captcha');
    	}
		
		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}  	  
  	}

	public function captcha() {
		$this->load->library('captcha');
		
		$captcha = new Captcha();
		
		$this->session->data['captcha'] = $captcha->getCode();
		
		$captcha->showImage();
	}	
}
?>
