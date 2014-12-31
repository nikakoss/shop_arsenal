<?php
class ControllerCommonSeoUrl extends Controller {
	public function index() {
		// Add rewrite to url class
		if ($this->config->get('config_seo_url')) {
			$this->url->addRewrite($this);
		}
		
		// Decode URL
		if($this->config->get('multilingual_seo_flag') && !isset($this->request->get['_route_']) && !isset($this->request->get['route'])){
			if($this->config->get('multilingual_seo_default_lang') == $this->session->data['language'])
				return $this->forward('common/home');
			else $this->redirect($this->url->link('common/home'));
			}
			if (isset($this->request->get['_route_']) && $this->request->get['_route_']) {
			$this->request->get['_route_'] = str_replace($this->config->get('multilingual_seo_extension'), '', $this->request->get['_route_']);
		
			$parts = explode('/', $this->request->get['_route_']);
			
			foreach ($parts as $part) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($part) . "'");
				
				if ($query->num_rows) {
					$url = explode('=', $query->row['query']);
					
					if ($url[0] == 'product_id') {
						$this->request->get['product_id'] = $url[1];
					}
					
					if ($url[0] == 'category_id') {
					if($this->config->get('multilingual_seo_absolute') && isset($this->request->get['path'])){
							$parent_id = str_replace('_', '', strrchr($this->request->get['path'], '_') ? strrchr($this->request->get['path'], '_') : $this->request->get['path']);
							$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias u left join " . DB_PREFIX . "category c on c.category_id = REPLACE(u.query, 'category_id=', '') WHERE u.keyword = '" . $this->db->escape($part) . "' AND c.parent_id = '" . $this->db->escape($parent_id) . "'");
              			if(isset($query->row['query']))
							$url = explode('=', $query->row['query']);
						}
						
						if (!isset($this->request->get['path'])) {
							$this->request->get['path'] = $url[1];
						} else {
							$this->request->get['path'] .= '_' . $url[1];
						}
					}	
					
					if ($url[0] == 'manufacturer_id') {
						$this->request->get['manufacturer_id'] = $url[1];
					}
					
					if ($url[0] == 'information_id') {
						$this->request->get['information_id'] = $url[1];
					}	
				} else {
					$this->request->get['route'] = 'error/not_found';	
				}
			}
			
			if (isset($this->request->get['product_id'])) {
				$this->request->get['route'] = 'product/product';
			} elseif (isset($this->request->get['path'])) {
				$this->request->get['route'] = 'product/category';
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$this->request->get['route'] = 'product/manufacturer/info';
			} elseif (isset($this->request->get['information_id'])) {
				$this->request->get['route'] = 'information/information';
			}elseif($this->config->get('multilingual_seo_friendly')) {
							$friendly = $this->config->get('multilingual_seo_urls_'.$this->session->data['language']);
							if(in_array($this->request->get['_route_'], $friendly)){
								$friendly = array_flip($friendly);
								$this->request->get['route'] = $friendly[$this->request->get['_route_']];
							}
						}
			
			if (isset($this->request->get['route'])) {
				return $this->forward($this->request->get['route']);
			}
		}
	}
	
	public function getFullProductPath($product_id) {
					$path = array();
					$categories = $this->db->query("SELECT c.category_id, c.parent_id FROM " . DB_PREFIX . "product_to_category p2c LEFT JOIN " . DB_PREFIX . "category c ON (p2c.category_id = c.category_id) WHERE product_id = '" . (int)$product_id . "'")->rows;
					
					foreach($categories as $key => $category)
					{
						$path[$key] = '';
						if (!$category) continue;
						$path[$key] = $category['category_id'];
						
						while ($category['parent_id']){
							$path[$key] = $category['parent_id'] . '_' . $path[$key];
							$category = $this->db->query("SELECT category_id, parent_id FROM " . DB_PREFIX . "category WHERE category_id = '" . $category['parent_id']. "'")->row;
						}
						
						$path[$key] = $path[$key];
						$banned_cats = $this->config->get('full_product_path_categories');
						
						if(count($banned_cats) && (count($categories) > 1))
						{
							//if(preg_match('#[_=](\d+)&$#', $path[$key], $cat))
							if(preg_match('#[_=](\d+)$#', $path[$key], $cat))
							{
								if(in_array($cat[1], $banned_cats))
									unset($path[$key]);
							}
						}
					}
					
					if (!count($path)) return '';
          
					// wich one is the largest ?
					$whichone = array_map('strlen', $path);
					asort($whichone);
					$whichone = array_keys($whichone);
					
					if ($this->config->get('full_product_path_largest'))
						$whichone = array_pop($whichone);
						
					else $whichone = array_shift($whichone);
					
					return $path[$whichone];
				}
	
	public function rewrite($link) {
	$this->load->model('localisation/language');
				$languagesById = $this->model_localisation_language->getLanguages();
				if($this->session->data['language'] !== $this->config->get('config_language')){
					$languages = array();
					foreach ($languagesById as $result){ $languages[$result['code']] = $result; }
					$this->config->set('config_language_id', $languages[ $this->session->data['language'] ]['language_id']);
				}
				$lang = $this->session->data['language'];
		$url_info = parse_url(str_replace('&amp;', '&', $link));
	
		$url = ''; 
		
		$data = array();
		
		parse_str($url_info['query'], $data);
		
		if($data['route'] == 'product/product') {
          if($this->config->get('full_product_path_bypasscat') && isset($data['path']))
            unset($data['path']);
          if(isset($data['manufacturer_id']))
            unset($data['manufacturer_id']);
          if(!isset($data['path']))
					$data = array('path' => $this->getFullProductPath($data['product_id'])) + $data;
				}
				
		
		foreach ($data as $key => $value) {
			if (isset($data['route'])) {
				if (($data['route'] == 'product/product' && $key == 'product_id') || (($data['route'] == 'product/manufacturer/info' || $data['route'] == 'product/product') && $key == 'manufacturer_id') || ($data['route'] == 'information/information' && $key == 'information_id')) {
					$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = '" . $this->db->escape($key . '=' . (int)$value) . "'".
								 " AND (`language_id` = '" . (int)$this->config->get('config_language_id') . "' OR `language_id` = 0)");
				
					if ($query->num_rows) {
						$url .= '/' . $query->row['keyword'];
						
						unset($data[$key]);
					}					
				} elseif($this->config->get('multilingual_seo_friendly') && ($key == 'route') && in_array($value, array_keys($this->config->get('multilingual_seo_urls_'.$lang)))) {
						$friendly = $this->config->get('multilingual_seo_urls_'.$lang);
						$url .= '/'.$friendly[$data['route']] . ($friendly[$data['route']] ? $this->config->get('multilingual_seo_extension') : '');
					} elseif (isset($data['route']) && $data['route'] == 'common/home') {
						$url .= '/';
					} elseif ($key == 'path') {
					$categories = explode('_', $value);
					
					foreach ($categories as $category) {
						$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = 'category_id=" . (int)$category . "'".
									 " AND (`language_id` = '" . (int)$this->config->get('config_language_id') . "' OR `language_id` = 0)");
				
						/*if(!(($data['route'] == 'product/manufacturer/info' || $data['route'] == 'product/product') && $key == 'manufacturer_id')) $url .= '/' . $query->row['keyword'] . $this->config->get('multilingual_seo_extension'); else
						*/
						if ($query->num_rows) {
							$url .= '/' . $query->row['keyword'];
						}							
					}
					
					unset($data[$key]);
				}
			}
		}
	
		if ($url) {
			unset($data['route']);
		
			$query = '';
		
			if ($data) {
				foreach ($data as $key => $value) {
				if($key != 'site_language')
					$query .= '&' . $key . '=' . $value;
				}
				
				if ($query) {
					$query = '?' . trim($query, '&');
				}
			}

			return $url_info['scheme'] . '://' . $url_info['host'] . (isset($url_info['port']) ? ':' . $url_info['port'] : '') . str_replace('/index.php', '', $url_info['path']) . $url . $query;
		} else {
			return $link;
		}
	}	
}
?>