<?php

class ControllerModuleOneClick extends Controller {

    public function order() {

        $this->load->model('setting/extension');
        $this->load->model('catalog/product');

        if (isset($this->request->post['quantity'])) {
            $quantity = $this->request->post['quantity'];
        } else {
            $quantity = 1;
        }

        if (isset($this->request->post['option'])) {
            $options = array_filter($this->request->post['option']);
        } else {
            $options = array();
        }
		
		$name_product = $this->request->post['name_product'];
		
        $option_price = 0;
        $option_points = 0;
        $option_weight = 0;

        $option_data = array();
        $product_id = (int) $this->request->post['product_id'];
        if ($this->customer->isLogged()) {
            $customer_group_id = $this->customer->getCustomerGroupId();
        } else {
            $customer_group_id = $this->config->get('config_customer_group_id');
        }

        foreach ($options as $product_option_id => $option_value) {
            $option_query = $this->db->query("SELECT po.product_option_id, po.option_id, od.name, o.type FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_option_id = '" . (int) $product_option_id . "' AND po.product_id = '" . $product_id . "' AND od.language_id = '" . (int) $this->config->get('config_language_id') . "'");

            if ($option_query->num_rows) {
                if ($option_query->row['type'] == 'select' || $option_query->row['type'] == 'radio' || $option_query->row['type'] == 'image') {
                    $option_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int) $option_value . "' AND pov.product_option_id = '" . (int) $product_option_id . "' AND ovd.language_id = '" . (int) $this->config->get('config_language_id') . "'");

                    if ($option_value_query->num_rows) {
                        if ($option_value_query->row['price_prefix'] == '+') {
                            $option_price += $option_value_query->row['price'];
                        } elseif ($option_value_query->row['price_prefix'] == '-') {
                            $option_price -= $option_value_query->row['price'];
                        }

                        if ($option_value_query->row['points_prefix'] == '+') {
                            $option_points += $option_value_query->row['points'];
                        } elseif ($option_value_query->row['points_prefix'] == '-') {
                            $option_points -= $option_value_query->row['points'];
                        }

                        if ($option_value_query->row['weight_prefix'] == '+') {
                            $option_weight += $option_value_query->row['weight'];
                        } elseif ($option_value_query->row['weight_prefix'] == '-') {
                            $option_weight -= $option_value_query->row['weight'];
                        }

                        if ($option_value_query->row['subtract'] && (!$option_value_query->row['quantity'] || ($option_value_query->row['quantity'] < $quantity))) {
                            $stock = false;
                        }

                        $option_data[] = array(
                            'product_option_id' => $product_option_id,
                            'product_option_value_id' => $option_value,
                            'option_id' => $option_query->row['option_id'],
                            'option_value_id' => $option_value_query->row['option_value_id'],
                            'name' => $option_query->row['name'],
                            'option_value' => $option_value_query->row['name'],
                            'type' => $option_query->row['type'],
                            'quantity' => $option_value_query->row['quantity'],
                            'subtract' => $option_value_query->row['subtract'],
                            'price' => $option_value_query->row['price'],
                            'price_prefix' => $option_value_query->row['price_prefix'],
                            'points' => $option_value_query->row['points'],
                            'points_prefix' => $option_value_query->row['points_prefix'],
                            'weight' => $option_value_query->row['weight'],
                            'weight_prefix' => $option_value_query->row['weight_prefix']
                        );
                    }
                } elseif ($option_query->row['type'] == 'checkbox' && is_array($option_value)) {
                    foreach ($option_value as $product_option_value_id) {
                        $option_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int) $product_option_value_id . "' AND pov.product_option_id = '" . (int) $product_option_id . "' AND ovd.language_id = '" . (int) $this->config->get('config_language_id') . "'");

                        if ($option_value_query->num_rows) {
                            if ($option_value_query->row['price_prefix'] == '+') {
                                $option_price += $option_value_query->row['price'];
                            } elseif ($option_value_query->row['price_prefix'] == '-') {
                                $option_price -= $option_value_query->row['price'];
                            }

                            if ($option_value_query->row['points_prefix'] == '+') {
                                $option_points += $option_value_query->row['points'];
                            } elseif ($option_value_query->row['points_prefix'] == '-') {
                                $option_points -= $option_value_query->row['points'];
                            }

                            if ($option_value_query->row['weight_prefix'] == '+') {
                                $option_weight += $option_value_query->row['weight'];
                            } elseif ($option_value_query->row['weight_prefix'] == '-') {
                                $option_weight -= $option_value_query->row['weight'];
                            }

                            if ($option_value_query->row['subtract'] && (!$option_value_query->row['quantity'] || ($option_value_query->row['quantity'] < $quantity))) {
                                $stock = false;
                            }

                            $option_data[] = array(
                                'product_option_id' => $product_option_id,
                                'product_option_value_id' => $product_option_value_id,
                                'option_id' => $option_query->row['option_id'],
                                'option_value_id' => $option_value_query->row['option_value_id'],
                                'name' => $option_query->row['name'],
                                'option_value' => $option_value_query->row['name'],
                                'type' => $option_query->row['type'],
                                'quantity' => $option_value_query->row['quantity'],
                                'subtract' => $option_value_query->row['subtract'],
                                'price' => $option_value_query->row['price'],
                                'price_prefix' => $option_value_query->row['price_prefix'],
                                'points' => $option_value_query->row['points'],
                                'points_prefix' => $option_value_query->row['points_prefix'],
                                'weight' => $option_value_query->row['weight'],
                                'weight_prefix' => $option_value_query->row['weight_prefix']
                            );
                        }
                    }
                } elseif ($option_query->row['type'] == 'text' || $option_query->row['type'] == 'textarea' || $option_query->row['type'] == 'file' || $option_query->row['type'] == 'date' || $option_query->row['type'] == 'datetime' || $option_query->row['type'] == 'time') {
                    $option_data[] = array(
                        'product_option_id' => $product_option_id,
                        'product_option_value_id' => '',
                        'option_id' => $option_query->row['option_id'],
                        'option_value_id' => '',
                        'name' => $option_query->row['name'],
                        'option_value' => $option_value,
                        'type' => $option_query->row['type'],
                        'quantity' => '',
                        'subtract' => '',
                        'price' => '',
                        'price_prefix' => '',
                        'points' => '',
                        'points_prefix' => '',
                        'weight' => '',
                        'weight_prefix' => ''
                    );
                }
            }
        }
        $options = array();
        foreach ($option_data as $option) {
            if ($option['type'] != 'file') {
                $options[] = array(
                    'product_option_id' => $option['product_option_id'],
                    'product_option_value_id' => $option['product_option_value_id'],
                    'product_option_id' => $option['product_option_id'],
                    'product_option_value_id' => $option['product_option_value_id'],
                    'option_id' => $option['option_id'],
                    'option_value_id' => $option['option_value_id'],
                    'name' => $option['name'],
                    'value' => $option['option_value'],
                    'type' => $option['type']
                );
            } else {
                $encryption = new Encryption($this->config->get('config_encryption'));

                $options[] = array(
                    'product_option_id' => $option['product_option_id'],
                    'product_option_value_id' => $option['product_option_value_id'],
                    'product_option_id' => $option['product_option_id'],
                    'product_option_value_id' => $option['product_option_value_id'],
                    'option_id' => $option['option_id'],
                    'option_value_id' => $option['option_value_id'],
                    'name' => $option['name'],
                    'value' => $encryption->decrypt($option['option_value']),
                    'type' => $option['type']
                );
            }
        }

        $oneclick_settings = $this->config->get('oneclick_settings');

        $product = $this->model_catalog_product->getProduct($product_id);

        $discount_quantity = 1;

        $product_discount_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . $product_id . "' AND customer_group_id = '" . (int) $customer_group_id . "' AND quantity <= '" . (int) $discount_quantity . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY quantity DESC, priority ASC, price ASC LIMIT 1");


        $price = $product['price'];

        if ($product_discount_query->num_rows) {
            $price = $product_discount_query->row['price'];
        }

        // Product Specials
        $product_special_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_special WHERE product_id = '" . $product_id . "' AND customer_group_id = '" . (int) $customer_group_id . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY priority ASC, price ASC LIMIT 1");

        if ($product_special_query->num_rows) {
            $price = $product_special_query->row['price'];
        }

        $data = array();

        $data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
        $data['store_id'] = $this->config->get('config_store_id');
        $data['store_name'] = $this->config->get('config_name');

        if ($data['store_id']) {
            $data['store_url'] = $this->config->get('config_url');
        } else {
            $data['store_url'] = HTTP_SERVER;
        }
        $data['customer_id'] = 0;
        $data['customer_group_id'] = $this->config->get('config_customer_group_id');

        if ($this->customer->isLogged()) {
            $data['customer_id'] = $this->customer->getId();
            $data['customer_group_id'] = $this->customer->getCustomerGroupId();
        }

        $firstname = sprintf($this->language->get('text_one_click_firstname'), $this->request->post['phone']);
        $data['firstname'] = $firstname;
        $data['lastname'] = '';
        $data['email'] = 'null@nu.ll';
        $data['telephone'] = $this->request->post['phone'];
        $data['fax'] = "";

        $data['payment_firstname'] = $firstname;
        $data['payment_lastname'] = '';
        $data['payment_address_1'] = '';
        $data['shipping_address_1'] = '';

        $data['payment_company'] = "";
        $data['shipping_company'] = "";
        $data['payment_address_2'] = "";
        $data['payment_city'] = "";
        $data['payment_postcode'] = "";
        $data['payment_zone'] = "";
        $data['payment_zone_id'] = "";
        $data['payment_country'] = "";
        $data['payment_country_id'] = "";
        $data['payment_address_format'] = "";

        $data['shipping_firstname'] = $firstname;
        $data['shipping_lastname'] = '';
        $data['shipping_address_2'] = "";
        $data['shipping_city'] = "";
        $data['shipping_postcode'] = "";
        $data['shipping_zone'] = "";
        $data['shipping_zone_id'] = "";
        $data['shipping_country'] = "";
        $data['shipping_country_id'] = "";
        $data['shipping_method'] = '';
        $data['payment_company_id'] = "";
        $data['payment_tax_id'] = "";
        $data['payment_code in'] = "";
        $data['shipping_code'] = "";
        if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
            $data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];
        } elseif (!empty($this->request->server['HTTP_CLIENT_IP'])) {
            $data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];
        } else {
            $data['forwarded_ip'] = '';
        }

        if (isset($this->request->server['HTTP_USER_AGENT'])) {
            $data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];
        } else {
            $data['user_agent'] = '';
        }

        if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
            $data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];
        } else {
            $data['accept_language'] = '';
        }

        $data['vouchers'] = array();
        $data['payment_code'] = "";
        $data['payment_method'] = '';
        $data['shipping_address_format'] = '{telephone}';

		$prc = $this->request->post['price_product'];
        $total = $price * 1;

        $product_data[] = array(
            'product_id' => $product['product_id'],
            'name' => $name_product,
            'model' => $product['model'],
            'option' => $options,
            'download' => array(),
            'quantity' => $quantity,
            'subtract' => 1,
            'reward' => 0,
            'price' => $prc,
            'total' => $total,
            'tax' => $this->tax->getTax($product['price'], $product['tax_class_id']),
            'href' => $this->url->link('product/product', 'product_id=' . $product['product_id']),
        );

        ////////totals data
        $total_data = array();

        $this->load->language('total/sub_total');
        $total_data[] = array(
            'code' => 'sub_total',
            'title' => $this->language->get('text_sub_total'),
            'text' => $this->currency->format($total),
            'value' => $product['price'],
            'sort_order' => $this->config->get('sub_total_sort_order')
        );

        $this->language->load('checkout/checkout');

        $data['products'] = $product_data;
        $data['totals'] = $total_data;
        $data['comment'] = '';
        $data['total'] = $total;
        $data['reward'] = 0;

        if (isset($this->request->cookie['tracking'])) {
            $this->load->model('affiliate/affiliate');

            $affiliate_info = $this->model_affiliate_affiliate->getAffiliateByCode($this->request->cookie['tracking']);

            if ($affiliate_info) {
                $data['affiliate_id'] = $affiliate_info['affiliate_id'];
                $data['commission'] = ($total / 100) * $affiliate_info['commission'];
            } else {
                $data['affiliate_id'] = 0;
                $data['commission'] = 0;
            }
        } else {
            $data['affiliate_id'] = 0;
            $data['commission'] = 0;
        }

        $data['language_id'] = $this->config->get('config_language_id');
        $data['currency_id'] = $this->currency->getId();
        $data['currency_code'] = $this->currency->getCode();
        $data['currency_value'] = $this->currency->getValue($this->currency->getCode());
        $data['ip'] = $this->request->server['REMOTE_ADDR'];

        $this->load->model('checkout/order');

        $order_id = $this->model_checkout_order->addOrder($data);
        $this->model_checkout_order->confirm($order_id, $oneclick_settings['order_status_id']);
		
		//////////////////////////////////////////////
		
		
		$order_product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");
		
		$order_voucher_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_voucher WHERE order_id = '" . (int)$order_id . "'");
		
		$order_total_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_total` WHERE order_id = '" . (int)$order_id . "' ORDER BY sort_order ASC");
		
		$order_info = $this->getOrder($order_id);
		
		$order_status_id = $this->config->get('config_order_status_id');
		
		$order_status_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_status WHERE order_status_id = '" . (int)$order_status_id . "' AND language_id = '" . (int)$order_info['language_id'] . "'");
			
			if ($order_status_query->num_rows) {
				$order_status = $order_status_query->row['name'];	
			} else {
				$order_status = '';
			}
		
		$language = new Language($order_info['language_directory']);
		$language->load($order_info['language_filename']);
		$language->load('mail/order');
		
		$template = new Template();
			
			$template->data['title'] = sprintf($language->get('text_new_subject'), html_entity_decode($order_info['store_name'], ENT_QUOTES, 'UTF-8'), $order_id);
			
			$template->data['text_greeting'] = sprintf($language->get('text_new_greeting'), html_entity_decode($order_info['store_name'], ENT_QUOTES, 'UTF-8'));
			$template->data['text_link'] = $language->get('text_new_link');
			$template->data['text_download'] = $language->get('text_new_download');
			$template->data['text_order_detail'] = $language->get('text_new_order_detail');
			$template->data['text_instruction'] = $language->get('text_new_instruction');
			$template->data['text_order_id'] = $language->get('text_new_order_id');
			$template->data['text_date_added'] = $language->get('text_new_date_added');
			$template->data['text_payment_method'] = $language->get('text_new_payment_method');	
			$template->data['text_shipping_method'] = $language->get('text_new_shipping_method');
			$template->data['text_email'] = $language->get('text_new_email');
			$template->data['text_telephone'] = $language->get('text_new_telephone');
			$template->data['text_ip'] = $language->get('text_new_ip');
			$template->data['text_payment_address'] = $language->get('text_new_payment_address');
			$template->data['text_shipping_address'] = $language->get('text_new_shipping_address');
			$template->data['text_product'] = $language->get('text_new_product');
			$template->data['text_model'] = $language->get('text_new_model');
			$template->data['text_quantity'] = $language->get('text_new_quantity');
			$template->data['text_price'] = $language->get('text_new_price');
			$template->data['text_total'] = $language->get('text_new_total');
			$template->data['text_footer'] = $language->get('text_new_footer');
			$template->data['text_powered'] = $language->get('text_new_powered');
			
			$template->data['logo'] = $this->config->get('config_url') . 'image/' . $this->config->get('config_logo');		
			$template->data['store_name'] = $order_info['store_name'];
			$template->data['store_url'] = $order_info['store_url'];
			$template->data['customer_id'] = $order_info['customer_id'];
			$template->data['link'] = $order_info['store_url'] . 'index.php?route=account/order/info&order_id=' . $order_id;
			

				$template->data['download'] = '';

			
			$template->data['order_id'] = $order_id;
			$template->data['date_added'] = date($language->get('date_format_short'), strtotime($order_info['date_added']));    	
			$template->data['payment_method'] = $order_info['payment_method'];
			$template->data['shipping_method'] = $order_info['shipping_method'];
			$template->data['email'] = $order_info['email'];
			$template->data['telephone'] = $order_info['telephone'];
			$template->data['ip'] = $order_info['ip'];
			

				$template->data['comment'] = '';

						
			if ($order_info['payment_address_format']) {
				$format = $order_info['payment_address_format'];
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
				'firstname' => $order_info['payment_firstname'],
				'lastname'  => $order_info['payment_lastname'],
				'company'   => $order_info['payment_company'],
				'address_1' => $order_info['payment_address_1'],
				'address_2' => $order_info['payment_address_2'],
				'city'      => $order_info['payment_city'],
				'postcode'  => $order_info['payment_postcode'],
				'zone'      => $order_info['payment_zone'],
				'zone_code' => $order_info['payment_zone_code'],
				'country'   => $order_info['payment_country']  
			);
		
			$template->data['payment_address'] = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));						
									
			if ($order_info['shipping_address_format']) {
				$format = $order_info['shipping_address_format'];
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
				'firstname' => $order_info['shipping_firstname'],
				'lastname'  => $order_info['shipping_lastname'],
				'company'   => $order_info['shipping_company'],
				'address_1' => $order_info['shipping_address_1'],
				'address_2' => $order_info['shipping_address_2'],
				'city'      => $order_info['shipping_city'],
				'postcode'  => $order_info['shipping_postcode'],
				'zone'      => $order_info['shipping_zone'],
				'zone_code' => $order_info['shipping_zone_code'],
				'country'   => $order_info['shipping_country']  
			);
		
			$template->data['shipping_address'] = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));
			
			// Products
			$template->data['products'] = array();
				
			foreach ($order_product_query->rows as $product) {
				$option_data = array();
				
				$order_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . (int)$product['order_product_id'] . "'");
				
				foreach ($order_option_query->rows as $option) {
					if ($option['type'] != 'file') {
						$value = $option['value'];
					} else {
						$value = utf8_substr($option['value'], 0, utf8_strrpos($option['value'], '.'));
					}
					
					$option_data[] = array(
						'name'  => $option['name'],
						'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
					);					
				}
			  
				$template->data['products'][] = array(
					'name'     => $product['name'],
					'model'    => $product['model'],
					'option'   => $option_data,
					'quantity' => $product['quantity'],
					'price'    => $this->currency->format($product['price'] + ($this->config->get('config_tax') ? $product['tax'] : 0), $order_info['currency_code'], $order_info['currency_value']),
					'total'    => $this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value'])
				);
			}
	
			// Vouchers
			$template->data['vouchers'] = array();
			
			foreach ($order_voucher_query->rows as $voucher) {
				$template->data['vouchers'][] = array(
					'description' => $voucher['description'],
					'amount'      => $this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value']),
				);
			}
	
			$template->data['totals'] = $order_total_query->rows;
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/mail/order_one_click.tpl')) {
				$html = $template->fetch($this->config->get('config_template') . '/template/mail/order_one_click.tpl');
			} else {
				$html = $template->fetch('default/template/mail/order_one_click.tpl');
			}
		
		 if ($this->config->get('config_email')) {
		$subject = sprintf($language->get('text_new_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'), $order_id);
				
				// Text 
				$text  = $language->get('text_new_received') . "\n\n";
				$text .= $language->get('text_new_order_id') . ' ' . $order_id . "\n";
				$text .= $language->get('text_new_telephone') . ' ' . $order_info['telephone'] . "\n";

				$text .= $language->get('text_new_date_added') . ' ' . date($language->get('date_format_short'), strtotime($order_info['date_added'])) . "\n";
				$text .= $language->get('text_new_order_status') . ' ' . $order_status . "\n\n";
				$text .= $language->get('text_new_products') . "\n";
				
				foreach ($order_product_query->rows as $product) {
					$text .= $quantity. 'x ' . $name_product . ' (' . $product['model'] . ') ' . html_entity_decode($this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value']), ENT_NOQUOTES, 'UTF-8') . "\n";
					
					$order_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . $product['order_product_id'] . "'");
					
					foreach ($order_option_query->rows as $option) {
						if ($option['type'] != 'file') {
							$value = $option['value'];
						} else {
							$value = utf8_substr($option['value'], 0, utf8_strrpos($option['value'], '.'));
						}
											
						$text .= chr(9) . '-' . $option['name'] . ' ' . (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value) . "\n";
					}
				}
				
				foreach ($order_voucher_query->rows as $voucher) {
					$text .= '1x ' . $voucher['description'] . ' ' . $this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value']);
				}
							
				$text .= "\n";

				$text .= $language->get('text_new_order_total') . "\n";
				
				foreach ($order_total_query->rows as $total) {
					$text .= $total['title'] . ': ' . html_entity_decode($total['text'], ENT_NOQUOTES, 'UTF-8') . "\n";
				}			
				
				$text .= "\n";
				
				if ($order_info['comment']) {
					$text .= $language->get('text_new_comment') . "\n\n";
					$text .= $order_info['comment'] . "\n\n";
				}
			
				$mail = new Mail(); 
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->hostname = $this->config->get('config_smtp_host');
				$mail->username = $this->config->get('config_smtp_username');
				$mail->password = $this->config->get('config_smtp_password');
				$mail->port = $this->config->get('config_smtp_port');
				$mail->timeout = $this->config->get('config_smtp_timeout');
				$mail->setTo($this->config->get('config_email'));
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender($order_info['store_name']);
				$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
				$mail->setHtml($html);
				$mail->send();
				
				// Send to additional alert emails
				$emails = explode(',', $this->config->get('config_alert_emails'));
				
				foreach ($emails as $email) {
					if ($email && preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $email)) {
						$mail->setTo($email);
						$mail->send();
					}
				}				
			}

        $this->cart->clear();

        $this->response->setOutput(json_encode($oneclick_settings['response_text']));
    }
	
	public function getOrder($order_id) {
		$order_query = $this->db->query("SELECT *, (SELECT os.name FROM `" . DB_PREFIX . "order_status` os WHERE os.order_status_id = o.order_status_id AND os.language_id = o.language_id) AS order_status FROM `" . DB_PREFIX . "order` o WHERE o.order_id = '" . (int)$order_id . "'");
			
		if ($order_query->num_rows) {
			$country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$order_query->row['payment_country_id'] . "'");
			
			if ($country_query->num_rows) {
				$payment_iso_code_2 = $country_query->row['iso_code_2'];
				$payment_iso_code_3 = $country_query->row['iso_code_3'];
			} else {
				$payment_iso_code_2 = '';
				$payment_iso_code_3 = '';				
			}
			
			$zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$order_query->row['payment_zone_id'] . "'");
			
			if ($zone_query->num_rows) {
				$payment_zone_code = $zone_query->row['code'];
			} else {
				$payment_zone_code = '';
			}			
			
			$country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$order_query->row['shipping_country_id'] . "'");
			
			if ($country_query->num_rows) {
				$shipping_iso_code_2 = $country_query->row['iso_code_2'];
				$shipping_iso_code_3 = $country_query->row['iso_code_3'];
			} else {
				$shipping_iso_code_2 = '';
				$shipping_iso_code_3 = '';				
			}
			
			$zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$order_query->row['shipping_zone_id'] . "'");
			
			if ($zone_query->num_rows) {
				$shipping_zone_code = $zone_query->row['code'];
			} else {
				$shipping_zone_code = '';
			}
			
			$this->load->model('localisation/language');
			
			$language_info = $this->model_localisation_language->getLanguage($order_query->row['language_id']);
			
			if ($language_info) {
				$language_code = $language_info['code'];
				$language_filename = $language_info['filename'];
				$language_directory = $language_info['directory'];
			} else {
				$language_code = '';
				$language_filename = '';
				$language_directory = '';
			}
		 			
			return array(
				'order_id'                => $order_query->row['order_id'],
				'invoice_no'              => $order_query->row['invoice_no'],
				'invoice_prefix'          => $order_query->row['invoice_prefix'],
				'store_id'                => $order_query->row['store_id'],
				'store_name'              => $order_query->row['store_name'],
				'store_url'               => $order_query->row['store_url'],				
				'customer_id'             => $order_query->row['customer_id'],
				'firstname'               => $order_query->row['firstname'],
				'lastname'                => $order_query->row['lastname'],
				'telephone'               => $order_query->row['telephone'],
				'fax'                     => $order_query->row['fax'],
				'email'                   => $order_query->row['email'],
				'payment_firstname'       => $order_query->row['payment_firstname'],
				'payment_lastname'        => $order_query->row['payment_lastname'],				
				'payment_company'         => $order_query->row['payment_company'],
				'payment_company_id'      => $order_query->row['payment_company_id'],
				'payment_tax_id'          => $order_query->row['payment_tax_id'],
				'payment_address_1'       => $order_query->row['payment_address_1'],
				'payment_address_2'       => $order_query->row['payment_address_2'],
				'payment_postcode'        => $order_query->row['payment_postcode'],
				'payment_city'            => $order_query->row['payment_city'],
				'payment_zone_id'         => $order_query->row['payment_zone_id'],
				'payment_zone'            => $order_query->row['payment_zone'],
				'payment_zone_code'       => $payment_zone_code,
				'payment_country_id'      => $order_query->row['payment_country_id'],
				'payment_country'         => $order_query->row['payment_country'],	
				'payment_iso_code_2'      => $payment_iso_code_2,
				'payment_iso_code_3'      => $payment_iso_code_3,
				'payment_address_format'  => $order_query->row['payment_address_format'],
				'payment_method'          => $order_query->row['payment_method'],
				'payment_code'            => $order_query->row['payment_code'],
				'shipping_firstname'      => $order_query->row['shipping_firstname'],
				'shipping_lastname'       => $order_query->row['shipping_lastname'],				
				'shipping_company'        => $order_query->row['shipping_company'],
				'shipping_address_1'      => $order_query->row['shipping_address_1'],
				'shipping_address_2'      => $order_query->row['shipping_address_2'],
				'shipping_postcode'       => $order_query->row['shipping_postcode'],
				'shipping_city'           => $order_query->row['shipping_city'],
				'shipping_zone_id'        => $order_query->row['shipping_zone_id'],
				'shipping_zone'           => $order_query->row['shipping_zone'],
				'shipping_zone_code'      => $shipping_zone_code,
				'shipping_country_id'     => $order_query->row['shipping_country_id'],
				'shipping_country'        => $order_query->row['shipping_country'],	
				'shipping_iso_code_2'     => $shipping_iso_code_2,
				'shipping_iso_code_3'     => $shipping_iso_code_3,
				'shipping_address_format' => $order_query->row['shipping_address_format'],
				'shipping_method'         => $order_query->row['shipping_method'],
				'shipping_code'           => $order_query->row['shipping_code'],
				'comment'                 => $order_query->row['comment'],
				'total'                   => $order_query->row['total'],
				'order_status_id'         => $order_query->row['order_status_id'],
				'order_status'            => $order_query->row['order_status'],
				'language_id'             => $order_query->row['language_id'],
				'language_code'           => $language_code,
				'language_filename'       => $language_filename,
				'language_directory'      => $language_directory,
				'currency_id'             => $order_query->row['currency_id'],
				'currency_code'           => $order_query->row['currency_code'],
				'currency_value'          => $order_query->row['currency_value'],
				'ip'                      => $order_query->row['ip'],
				'forwarded_ip'            => $order_query->row['forwarded_ip'], 
				'user_agent'              => $order_query->row['user_agent'],	
				'accept_language'         => $order_query->row['accept_language'],				
				'date_modified'           => $order_query->row['date_modified'],
				'date_added'              => $order_query->row['date_added']
			);
		} else {
			return false;	
		}
	}

    public function orderAll() {    
        $oneclick_settings = $this->config->get('oneclick_settings');
        $this->load->model('setting/extension');
        $this->load->model('catalog/product');

        $data = array();
        $data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
        $data['store_id'] = $this->config->get('config_store_id');
        $data['store_name'] = $this->config->get('config_name');
        if ($data['store_id']) {
            $data['store_url'] = $this->config->get('config_url');
        } else {
            $data['store_url'] = HTTP_SERVER;
        }
        $data['customer_id'] = 0;
        $data['customer_group_id'] = $this->config->get('config_customer_group_id');

        if ($this->customer->isLogged()) {
            $data['customer_id'] = $this->customer->getId();
            $data['customer_group_id'] = $this->customer->getCustomerGroupId();
        }
        $data['firstname'] = 'Заказать в 1 клик '.$this->request->post['name'];
        $data['lastname'] = '';
        $data['email'] = 'null@nu.ll';
        $data['telephone'] = $this->request->post['phone'];
        $data['fax'] = "";

        $data['payment_firstname'] = '';
        $data['payment_lastname'] = '';
        $data['payment_address_1'] = '';
        $data['shipping_address_1'] = '';

        $data['payment_company'] = "";
        $data['shipping_company'] = "";
        $data['payment_address_2'] = "";
        $data['payment_city'] = "";
        $data['payment_postcode'] = "";
        $data['payment_zone'] = "";
        $data['payment_zone_id'] = "";
        $data['payment_country'] = "";
        $data['payment_country_id'] = "";
        $data['payment_address_format'] = "";

        $data['shipping_firstname'] = '';
        $data['shipping_lastname'] = '';
        $data['shipping_address_2'] = "";
        $data['shipping_city'] = "";
        $data['shipping_postcode'] = "";
        $data['shipping_zone'] = "";
        $data['shipping_zone_id'] = "";
        $data['shipping_country'] = "";
        $data['shipping_country_id'] = "";
        $data['shipping_method'] = '';
        $data['payment_company_id'] = "";
        $data['payment_tax_id'] = "";
        $data['payment_code in'] = "";
        $data['shipping_code'] = "";
        $data['forwarded_ip'] = '';
        $data['user_agent'] = '';
        $data['accept_language'] = '';
        $data['payment_code'] = "";
        $data['payment_method'] = '';
        $data['shipping_address_format'] = '{telephone}';


        $data['vouchers'] = array();
        $data['payment_code'] = "";
        $data['payment_method'] = '';
        $data['shipping_address_format'] = '{telephone}';

        $products = $this->cart->getProducts();
        $options = array();
        $total = 0;
        $quantity = 0;
        foreach ($products as $items) {
            $product_data[] = array(
                'product_id' => $items['product_id'],
                'name' => $items['name'],
                'model' => $items['model'],
                'option' => $options,
                'download' => array(),
                'quantity' => $items['quantity'],
                'subtract' => 1,
                'reward' => 0,
                'price' => $items['price'],
                'total' => $items['total'],
                'tax' => 0,
                'href' => $this->url->link('product/product', 'product_id=' . $items['product_id'])
            );
            $total+=$items['price'] * $items['quantity'];
            $quantity+=$items['quantity'];
        }
        ////////totals data
        $total_data = array();
        //$this->load->language('total/sub_total');
        $total_data[] = array(
            'code' => 'sub_total',
            'title' => $this->language->get('text_sub_total'),
            'text' => $this->currency->format($total),
            'value' => '',
            'sort_order' => $this->config->get('sub_total_sort_order')
        );

        $data['products'] = $product_data;
        $data['totals'] = $total_data;
        $data['comment'] = '';
        $data['total'] = $total;
        $data['reward'] = 0;


        if (isset($this->request->cookie['tracking'])) {
            $this->load->model('affiliate/affiliate');

            $affiliate_info = $this->model_affiliate_affiliate->getAffiliateByCode($this->request->cookie['tracking']);

            if ($affiliate_info) {
                $data['affiliate_id'] = $affiliate_info['affiliate_id'];
                $data['commission'] = ($total / 100) * $affiliate_info['commission'];
            } else {
                $data['affiliate_id'] = 0;
                $data['commission'] = 0;
            }
        } else {
            $data['affiliate_id'] = 0;
            $data['commission'] = 0;
        }

        $data['language_id'] = $this->config->get('config_language_id');
        $data['currency_id'] = $this->currency->getId();
        $data['currency_code'] = $this->currency->getCode();
        $data['currency_value'] = $this->currency->getValue($this->currency->getCode());
        $data['ip'] = $this->request->server['REMOTE_ADDR'];

        $this->load->model('checkout/order');

        $order_id = $this->model_checkout_order->addOrder($data);
        $this->model_checkout_order->confirm($order_id, $oneclick_settings['order_status_id']);

         // Admin Alert Mail
        if ($this->config->get('config_email')) {
            $subject = sprintf('%s - заказ %s', html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'), $order_id);

            // Text 
            $text = "Вы получили заказ.\n\n";
            $text .= '№ заказа:'. ' ' . $order_id . "\n";
            $text .= 'Имя:' . ' ' . $this->request->post['name'] . "\n";
            $text .= 'Телефон:' . ' ' . $this->request->post['phone'] . "\n";
            $text .= "Состояние заказа: Ожидание \n\n";
            $text .= 'Товары:' . "\n";

            foreach ($products as $product) {
                $text .= $product['quantity'] . 'x ' . $product['name'] . ' (' . $product['model'] . ") \n";               
            }

            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->hostname = $this->config->get('config_smtp_host');
            $mail->username = $this->config->get('config_smtp_username');
            $mail->password = $this->config->get('config_smtp_password');
            $mail->port = $this->config->get('config_smtp_port');
            $mail->timeout = $this->config->get('config_smtp_timeout');
            $mail->setTo($this->config->get('config_email'));
            $mail->setFrom($this->config->get('config_email'));
            $mail->setSender($this->config->get('config_email'));
            $mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
            $mail->setText(html_entity_decode($text, ENT_QUOTES, 'UTF-8'));
            $mail->send();

            // Send to additional alert emails
            $emails = explode(',', $this->config->get('config_alert_emails'));

            foreach ($emails as $email) {
                if ($email && preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $email)) {
                    $mail->setTo($email);
                    $mail->send();
                }
            }            
        }

        $this->cart->clear();
        echo json_encode(array("order"=>$order_id));
        
    }

}

?>