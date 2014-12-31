<?php 
class ControllerProductAdvanced extends Controller {  
	public function index() { 
		$this->language->load('product/category');
        
		
		$this->load->model('catalog/category');
		
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image'); 
		
		if (isset($this->request->get['filter'])) {
			$filter = $this->request->get['filter'];
		} else {
			$filter = '';
		}
				
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}	
							
		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->config->get('config_catalog_limit');
		}
							
		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
       		'separator' => false
   		);	
			
		if (isset($this->request->get['path'])) {
			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}	
			
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
									
			$path = '';
		
			$parts = explode('_', (string)$this->request->get['path']);
		
			$category_id = (int)array_pop($parts);
		
			foreach ($parts as $path_id) {
				if (!$path) {
					$path = (int)$path_id;
				} else {
					$path .= '_' . (int)$path_id;
				}
									
				$category_info = $this->model_catalog_category->getCategory($path_id);
				
				if ($category_info) {
	       			$this->data['breadcrumbs'][] = array(
   	    				'text'      => $category_info['name'],
						'href'      => $this->url->link('product/advanced', 'path=' . $path . $url),
        				'separator' => $this->language->get('text_separator')
        			);
				}
			}
		} else {
			$category_id = 0;
		}
        //$category_id = 282;
				
		$category_info = $this->model_catalog_category->getCategoryAll();
		if ($category_info) {
	  		$this->document->setTitle('Подбор товара');
			$this->document->setDescription($category_info['meta_description']);
			$this->document->setKeywords($category_info['meta_keyword']);
			$this->document->addScript('catalog/view/javascript/jquery/jquery.total-storage.min.js');
			
			$this->data['heading_title'] = "Подбор товара";
			
			$this->data['text_refine'] = $this->language->get('text_refine');
			$this->data['text_empty'] = $this->language->get('text_empty');			
			$this->data['text_quantity'] = $this->language->get('text_quantity');
			$this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$this->data['text_model'] = $this->language->get('text_model');
			$this->data['text_price'] = $this->language->get('text_price');
			$this->data['text_tax'] = $this->language->get('text_tax');
			$this->data['text_points'] = $this->language->get('text_points');
			$this->data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
			$this->data['text_display'] = $this->language->get('text_display');
			$this->data['text_list'] = $this->language->get('text_list');
			$this->data['text_grid'] = $this->language->get('text_grid');
			$this->data['text_sort'] = $this->language->get('text_sort');
			$this->data['text_limit'] = $this->language->get('text_limit');
					
			$this->data['button_cart'] = $this->language->get('button_cart');
			$this->data['button_wishlist'] = $this->language->get('button_wishlist');
			$this->data['button_compare'] = $this->language->get('button_compare');
			$this->data['button_continue'] = $this->language->get('button_continue');
			
			// Set the last category breadcrumb		
			$url = '';
									
			$this->data['breadcrumbs'][] = array(
				'text'      => $category_info['name'],
				'href'      => $this->url->link('product/advanced', 'path=' . $this->request->get['path']),
				'separator' => $this->language->get('text_separator')
			);
								
			if ($category_info['image']) {
				$this->data['thumb'] = $this->model_tool_image->resize($category_info['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
			} else {
				$this->data['thumb'] = '';
			}
									
			$this->data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');
			$this->data['description1'] = html_entity_decode($category_info['description1'], ENT_QUOTES, 'UTF-8');
			$this->data['compare'] = $this->url->link('product/compare');
			
			$url = '';
			
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}	
						
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}	
			
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
                        
			

			
			$this->data['categories'] = $this->cache->get('controller_product_category_categories_' . $category_id);
			
                        if(!isset($this->data['categories'])) {
			
				$this->data['categories'] = array();
				
				$results = $this->model_catalog_category->getCategories($category_id);
				
					foreach ($results as $result) {
						$data = array(
							'filter_category_id'  => $result['category_id'],
							'filter_sub_category' => true
						);
						
						//$product_total = $this->model_catalog_product->getTotalProducts($data);				
						$product_total = 0;
						
						$this->data['categories'][] = array(
							'name'  => $result['name'] . ($this->config->get('config_product_count') && $product_total ? ' (' . $product_total . ')' : ''),
							'href'  => $this->url->link('product/advanced', 'path=' . $this->request->get['path'] . '_' . $result['category_id'] . $url)
						);
					}
					
				$this->cache->set('controller_product_category_categories_' . $category_id, $this->data['categories']);
			
			}
			
			$this->data['products'] = array();
			
			$data = array(
				'filter_category_id' => $category_id,
				'filter_filter'      => $filter, 
				'sort'               => $sort,
				'order'              => $order,
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
			);
					
			$product_total = $this->model_catalog_product->getTotalProducts($data); 
			
			$results = $this->model_catalog_product->getProducts($data);
                        
                        $this->language->load('product/product');

                        $this->load->model('catalog/review');
                        
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('no_image.jpg', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
				}
				
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
				
				$attribute_groups = $this->model_catalog_product->getProductAttributes($result['product_id'], true);
				
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
				
				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}				
				
				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

                                
                                ////////////////rating/////////////

                                $this->data['text_on'] = $this->language->get('text_on');
                                $this->data['text_no_reviews'] = $this->language->get('text_no_reviews');

                                if (isset($this->request->get['page'])) {
                                    $page = $this->request->get['page'];
                                } else {
                                    $page = 1;
                                }

                                $review_total = $this->model_catalog_review->getTotalReviewsByProductId($result['product_id']);

                                $results = $this->model_catalog_review->getReviewsByProductId($result['product_id'], ($page - 1) * 5, 5);
                                $rait_s = 0;

                                foreach ($results as $result_r) {
                                    $rait_s += (int) $result_r['rating'];
                                }
                                if($review_total){
                                    $rait_s_total = round($rait_s / $review_total);
                                }
                                else{
                                    $rait_s_total = 0;
                                }
								
				$this->data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
					'attributes'  => $attribute_groups,
					'price'       => $price,
					'special'     => $special,
					'price_offset'=> $price_offset,
					'tax'         => $tax,
					'rating'      => $result['rating'],
					'reviews'     => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
                                        'total' =>   (int) $review_total,
                                        'rait_s' =>   $rait_s_total,
					'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id'] . $url)
				);
			}
			
			$url = '';
			
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}
				
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
										
										
			$this->data['txt_sorts'] = array(
				'name' => $this->language->get('text_name_sort'),
				'price' => $this->language->get('text_price_sort'),
				'rating' => $this->language->get('text_rating_asc'),
			);
			
			if (isset($this->request->get['sort']) && $this->request->get['sort'] == 'pd.name') {
				if (isset($this->request->get['order']) && $this->request->get['order'] == 'ASC') {
					$this->data['get_sorts']['name']['asc'] = true;
				} else {
					$this->data['get_sorts']['name']['asc'] = false;
				}
				if (isset($this->request->get['order']) && $this->request->get['order'] == 'DESC') {
					$this->data['get_sorts']['name']['desc'] = true;
				} else {
					$this->data['get_sorts']['name']['desc'] = false;
				}
			} else {
				$this->data['get_sorts']['name']['asc'] = false;
				$this->data['get_sorts']['name']['desc'] = false;
			}
			
			if (isset($this->request->get['sort']) && $this->request->get['sort'] == 'p.price') {
				if (isset($this->request->get['order']) && $this->request->get['order'] == 'ASC') {
					$this->data['get_sorts']['price']['asc'] = true;
				} else {
					$this->data['get_sorts']['price']['asc'] = false;
				}
				if (isset($this->request->get['order']) && $this->request->get['order'] == 'DESC') {
					$this->data['get_sorts']['price']['desc'] = true;
				} else {
					$this->data['get_sorts']['price']['desc'] = false;
				}
			} else {
				$this->data['get_sorts']['price']['asc'] = false;
				$this->data['get_sorts']['price']['desc'] = false;
			}
                        
                       ///  var_dump($this->request->get['sort']);
                        if (isset($this->request->get['sort']) && $this->request->get['sort'] == 'pd.rating') {
                            
				if (isset($this->request->get['rating']) && $this->request->get['rating'] == 'ASC') {
					$this->data['get_sorts']['rating']['asc'] = true;
				} else {
					$this->data['get_sorts']['rating']['asc'] = false;
				}
				if (isset($this->request->get['order']) && $this->request->get['order'] == 'DESC') {
					$this->data['get_sorts']['rating']['desc'] = true;
				} else {
					$this->data['get_sorts']['rating']['desc'] = false;
				}
			} else {
				$this->data['get_sorts']['rating']['asc'] = false;
				$this->data['get_sorts']['rating']['desc'] = false;
			}
			
                        
			
			$this->data['sorts'] = array();
			
			$this->data['sorts']['none'] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('product/advanced', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&order=ASC' . $url)
			);
			
			$this->data['sorts']['name']['asc'] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('product/advanced', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=ASC' . $url)
			);

			$this->data['sorts']['name']['desc'] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('product/advanced', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=DESC' . $url)
			);
                        // rating sort
                        $this->data['sorts']['rating']['asc'] = array(
				'text'  => $this->language->get('text_rating_asc'),
				'value' => 'pd.rating-ASC',
				'href'  => $this->url->link('product/advanced', 'path=' . $this->request->get['path'] . '&sort=pd.rating&order=ASC' . $url)
			);

			$this->data['sorts']['rating']['desc'] = array(
				'text'  => $this->language->get('text_rating_asc'),
				'value' => 'pd.rating-DESC',
				'href'  => $this->url->link('product/advanced', 'path=' . $this->request->get['path'] . '&sort=pd.rating&order=DESC' . $url)
			);

			$this->data['sorts']['price']['asc'] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link('product/advanced', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url)
			); 

			$this->data['sorts']['price']['desc'] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link('product/advanced', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url)
			); 
			
			
			$url = '';
			
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}
				
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$this->data['limits'] = array();
	
			$limits = array_unique(array($this->config->get('config_catalog_limit'), 25, 50, 75, 100));
			
			sort($limits);
	
			foreach($limits as $limits){
				$this->data['limits'][] = array(
					'text'  => $limits,
					'value' => $limits,
					'href'  => $this->url->link('product/advanced', 'path=' . $this->request->get['path'] . $url . '&limit=' . $limits)
				);
			}
			
			$url = '';
			
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}
				
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
	
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
					
			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = $this->url->link('product/advanced', 'path=' . $this->request->get['path'].'&page={page}');
                        
                        
                        
			$this->data['pagination'] = $pagination->render();
		
			$this->data['sort'] = $sort;
			$this->data['order'] = $order;
			$this->data['limit'] = $limit;
		
			$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/advanced.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/product/advanced.tpl';
			} else {
				$this->template = 'default/template/product/advanced.tpl';
			}
            
			
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/category_banner',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);
				
			$this->response->setOutput($this->render());										
    	} else {
			$url = '';
			
			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}
			
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}
												
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
				
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
						
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('product/advanced', $url),
				'separator' => $this->language->get('text_separator')
			);
				
			$this->document->setTitle($this->language->get('text_error'));

      		$this->data['heading_title'] = $this->language->get('text_error');

      		$this->data['text_error'] = $this->language->get('text_error');

      		$this->data['button_continue'] = $this->language->get('button_continue');

      		$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
			}
			
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/category_banner',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);
					
			$this->response->setOutput($this->render());
		}
  	}
}
?>