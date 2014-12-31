<?php   
class ModelAninewsAninews extends Model
{

	public function getAssets($type){
	
		$assets_data = array();
		$sql = "SELECT * FROM " . DB_PREFIX . "aninews_assets WHERE type='".$type."'";
		$query = $this->db->query($sql);
		foreach ($query->rows as $result) {
			$assets_data[$result['attribute']] = $result['value'];
		}		
		return $assets_data;		
	}
	  
	public function getAninewsModule($group, $key, $store_id=0 ){
        $sql = "SELECT * FROM `" . DB_PREFIX . "setting` WHERE `group` = '".$group."' AND `key` = '".$key."'";
		$option_qry = $this->db->query($sql);
		if($option_qry->num_rows)
        {
			return $option_qry->row['value'];
		}else{
			return 0;
		}		
	}
	
	public function saveEmailinDb($data){
		$email_id = $data['email_id'];
      	$this->db->query("INSERT INTO " . DB_PREFIX . "aninews SET email = '" . $email_id . "'");
		$entered_last_id = $this->db->getLastId();
		return $entered_last_id;
	}
	
	public function checkAssestExists($data){
        $sql = "SELECT * FROM `" . DB_PREFIX .$data. "`";
		$sql_qry = mysql_query($sql);
		if($sql_qry){
			return true;
		}else{
			return false;
		}
	}	
	
		
}

?>