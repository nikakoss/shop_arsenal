<?php
class ControllerModuleCategory extends Controller {
    protected function index($setting) {
        $this->data = $this->cache->get('controller_module_category');
        $this->document->addScript('catalog/view/javascript/catalog_module.js');
        $this->config->set('ControllerModuleCategory', true);
        if (!isset($this->data)) {
            $this->language->load('module/category');
            $this->data['heading_title'] = $this->language->get('heading_title');
            if (isset($this->request->get['path'])) {
                $parts = explode('_', (string) $this->request->get['path']);
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
                $total = 0;
                $children_data = array();
                //$children = $this->model_catalog_category->getCategories($category['category_id']);
                $children = array();
                foreach ($children as $child) {
                    $data = array(
                        'filter_category_id' => $child['category_id'],
                        'filter_sub_category' => true
                    );
                    $product_total = 0;
                    $children_data[] = array(
                        'category_id' => $child['category_id'],
                        'name' => $child['name'] . ($this->config->get('config_product_count') && $product_total ? ' (' . $product_total . ')' : ''),
                        'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
                    );
                }
                $this->data['categories'][] = array(
                    'category_id' => $category['category_id'],
                    'name' => $category['name'] . ($this->config->get('config_product_count') && $total ? ' (' . $total . ')' : ''),
                    'children' => $children_data,
                    'href' => $this->url->link('product/category', 'path=' . $category['category_id'])
                );
            }
            $this->cache->set('controller_module_category', $this->data);
        }
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/category.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/module/category.tpl';
        } else {
            $this->template = 'default/template/module/category.tpl';
        }
        $this->render();
    }
    public function get_children() {
        if (!isset($this->request->post['category_id']) || (!$category_id = (int) $this->request->post['category_id'])) {
            header("HTTP/1.0 404 Not Found");
            exit('bad post param');
        }
        $categories = array();
        $categories_data = array();
        $this->load->model('catalog/category');
        $categories = $this->model_catalog_category->getCategories($category_id);
        foreach ($categories as $category) {
            $children_data = array();
            $children = $this->model_catalog_category->getCategories($category['category_id']);
            foreach ($children as $child) {
                $children_data[] = array(
                    'category_id' => $child['category_id'],
                    'name' => $child['name'],
                    'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
                );
            }
            $categories_data[] = array(
                'category_id' => $category['category_id'],
                'name' => $category['name'],
                'href' => $this->url->link('product/category', 'path=' . $category_id . '_' . $category['category_id']),
                'children' => $children_data
            );
        }
        $this->response->setOutput(json_encode($categories_data));
    }
    public function top_menu() {
        $this->data = $this->cache->get('controller_module_category');
        $this->config->set('ControllerModuleCategory', true);
        $this->load->model('catalog/category');
        $this->load->model('catalog/product');
        if (!isset($this->data)) {
            $this->language->load('module/category');
            $this->data['heading_title'] = $this->language->get('heading_title');
            if (isset($this->request->get['path'])) {
                $parts = explode('_', (string) $this->request->get['path']);
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
            $this->data['categories'] = array();
            $categories = $this->model_catalog_category->getCategories(0);
            foreach ($categories as $category) {
                $total = 0;
                $children_data = array();
                    $children = array();
                foreach ($children as $child) {
                    $data = array(
                        'filter_category_id' => $child['category_id'],
                        'filter_sub_category' => true
                    );
                    $product_total = 0;
                    $children_data[] = array(
                        'category_id' => $child['category_id'],
                        'name' => $child['name'] . ($this->config->get('config_product_count') && $product_total ? ' (' . $product_total . ')' : ''),
                        'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
                    );
                }
                $this->data['categories'][] = array(
                    'category_id' => $category['category_id'],
                    'name' => $category['name'] . ($this->config->get('config_product_count') && $total ? ' (' . $total . ')' : ''),
                    'children' => $children_data,
                    'href' => $this->url->link('product/category', 'path=' . $category['category_id'])
                );
            }
            $this->cache->set('controller_module_category', $this->data);
        }
        echo '<ul id="menu-container" class="box-category menu-container">';
        $category_id = 0;
        foreach ($this->data['categories'] as $category) {
            echo "<li category-id = '" . $category['category_id'] . "'>";
            if ($category['category_id'] == $category_id) {
                echo "<a href='" . $category['href'] . "' class='active'>" . $category['name'] . "</a>";
               // echo "<a href='javascript:void(0);' class='active'>" . $category['name'] . "</a>";
            } else {
              echo "<a href='" . $category['href'] . "'>" . $category['name'] . "</a>";
               //echo "<a href='javascript:void(0);'>" . $category['name'] . "</a>";
            }
            $children = array();
            $children = $this->model_catalog_category->getCategories($category['category_id']);
            echo "</li>";
        }
        echo '</ul>';
    }
}
