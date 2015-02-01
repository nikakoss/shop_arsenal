<?php   // orest831@gmail.com
class ControllerSaleSubscription extends Controller {
	private $error = array();
     
  	public function index() {
		$this->language->load('sale/subscription');
		$this->load->model('sale/subscription');
		$this->document->setTitle($this->language->get('heading_title'));	
		
		//start breadcrumbs
		$url = '';
			
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('sale/subscription', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
		//end breadcrumbs
		
		//start error log
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
		//end error log
		
		if (isset($this->request->post['sub_id'])) {
			$id = $this->request->post['sub_id'];
			$val_button = $this->request->post['val_sub'];
			$this->model_sale_subscription->changeSubscription($id, $val_button);

		}
		
		//start language words
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['column_code'] = $this->language->get('column_code');
		$this->data['column_from'] = $this->language->get('column_from');
		$this->data['column_to'] = $this->language->get('column_to');
		$this->data['column_theme'] = $this->language->get('column_theme');
		$this->data['column_amount'] = $this->language->get('column_amount');
		$this->data['column_status'] = $this->language->get('column_status');
		$this->data['column_date_added'] = $this->language->get('column_date_added');
		$this->data['column_action'] = $this->language->get('column_action');	
		
		$this->data['text_no_results'] = $this->language->get('text_no_results');
		//end language words
		
		$results = $this->model_sale_subscription->getSubscription();
		$this->data['subscription'] =$results;
		$this->data['action']  = $this->url->link('sale/subscription',  '&token=' . $this->session->data['token'], 'SSL');
		
		//print_r($this->data['action']);
		
		$this->template = 'sale/subscription.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
  	}
}
?>