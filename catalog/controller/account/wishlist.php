<?php

class ControllerAccountWishList extends Controller {

    public function index() {
        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('account/wishlist', '', 'SSL');

            //$this->redirect($this->url->link('account/login', '', 'SSL')); 
        }

        $this->language->load('account/wishlist');

        $this->load->model('catalog/product');

        $this->load->model('tool/image');



        if (!isset($this->session->data['wishlist'])) {
            $this->session->data['wishlist'] = array();
        }

        if (isset($this->request->get['remove'])) {
            $key = array_search($this->request->get['remove'], $this->session->data['wishlist']);

            if ($key !== false) {
                unset($this->session->data['wishlist'][$key]);
            }

            $this->session->data['success'] = $this->language->get('text_remove');

            $this->redirect($this->url->link('account/wishlist&path='));
        }
		
		if (isset($this->request->get['remove_all'])) {

                unset($this->session->data['wishlist']);


            $this->session->data['success'] = $this->language->get('text_remove');

            $this->redirect($this->url->link('account/wishlist&path='));
        }

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

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('account/wishlist'),
            'separator' => $this->language->get('text_separator')
        );

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_empty'] = $this->language->get('text_empty');

        $this->data['column_image'] = $this->language->get('column_image');
        $this->data['column_name'] = $this->language->get('column_name');
        $this->data['column_model'] = $this->language->get('column_model');
        $this->data['column_stock'] = $this->language->get('column_stock');
        $this->data['column_price'] = $this->language->get('column_price');
        $this->data['column_action'] = $this->language->get('column_action');

        $this->data['button_continue'] = $this->language->get('button_continue');
        $this->data['button_cart'] = $this->language->get('button_cart');
        $this->data['button_remove'] = $this->language->get('button_remove');


        if (isset($this->session->data['success'])) {

            $this->data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $this->data['success'] = '';
        }
		
		$this->language->load('product/product');

        $this->load->model('catalog/review');

        $this->data['products'] = array();
        foreach ($this->session->data['wishlist'] as $key => $product_id) {
            $product_info = $this->model_catalog_product->getProduct($product_id);

            if ($product_info) {
                if ($product_info['image']) {
                    $image = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
                } else {
                    $image = $this->model_tool_image->resize('no_image.jpg', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
                }

                if ($product_info['quantity'] <= 0) {
                    $stock = $product_info['stock_status'];
                } elseif ($this->config->get('config_stock_display')) {
                    $stock = $product_info['quantity'];
                } else {
                    $stock = $this->language->get('text_instock');
                }

                if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
                } else {
                    $price = false;
                }

                if ((float) $product_info['special']) {
                    $special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
                } else {
                    $special = false;
                }

                $attribute_groups = $this->model_catalog_product->getProductAttributes($product_id, true);
				
				$this->data['text_on'] = $this->language->get('text_on');
                                $this->data['text_no_reviews'] = $this->language->get('text_no_reviews');

                                if (isset($this->request->get['page'])) {
                                    $page = $this->request->get['page'];
                                } else {
                                    $page = 1;
                                }

                                $review_total = $this->model_catalog_review->getTotalReviewsByProductId($product_id);

                                $results = $this->model_catalog_review->getReviewsByProductId($product_id, ($page - 1) * 5, 5);
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
                    'product_id' => $product_info['product_id'],
                    'thumb' => $image,
                    'name' => $product_info['name'],
                    'model' => $product_info['model'],
                    'stock' => $stock,
                    'price' => $price,
                    'special' => $special,
                    'attributes' => $attribute_groups,
                    'rating' => $product_info['rating'],
                    'href' => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
					'total' =>   (int) $review_total,
                    'rait_s' =>   $rait_s_total, 
                    'remove' => $this->url->link('account/wishlist', 'remove=' . $product_info['product_id']),
                    'viewed' => $product_info['viewed'],
                );
            } else {
                //unset($this->session->data['wishlist'][$key]);
            }
        }
        // start pagination///////////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////

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

        if (isset($this->request->get['path'])) {
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
        }

        $this->data['limits'] = array();

        $limits = array_unique(array($this->config->get('config_catalog_limit'), 25, 50, 75, 100));

        sort($limits);

        foreach ($limits as $limits) {
            $this->data['limits'][] = array(
                'text' => $limits,
                'value' => $limits,
                'href' => $this->url->link('account/wishlist', 'path=' . $this->request->get['path'] . $url . '&limit=' . $limits)
            );
        }
        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
            if (isset($this->request->get['limit'])) {
                $limit = $this->request->get['limit'];
                $this->data['products'] = array_slice($this->data['products'], ($page - 1) * $limit, $limit);
            }
        } else {
            $page = 1;
        }
        if (isset($this->request->get['limit'])) {
            $limit = $this->request->get['limit'];
            $this->data['products'] = array_slice($this->data['products'], 0, $limit);
        } else {
            $limit = $this->config->get('config_catalog_limit');
        }

        $this->data['txt_sorts'] = array(
            'name' => $this->language->get('text_name_sort'),
            'price' => $this->language->get('text_price_sort'),
            'rating' => $this->language->get('text_rating_asc'),
        );

        if (isset($this->request->get['sort']) && $this->request->get['sort'] == 'pd.name') {
            if (isset($this->request->get['order']) && $this->request->get['order'] == 'ASC') {

                ////////////////////SORT FUNCTION///////////////////////////////
                function cmp($a, $b) {
                    if ($a['viewed'] == $b['viewed']) {
                        return 0;
                    }
                    return ($a['viewed'] < $b['viewed']) ? -1 : 1;
                }

                usort($this->data['products'], "cmp");
                ////////////////////////////////////////////////////////////////
                $this->data['get_sorts']['name']['asc'] = true;
            } else {
                $this->data['get_sorts']['name']['asc'] = false;
            }
            if (isset($this->request->get['order']) && $this->request->get['order'] == 'DESC') {

                ////////////////////SORT FUNCTION///////////////////////////////
                function cmp($a, $b) {
                    if ($a['viewed'] == $b['viewed']) {
                        return 0;
                    }
                    return ($a['viewed'] < $b['viewed']) ? 1 : -1;
                }

                usort($this->data['products'], "cmp");
                ////////////////////////////////////////////////////////////////
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

                ////////////////////SORT FUNCTION///////////////////////////////
                function cmp($a, $b) {
                    $a['price'] = str_replace("$", " ", $a['price']);
                    $b['price'] = str_replace("$", " ", $b['price']);
                    if ($a['price'] == $b['price']) {
                        return 0;
                    }
                    return ($a['price'] < $b['price']) ? -1 : 1;
                }

                usort($this->data['products'], "cmp");
                ////////////////////////////////////////////////////////////////
                $this->data['get_sorts']['price']['asc'] = true;
            } else {
                $this->data['get_sorts']['price']['asc'] = false;
            }
            if (isset($this->request->get['order']) && $this->request->get['order'] == 'DESC') {

                ////////////////////SORT FUNCTION///////////////////////////////
                function cmp($a, $b) {
                    $a['price'] = str_replace("$", " ", $a['price']);
                    $b['price'] = str_replace("$", " ", $b['price']);
                    if ($a['price'] == $b['price']) {
                        return 0;
                    }
                    return ($a['price'] < $b['price']) ? 1 : -1;
                }

                usort($this->data['products'], "cmp");
                ////////////////////////////////////////////////////////////////
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
            if (isset($this->request->get['order']) && $this->request->get['order'] == 'ASC') {

                ////////////////////SORT FUNCTION///////////////////////////////

                function cmp($a, $b) {
                    if ($a['rating'] == $b['rating']) {
                        return 0;
                    }
                    return ($a['rating'] < $b['rating']) ? -1 : 1;
                }

                usort($this->data['products'], "cmp");
                ////////////////////////////////////////////////////////////////
                $this->data['get_sorts']['rating']['asc'] = true;
            } else {
                $this->data['get_sorts']['rating']['asc'] = false;
            }
            if (isset($this->request->get['order']) && $this->request->get['order'] == 'DESC') {

                ////////////////////SORT FUNCTION///////////////////////////////
                function cmp($a, $b) {
                    if ($a['rating'] == $b['rating']) {
                        return 0;
                    }
                    return ($a['rating'] < $b['rating']) ? -1 : 1;
                }

                usort($this->data['products'], "cmp");
                ////////////////////////////////////////////////////////////////
                $this->data['get_sorts']['rating']['desc'] = true;
            } else {
                $this->data['get_sorts']['rating']['desc'] = false;
            }
        } else {
            $this->data['get_sorts']['rating']['asc'] = false;
            $this->data['get_sorts']['rating']['desc'] = false;
        }



        $this->data['sorts'] = array();
        $url = '';

        $this->data['sorts']['none'] = array(
            'text' => $this->language->get('text_default'),
            'value' => 'p.sort_order-ASC',
            'href' => $this->url->link('account/wishlist', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&order=ASC' . $url)
        );

        $this->data['sorts']['name']['asc'] = array(
            'text' => $this->language->get('text_name_asc'),
            'value' => 'pd.name-ASC',
            'href' => $this->url->link('account/wishlist', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=ASC' . $url)
        );

        $this->data['sorts']['name']['desc'] = array(
            'text' => $this->language->get('text_name_desc'),
            'value' => 'pd.name-DESC',
            'href' => $this->url->link('account/wishlist', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=DESC' . $url)
        );
        // rating sort
        $this->data['sorts']['rating']['asc'] = array(
            'text' => $this->language->get('text_rating_asc'),
            'value' => 'pd.rating-ASC',
            'href' => $this->url->link('account/wishlist', 'path=' . $this->request->get['path'] . '&sort=pd.rating&order=ASC' . $url)
        );

        $this->data['sorts']['rating']['desc'] = array(
            'text' => $this->language->get('text_rating_asc'),
            'value' => 'pd.rating-DESC',
            'href' => $this->url->link('account/wishlist', 'path=' . $this->request->get['path'] . '&sort=pd.rating&order=DESC' . $url)
        );

        $this->data['sorts']['price']['asc'] = array(
            'text' => $this->language->get('text_price_asc'),
            'value' => 'p.price-ASC',
            'href' => $this->url->link('account/wishlist', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url)
        );

        $this->data['sorts']['price']['desc'] = array(
            'text' => $this->language->get('text_price_desc'),
            'value' => 'p.price-DESC',
            'href' => $this->url->link('account/wishlist', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url)
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

        if (isset($this->request->get['limit'])) {
            $url .= '&limit=' . $this->request->get['limit'];
        }

        $this->data['remove_all'] = $this->url->link('account/wishlist', 'remove_all=' . 1 );
		$product_total = sizeof($this->session->data['wishlist']);
        $pagination = new Pagination();
        $pagination->total = $product_total;
        $pagination->page = $page;
        $pagination->limit = $limit;
        $pagination->text = $this->language->get('text_pagination');
        if (isset($this->request->get['limit'])) {
            $pagination->url = $this->url->link('account/wishlist', 'path=' . $this->request->get['path'] . '&page={page}' . "&limit=$limit");
        } else {
            $pagination->url = $this->url->link('account/wishlist', 'path=' . $this->request->get['path'] . '&page={page}'. "&limit=10");
        }

        $this->data['pagination'] = $pagination->render();


        //////////////////////////////// end pagination///////////////////////////////////////////////////////////////////
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        $this->data['continue'] = $this->url->link('account/account', '', 'SSL');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/wishlist.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/account/wishlist.tpl';
        } else {
            $this->template = 'default/template/account/wishlist.tpl';
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

    public function add() {
        $this->language->load('account/wishlist');

        $json = array();

        if (!isset($this->session->data['wishlist'])) {
            $this->session->data['wishlist'] = array();
        }

        if (isset($this->request->post['product_id'])) {
            $product_id = $this->request->post['product_id'];
        } else {
            $product_id = 0;
        }

        $this->load->model('catalog/product');

        $product_info = $this->model_catalog_product->getProduct($product_id);

        if ($product_info) {
            if (!in_array($this->request->post['product_id'], $this->session->data['wishlist'])) {
                $this->session->data['wishlist'][] = $this->request->post['product_id'];
            }

            if ($this->customer->isLogged()) {
                $json['success'] = sprintf($this->language->get('text_success'), $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']), $product_info['name'], $this->url->link('account/wishlist'));
            } else {
                $json['success'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'), $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']), $product_info['name'], $this->url->link('account/wishlist'));
            }

            $json['total'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
        }

        $this->response->setOutput(json_encode($json));
    }

}

?>