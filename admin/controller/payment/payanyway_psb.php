<?php
class ControllerPaymentPayanywayPsb extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('payment/payanyway_psb');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		$this->load->model('localisation/currency');
		$this->data['currencies'] = array();
		$results = $this->model_localisation_currency->getCurrencies();	
		foreach ($results as $result) {
			if ($result['status']) {
   				$this->data['currencies'][] = array(
					'title'        => $result['title'],
					'code'         => $result['code']
				);
			}
		}

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('payanyway', $this->request->post['payanyway']);
			$this->model_setting_setting->editSetting('payanyway_psb', $this->request->post['payanyway_psb']);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_all_zones'] = $this->language->get('text_all_zones');

		$this->data['entry_order_status'] = $this->language->get('entry_order_status');
		$this->data['entry_payed_order_status'] = $this->language->get('entry_payed_order_status');

		$this->data['entry_mnt_server'] = $this->language->get('entry_mnt_server');
		$this->data['entry_order_status'] = $this->language->get('entry_order_status');
		$this->data['entry_mnt_id'] = $this->language->get('entry_mnt_id');
		$this->data['entry_mnt_dataintegrity_code'] = $this->language->get('entry_mnt_dataintegrity_code');
		$this->data['entry_mnt_currency_code'] = $this->language->get('entry_mnt_currency_code');
		$this->data['entry_mnt_test_mode'] = $this->language->get('entry_mnt_test_mode');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

		$this->data['tab_general'] = $this->language->get('tab_general');

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
       		'text'      => $this->language->get('text_payment'),
			'href'      => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('payment/payanyway_psb', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

		$this->data['action'] = $this->url->link('payment/payanyway_psb', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['payanyway_mnt_server'])) {
			$this->data['payanyway_mnt_server'] = $this->request->post['payanyway_mnt_server'];
		} else {
			$this->data['payanyway_mnt_server'] = $this->config->get('payanyway_mnt_server');
		}

		if (isset($this->request->post['payanyway_mnt_id'])) {
			$this->data['payanyway_mnt_id'] = $this->request->post['payanyway_mnt_id'];
		} else {
			$this->data['payanyway_mnt_id'] = $this->config->get('payanyway_mnt_id');
		}

		if (isset($this->request->post['payanyway_order_status_id'])) {
			$this->data['payanyway_order_status_id'] = $this->request->post['payanyway_order_status_id'];
		} else {
			$this->data['payanyway_order_status_id'] = $this->config->get('payanyway_order_status_id');
		}

		if (isset($this->request->post['payanyway_payed_order_status_id'])) {
			$this->data['payanyway_payed_order_status_id'] = $this->request->post['payanyway_payed_order_status_id'];
		} else {
			$this->data['payanyway_payed_order_status_id'] = $this->config->get('payanyway_payed_order_status_id');
		}

		$this->load->model('localisation/order_status');

		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		if (isset($this->request->post['payanyway_mnt_dataintegrity_code'])) {
			$this->data['payanyway_mnt_dataintegrity_code'] = $this->request->post['payanyway_mnt_dataintegrity_code'];
		} else {
			$this->data['payanyway_mnt_dataintegrity_code'] = $this->config->get('payanyway_mnt_dataintegrity_code');
		}

		if (isset($this->request->post['payanyway_mnt_currency_code'])) {
			$this->data['payanyway_mnt_currency_code'] = $this->request->post['payanyway_mnt_currency_code'];
		} else {
			$this->data['payanyway_mnt_currency_code'] = $this->config->get('payanyway_mnt_currency_code');
		}

		if (isset($this->request->post['payanyway_psb_mnt_test_mode'])) {
			$this->data['payanyway_mnt_test_mode'] = $this->request->post['payanyway_mnt_test_mode'];
		} else {
			$this->data['payanyway_mnt_test_mode'] = $this->config->get('payanyway_mnt_test_mode');
		}

		if (isset($this->request->post['payanyway_psb_status'])) {
			$this->data['payanyway_psb_status'] = $this->request->post['payanyway_psb_status'];
		} else {
			$this->data['payanyway_psb_status'] = $this->config->get('payanyway_psb_status');
		}

		if (isset($this->request->post['payanyway_psb_sort_order'])) {
			$this->data['payanyway_psb_sort_order'] = $this->request->post['payanyway_psb_sort_order'];
		} else {
			$this->data['payanyway_psb_sort_order'] = $this->config->get('payanyway_psb_sort_order');
		}

		$this->template = 'payment/payanyway_psb.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);

		$this->response->setOutput($this->render());
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'payment/payanyway_psb')) {
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