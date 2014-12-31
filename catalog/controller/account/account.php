<?php
class ControllerAccountAccount extends Controller {

    public function index() {
        if (isset($this->request->post['email']) && isset($this->request->post['y_organization_name'])) {
            $this->load->model('account/customer');
            if ($this->model_account_customer->editCustomer($this->request->post)) {
                $this->session->data['redirect'] = $this->url->link('account/account', '', 'SSL');
            }

            //$this->redirect($this->url->link('account/account', '', 'SSL'));
        }
        if (isset($this->request->post['email']) && isset($this->request->post['firstname']) && isset($this->request->post['lastname'])) {
            $this->load->model('account/customer');
            if ($this->model_account_customer->editCustomer($this->request->post)) {
                $this->session->data['redirect'] = $this->url->link('account/account', '', 'SSL');
            }
        }
        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('account/account', '', 'SSL');

            $this->redirect($this->url->link('common/home', '', 'SSL'));
        }

        $this->document->addScript('catalog/view/javascript/MyAcounnt.js');

        $this->language->load('account/account');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_account'),
            'href' => $this->url->link('account/account', '', 'SSL'),
            'separator' => $this->language->get('text_separator')
        );

        if (isset($this->session->data['success'])) {
            $this->data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $this->data['success'] = '';
        }

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_my_account'] = $this->language->get('text_my_account');
        $this->data['text_my_orders'] = $this->language->get('text_my_orders');
        $this->data['text_my_newsletter'] = $this->language->get('text_my_newsletter');
        $this->data['text_edit'] = $this->language->get('text_edit');
        $this->data['text_password'] = $this->language->get('text_password');
        $this->data['text_address'] = $this->language->get('text_address');
        $this->data['text_wishlist'] = $this->language->get('text_wishlist');
        $this->data['text_order'] = $this->language->get('text_order');
        $this->data['text_download'] = $this->language->get('text_download');
        $this->data['text_reward'] = $this->language->get('text_reward');
        $this->data['text_return'] = $this->language->get('text_return');
        $this->data['text_transaction'] = $this->language->get('text_transaction');
        $this->data['text_newsletter'] = $this->language->get('text_newsletter');
        $this->data['text_recurring'] = $this->language->get('text_recurring');
        $this->data['edit'] = $this->url->link('account/edit', '', 'SSL');
        $this->data['password'] = $this->url->link('account/password', '', 'SSL');
        $this->data['address'] = $this->url->link('account/address', '', 'SSL');
        $this->data['wishlist'] = $this->url->link('account/wishlist');
        $this->data['order'] = $this->url->link('account/order', '', 'SSL');
        $this->data['download'] = $this->url->link('account/download', '', 'SSL');
        $this->data['return'] = $this->url->link('account/return', '', 'SSL');
        $this->data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
        $this->data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');
        $this->data['recurring'] = $this->url->link('account/recurring', '', 'SSL');

        //addresses list
        $this->data['addresses'] = array();
        $this->load->model('account/address');
        $results = $this->model_account_address->getAddresses();
        foreach ($results as $result) {
            if ($result['address_format']) {
                $format = $result['address_format'];
            } else {
                $format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
            }

            $find = array(
                '{firstname}',
                '{lastname}',
                '{company}',
                '{address_1}',
                '{address_2}',
                '{city}',
                '{postcode}',
                '{zone}',
                '{zone_code}',
                '{country}'
            );

            $replace = array(
                'firstname' => $result['firstname'],
                'lastname' => $result['lastname'],
                'company' => $result['company'],
                'address_1' => $result['address_1'],
                'address_2' => $result['address_2'],
                'city' => $result['city'],
                'postcode' => $result['postcode'],
                'zone' => $result['zone'],
                'zone_code' => $result['zone_code'],
                'country' => $result['country']
            );

            $this->data['addresses'][] = array(
                'address_id' => $result['address_id'],
                'address' => str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format)))),
                'update' => $this->url->link('account/address/update', 'address_id=' . $result['address_id'], 'SSL'),
                'delete' => $this->url->link('account/address/delete', 'address_id=' . $result['address_id'], 'SSL')
            );
        }
        $this->data['insert'] = $this->url->link('account/address/insert', '', 'SSL');
        // orders  list
        $this->load->model('account/order');
        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }
        $this->data['orders'] = array();
        $order_total = $this->model_account_order->getTotalOrders();
        $results = $this->model_account_order->getOrders(($page - 1) * 10, 10);


        foreach ($results as $result) {
            $product_total = $this->model_account_order->getTotalOrderProductsByOrderId($result['order_id']);
            $voucher_total = $this->model_account_order->getTotalOrderVouchersByOrderId($result['order_id']);

            $this->data['orders'][] = array(
                'order_id' => $result['order_id'],
                'name' => $result['firstname'] . ' ' . $result['lastname'],
                'status' => $result['status'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                'products' => ($product_total + $voucher_total),
                'total' => $this->currency->format($result['total'], $result['currency_code'], $result['currency_value']),
                'href' => $this->url->link('account/order/info', 'order_id=' . $result['order_id'], 'SSL'),
                'reorder' => $this->url->link('account/order', 'order_id=' . $result['order_id'], 'SSL')
            );
        }

        // 
        // AMOUnT info
        $this->data['total_amout'] = $this->currency->format($this->customer->getBalance());
        // acount info

        require_once(DIR_SYSTEM . 'library/simple/simple.php');
        $this->load->model('account/customer');
        $this->simple = new Simple($this->registry);
        $this->data['simple_account_view_customer_type'] = $this->config->get('simple_account_view_customer_type');

        $this->data['simple_type_of_selection_of_group'] = $this->config->get('simple_type_of_selection_of_group');
        $this->data['simple_type_of_selection_of_group'] = !empty($this->data['simple_type_of_selection_of_group']) ? $this->data['simple_type_of_selection_of_group'] : 'select';

        $this->data['customer_groups'] = $this->simple->get_customer_groups();
        $this->data['customer_group_id'] = $this->customer->getCustomerGroupId();

        if ($this->data['simple_account_view_customer_type'] && isset($this->request->post['customer_group_id']) && array_key_exists($this->request->post['customer_group_id'], $this->data['customer_groups'])) {
            $this->data['customer_group_id'] = $this->request->post['customer_group_id'];
        }

        $this->data['simple_edit_account'] = !empty($this->request->post['simple_edit_account']);
        $data['simple'] = array();
        $customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
       
        //loginza provider
        $this->data['loginza2_provider']=$customer_info['loginza2_provider'];
        //default address id
        $this->data['default_address']=$this->customer->getAddressId();
        
        $custom_data = $this->simple->load_custom_data(Simple::OBJECT_TYPE_CUSTOMER, $this->customer->getId());
        $data['simple'] = $this->simple->load_fields(Simple::SET_ACCOUNT_INFO, array('group' => $this->data['customer_group_id']), !$this->data['simple_edit_account'], $customer_info, $custom_data);
        $this->data['simple'] = $data['simple'];
		$this->data['simple']['customer_group'] = $customer_info['customer_group_id'];
        $this->data['simple']['y_organization_name'] = array('label' => 'Название организации', 'value' => $customer_info['y_organization_name']);
        $this->data['simple']['y_inn'] = array('label' => 'ИНН', 'value' => $customer_info['y_inn']);
        $this->data['simple']['y_kpp'] = array('label' => 'КПП', 'value' => $customer_info['y_kpp']);
        $this->data['simple']['y_cal_account'] = array('label' => 'Расчетный счет', 'value' => $customer_info['y_cal_account']);
        $this->data['simple']['y_bank_details'] = array('label' => 'Банковские реквизиты', 'value' => $customer_info['y_bank_details']);
        $this->data['simple']['y_y_address'] = array('label' => 'Юридический адрес', 'value' => $customer_info['y_y_address']);
        $this->data['simple']['y_f_address'] = array('label' => 'Фактический адрес', 'value' => $customer_info['y_f_address']);
        $this->data['simple']['y_contact_person'] = array('label' => 'Контактное лицо', 'value' => $customer_info['y_contact_person']);
        ////////////////////////////////////////////////////////////////
        if ($this->config->get('reward_status')) {
            $this->data['reward'] = $this->url->link('account/reward', '', 'SSL');
        } else {
            $this->data['reward'] = '';
        }
		$this->load->model('checkout/coupon');
        
        $customer_info = $this->model_checkout_coupon->getStatusAcount();


        $this->data['StatusAcount'] = $customer_info['name'];
        $this->data['UrlAcount'] = $customer_info['url'];

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/account.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/account/account.tpl';
        } else {
            $this->template = 'default/template/account/account.tpl';
        }

        $this->children = array(
            'common/column_left',
            'common/column_right',
            'common/content_top',
            'common/content_bottom',
            'common/footer',
            'common/header'
        );
        

        $this->response->setOutput($this->render());
    }
    /*------------promocode-----------------------------------*/
    public function checkPromoCode (){
        if (isset($this->request->post['userPromoCode'])) {
             $this->load->model('account/customer');
             $cheked = $this->model_account_customer->checkPromoCode($this->request->post['userPromoCode']);
        }
    }

}

?>