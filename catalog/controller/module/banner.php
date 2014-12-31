<?php  
class ControllerModuleBanner extends Controller {
	protected function index($setting) {
		static $module = 0;
		$this->load->model('design/banner');
		$this->load->model('tool/image');
		$this->load->model('catalog/product');
		$this->document->addScript('catalog/view/javascript/jquery/jquery.cycle.js');
		$this->data['banners'] = array();
		$results = $this->model_design_banner->getBanner($setting['banner_id']);
		foreach ($results as $result) {
			if (file_exists(DIR_IMAGE . $result['image'])) {
				if (is_numeric($result['link'])) {
					$product_info = $this->model_catalog_product->getProduct($result['link']);
					if ($product_info['image']) {
						$product_info['thumbnail'] = $this->model_tool_image->resize($product_info['image'], 150, 135);
					} else {
						$product_info['thumbnail'] = '';
					}
                                        // var_dump(isset($product_info['special'])); exit;
					if (isset($product_info['special'])) {
						$product_info['current_price'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
					} else {
                                            if(isset($product_info['price'])){
						$product_info['current_price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
                                            }
                                            }
					$result['link'] = $this->url->link('product/product' . '&product_id=' . $result['link']);
				} else {
					$product_info = false;
				}
				$this->data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']),
					'product' => $product_info
				);
			}
		}
		$this->data['module'] = $module++;
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/banner.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/banner.tpl';
		} else {
			$this->template = 'default/template/module/banner.tpl';
		}
		$this->render();
	}
}
?>