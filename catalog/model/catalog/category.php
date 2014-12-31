<?php
class ModelCatalogCategory extends Model {

	public function getCategory($category_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.category_id = '" . (int)$category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");
		
		return $query->row;
	}
    
    public function getCategoryAll() {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.category_id = '177'");
		
		return $query->row;
	}
	
	public function getCategories($parent_id = 0) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND c.status = '1' ORDER BY c.sort_order, LCASE(cd.name)");

		return $query->rows;
	}
	
	public function getCategoryFilters($category_id) {
		$implode = array();
		
		$query = $this->db->query("SELECT filter_id FROM " . DB_PREFIX . "category_filter WHERE category_id = '" . (int)$category_id . "'");
		
		foreach ($query->rows as $result) {
			$implode[] = (int)$result['filter_id'];
		}
		
		
		$filter_group_data = array();
		
		if ($implode) {
			$filter_group_query = $this->db->query("SELECT DISTINCT f.filter_group_id, fgd.name, fg.sort_order FROM " . DB_PREFIX . "filter f LEFT JOIN " . DB_PREFIX . "filter_group fg ON (f.filter_group_id = fg.filter_group_id) LEFT JOIN " . DB_PREFIX . "filter_group_description fgd ON (fg.filter_group_id = fgd.filter_group_id) WHERE f.filter_id IN (" . implode(',', $implode) . ") AND fgd.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY f.filter_group_id ORDER BY fg.sort_order, LCASE(fgd.name)");
			
			foreach ($filter_group_query->rows as $filter_group) {
				$filter_data = array();
				
				$filter_query = $this->db->query("SELECT DISTINCT f.filter_id, fd.name FROM " . DB_PREFIX . "filter f LEFT JOIN " . DB_PREFIX . "filter_description fd ON (f.filter_id = fd.filter_id) WHERE f.filter_id IN (" . implode(',', $implode) . ") AND f.filter_group_id = '" . (int)$filter_group['filter_group_id'] . "' AND fd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY f.sort_order, LCASE(fd.name)");
				
				foreach ($filter_query->rows as $filter) {
					$filter_data[] = array(
						'filter_id' => $filter['filter_id'],
						'name'      => $filter['name']			
					);
				}
				
				if ($filter_data) {
					$filter_group_data[] = array(
						'filter_group_id' => $filter_group['filter_group_id'],
						'name'            => $filter_group['name'],
						'filter'          => $filter_data
					);	
				}
			}
		}
		
		return $filter_group_data;
	}
				
	public function getCategoryLayoutId($category_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_to_layout WHERE category_id = '" . (int)$category_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");
		
		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return $this->config->get('config_layout_category');
		}
	}

	
	public function getProductPath($product_id) {
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
	
	
	public function getProductPathold($product_id) {
	$category_id = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "'");
	var_dump($category_id);
	if(isset($category_id->rows[0]['category_id']) && ($category_id->rows[0]['category_id'] != 0)){
	
		$parent_id = $this->db->query("SELECT parent_id FROM " . DB_PREFIX . "category WHERE category_id = '" . (int)$category_id->rows[0]['category_id'] . "'");
		
		
		
		if(isset($parent_id->rows[0]['parent_id']) && ($parent_id->rows[0]['parent_id'] != 0)){
		
		
			$category = $parent_id->rows[0]['parent_id'] . "_" . $category_id->rows[0]['category_id'];
			$path_id_2 = $this->db->query("SELECT parent_id FROM " . DB_PREFIX . "category WHERE category_id = '" . $parent_id->rows[0]['parent_id'] . "'");
			if(isset($path_id_2->rows[0]['parent_id']) && ($path_id_2->rows[0]['parent_id'] != 0)){
				$category = $path_id_2->rows[0]['parent_id'] . "_" . $parent_id->rows[0]['parent_id'] . "_" . $category_id->rows[0]['category_id'];
				$path_id_3 = $this->db->query("SELECT parent_id FROM " . DB_PREFIX . "category WHERE category_id = '" . (int)$path_id_2->rows[0]['parent_id'] . "'");
				if(isset($path_id_3->rows[0]['parent_id']) && ($path_id_3->rows[0]['parent_id'] != 0)){
					$category = $path_id_3->rows[0]['parent_id'] . "_" . $path_id_2->rows[0]['parent_id'] . "_" . $parent_id->rows[0]['parent_id'] . "_" . $category_id->rows[0]['category_id'];
					$path_id_4 = $this->db->query("SELECT parent_id FROM " . DB_PREFIX . "category WHERE category_id = '" . (int)$path_id_3->rows[0]['parent_id'] . "'");
					if(isset($path_id_4->rows[0]['parent_id']) && ($path_id_4->rows[0]['parent_id'] != 0)){
						$category = $path_id_4->rows[0]['parent_id'] . "_" . $path_id_3->rows[0]['parent_id'] . "_" . $path_id_2->rows[0]['parent_id'] . "_" . $parent_id->rows[0]['parent_id'] . "_" . $category_id->rows[0]['category_id'];	
					}						
				}				
			}
		}else{
			$category = $category_id->rows[0]['category_id'];
		}
	}else{
		$category = false;
	}

	return $category;
}
					
	public function getTotalCategoriesByCategoryId($parent_id = 0) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");
		
		return $query->row['total'];
	}
}
?>