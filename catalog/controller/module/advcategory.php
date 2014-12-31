<?php  
/*
Code by: bequangtuyen
Y!M: laptrinhvien_ls
Home page: http://opencart.asia
Free module for opencart
*/
class ControllerModuleAdvcategory extends Controller {

	protected $category_id = 0;
	protected $parent_id = 0;
	protected $path = array();
	
	protected function index() {
		
		$this->data = $this->cache->get('controller_module_advcategory');
		
		if (!isset($this->data)) {
		
			$this->language->load('module/category');
			
			$this->data['heading_title'] = $this->language->get('heading_title');
			
			if (isset($this->request->get['path'])) {
				$parts = explode('_', (string)$this->request->get['path']);
			} else {
				$parts = array();
			}
			
			if (isset($parts[0])) {
				$this->data['category_id'] = $parts[0];
			} else {
				$this->data['category_id'] = 0;
			}
			
			if (isset($parts[1])) {
				$this->data['child_id'] = $parts[1];
			} else {
				$this->data['child_id'] = 0;
			}
								
			$this->load->model('catalog/category');

			$this->load->model('catalog/product');

			$this->data['categories'] = array();

			$categories = $this->model_catalog_category->getCategories(0);

			foreach ($categories as $category) {
			
				/*
				$total = $this->model_catalog_product->getTotalProducts(array('filter_category_id' => $category['category_id']));
				*/
				
				if ($category['image']) 
				{
					$image = $category['image'];
				} else {
					$image = 'no_image.jpg';
				}
				
				$image = $this->model_tool_image->resize($image, 36, 36);		
			
				$total = 0;

				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);
					
					/*
					$product_total = $this->model_catalog_product->getTotalProducts($data);

					$total += $product_total;
					*/
					
					$product_total = 0;

					$children_data[] = array(
						'category_id' => $child['category_id'],
						'name'        => $child['name'] . ($this->config->get('config_product_count') && $product_total ? ' (' . $product_total . ')' : ''),
						'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);		
				}

				$this->data['categories'][] = array(
					'category_id' => $category['category_id'],
					'name'        => $category['name'] . ($this->config->get('config_product_count') && $total ? ' (' . $total . ')' : ''),
					'children'    => $children_data,
					'href'        => $this->url->link('product/category', 'path=' . $category['category_id']),
					'image' 	  => $image
				);	
			}
			
			$this->cache->set('controller_module_advcategory', $this->data);
			
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/advcategory.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/advcategory.tpl';
		} else {
			$this->template = 'default/template/module/advcategory.tpl';
		}
		
		$this->render();
  	}
	
}
?>