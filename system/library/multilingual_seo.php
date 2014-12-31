<?php
/************************************
 - Sirius multilingual seo module -
*************************************

 contact : sirius_box-dev@yahoo.fr
 
************************************/

final class multilingual_seo extends Controller
{
	public function detect()
	{
		if($this->config->get('multilingual_seo_flag') && isset($_GET['site_language']))
		{
			if(!empty($_GET['site_language']))
			{
				$change = false;
				if(!isset($this->session->data['language']))
				{
					$change = true;
				}
				elseif($_GET['site_language'] !== $this->session->data['language'])
				{
					$change = true;
				}
				if($change)
		{
			$this->load->model('localisation/language');
			$languages = array();
			$results = $this->model_localisation_language->getLanguages();
			foreach ($results as $result) {
					if($result['status']) $languages[] = strtolower($result['code']);
			}
			if( in_array(strtolower($_GET['site_language']), $languages) ) 
				$this->session->data['language'] = strtolower($_GET['site_language']);
				else{$this->redirect($this->url->link('common/home'));}
			}
		}
			else
			{
				$this->session->data['language'] = $this->config->get('multilingual_seo_default_lang');
			}
		}
		else
		{
			$get = array();
			
			if (isset($this->request->get['_route_'])) {
				$parts = explode('/', $this->request->get['_route_']);
				
				foreach ($parts as $part) {
					$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($part) . "'");
					
					if ($query->num_rows) {
						$url = explode('=', $query->row['query']);
						
						if ($url[0] == 'product_id') {
							$get['product_id'] = $url[1];
						}
						
						if ($url[0] == 'category_id') {
							if (!isset($this->request->get['path'])) {
								$get['path'] = $url[1];
							} else {
								$get['path'] .= '_' . $url[1];
							}
						}	
						
						if ($url[0] == 'manufacturer_id') {
							$get['manufacturer_id'] = $url[1];
						}
						
						if ($url[0] == 'information_id') {
							$get['information_id'] = $url[1];
						}	
					} else {
						$get['route'] = 'error/not_found';	
					}
				}
				
				if (isset($get['product_id'])) {
					$get['route'] = 'product/product';
				} elseif (isset($get['path'])) {
					$get['route'] = 'product/category';
				} elseif (isset($get['manufacturer_id'])) {
					$get['route'] = 'product/manufacturer/product';
				} elseif (isset($get['information_id'])) {
					$get['route'] = 'information/information';
				}
				
				if (isset($get['route'])) {
					if(isset($query->row['language_id']) && ($query->row['language_id'] != 0) && (count($query->rows) === 1))
					{
						$this->load->model('localisation/language');
						$languages = array();
						$results = $this->model_localisation_language->getLanguages();
						foreach ($results as $result) {
							if($result['status']) $languages[$result['language_id']] = strtolower($result['code']);
						}
						if(isset( $languages[ $query->row['language_id'] ]))
							$this->session->data['language'] = $languages[ $query->row['language_id'] ];
					}
				}
			}
		}
	}
}