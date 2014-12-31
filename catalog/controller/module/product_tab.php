<?php
class ControllerModuleProductTab extends Controller {
	
	protected function index($setting) {

		static $module = 0;

		$this->language->load('module/product_tab');
		
      	$this->data['heading_title'] = $this->language->get('heading_title');

      	$this->data['tab_latest'] = $this->language->get('tab_latest');
      	$this->data['tab_featured'] = $this->language->get('tab_featured');
      	$this->data['tab_bestseller'] = $this->language->get('tab_bestseller');
      	$this->data['tab_special'] = $this->language->get('tab_special');

		
		$this->data['button_cart'] = $this->language->get('button_cart');
				
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image');

		//Latest Products
		
		$this->data['latest_products'] = array();
		
		$latest_results = $this->model_catalog_product->getLatestProducts($setting['limit']);
if($latest_results){
		foreach ($latest_results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
			} else {
				$image = $this->model_tool_image->resize('no_image.jpg', $setting['image_width'], $setting['image_height']);
			}
						
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
					
			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				if ($result['special'] < $result['price']) {
					$price_offset = $this->currency->format($this->tax->calculate($result['price'] - $result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price_offset = false;
				}
			} else {
				$special = false;
				$price_offset = false;
			}
			
			if ($this->config->get('config_review_status')) {
				$rating = $result['rating'];
			} else {
				$rating = false;
			}
			
			$unit = $result['unit'];
			
			$this->data['latest_products'][] = array(
				'product_id' => $result['product_id'],
				'thumb'   	 => $image,
				'name'    	 => $result['name'],
				'price'   	 => $price,
				'price_offset' => $price_offset,
				'special' 	 => $special,
				'rating'     => $rating,
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
				'unit'        => $unit
			);
		}
        }
		//Specials product

		$this->data['special_products'] = array();

			$special_data = array(
			'sort'  => 'pd.name',
			'order' => 'ASC',
			'start' => 0,
			'limit' => $setting['limit']
		);


		
		$special_results = $this->model_catalog_product->getProductSpecials($special_data);

		foreach ($special_results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
			} else {
				$image = $this->model_tool_image->resize('no_image.jpg', $setting['image_width'], $setting['image_height']);
			}
						
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
			
			$unit = $result['unit'];
					
			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				if ($result['special'] < $result['price']) {
					$price_offset = $this->currency->format($this->tax->calculate($result['price'] - $result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price_offset = false;
				}
			} else {
				$special = false;
				$price_offset = false;
			}
			
			if ($this->config->get('config_review_status')) {
				$rating = $result['rating'];
			} else {
				$rating = false;
			}
			
			$this->data['special_products'][] = array(
				'product_id' => $result['product_id'],
				'thumb'   	 => $image,
				'name'    	 => $result['name'],
				'price'   	 => $price,
				'price_offset' => $price_offset,
				'special' 	 => $special,
				'rating'     => $rating,
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
				'unit'        => $unit
			);
		}

		//BestSeller
		$this->data['bestseller_products'] = array();

		$bestseller_results = $this->model_catalog_product->getBestSellerProducts($setting['limit']);
		
		foreach ($bestseller_results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
			} else {
				$image = $this->model_tool_image->resize('no_image.jpg', $setting['image_width'], $setting['image_height']);
			}
			
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
					
			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				if ($result['special'] < $result['price']) {
					$price_offset = $this->currency->format($this->tax->calculate($result['price'] - $result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price_offset = false;
				}
			} else {
				$special = false;
				$price_offset = false;
			}	
			
			if ($this->config->get('config_review_status')) {
				$rating = $result['rating'];
			} else {
				$rating = false;
			}
			
			$unit = $result['unit'];
							
			$this->data['bestseller_products'][] = array(
				'product_id' => $result['product_id'],
				'thumb'   	 => $image,
				'name'    	 => $result['name'],
				'price'   	 => $price,
				'price_offset' => $price_offset,
				'special' 	 => $special,
				'rating'     => $rating,
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
				'unit'        => $unit
			);
		}


		//Featured
		$this->data['featured_products'] = array();

		$products = explode(',', $this->config->get('featured_product'));		

		if (empty($setting['limit'])) {
			$setting['limit'] = 5;
		}
		
		$products = array_slice($products, 0, (int)$setting['limit']);
		
		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $setting['image_width'], $setting['image_height']);
				} else {
					$image = false;
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
						
				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
					if ($result['special'] < $result['price']) {
						$price_offset = $this->currency->format($this->tax->calculate($result['price'] - $result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$price_offset = false;
					}
				} else {
					$special = false;
					$price_offset = false;
				}
				
				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}
				
				$unit = $result['unit'];
					
				$this->data['featured_products'][] = array(
					'product_id' => $product_info['product_id'],
					'thumb'   	 => $image,
					'name'    	 => $product_info['name'],
					'price'   	 => $price,
					'price_offset' => $price_offset,
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
					'unit'       => $unit
				);
			}
		}

		$this->data['module'] = $module++;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/product_tab.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/product_tab.tpl';
		} else {
			$this->template = 'default/template/module/product_tab.tpl';
		}

		$this->render();
	}
}
?>