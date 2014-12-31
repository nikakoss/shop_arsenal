<?php 
/** 
 */
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
	
	public function install(){
	
		$res0 = $this->db->query("SHOW TABLES LIKE '".DB_PREFIX."aninews'");
		if($res0->num_rows == 0){
			$this->db->query("
				CREATE TABLE IF NOT EXISTS `".DB_PREFIX."aninews` (
				  `id` int(11) NOT NULL AUTO_INCREMENT,
				  `email` varchar(255) NOT NULL,
				  `status` int(11) NOT NULL DEFAULT '1',
				  PRIMARY KEY (`id`)
				) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
			");
		}
			
		$res1 = $this->db->query("SHOW TABLES LIKE '".DB_PREFIX."aninews_assets'");
		if($res1->num_rows == 0){
			$this->db->query("
				CREATE TABLE IF NOT EXISTS `".DB_PREFIX."aninews_assets` (
				  `id` int(11) NOT NULL AUTO_INCREMENT,
				  `type` varchar(255) NOT NULL,
				  `attribute` varchar(255) NOT NULL,
				  `value` varchar(255) NOT NULL,
				  PRIMARY KEY (`id`)
				) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
			");						
			$this->db->query("INSERT INTO " . DB_PREFIX . "aninews_assets SET type = 'ani_style', attribute = 'ani_background_color', value = '#FB2B75'");
			$this->db->query("INSERT INTO " . DB_PREFIX . "aninews_assets SET type = 'ani_style', attribute = 'ani_main_border_color', value = '#DDDDDD'");
			$this->db->query("INSERT INTO " . DB_PREFIX . "aninews_assets SET type = 'ani_style', attribute = 'ani_main_boxshadow_color', value = '#DDDDDD'");
			$this->db->query("INSERT INTO " . DB_PREFIX . "aninews_assets SET type = 'ani_style', attribute = 'ani_label_text_color', value = '#000000'");
			$this->db->query("INSERT INTO " . DB_PREFIX . "aninews_assets SET type = 'ani_style', attribute = 'ani_button_background_color', value = '#32353A'");
			$this->db->query("INSERT INTO " . DB_PREFIX . "aninews_assets SET type = 'ani_style', attribute = 'ani_button_background_hover_color', value = '#3DBCD4'");
			$this->db->query("INSERT INTO " . DB_PREFIX . "aninews_assets SET type = 'ani_style', attribute = 'ani_close_link_color', value = '#000000'");
			$this->db->query("INSERT INTO " . DB_PREFIX . "aninews_assets SET type = 'ani_style', attribute = 'ani_close_link_hover_color', value = '#FFFFFF'");
			
			
			$this->db->query("INSERT INTO " . DB_PREFIX . "aninews_assets SET type = 'ani_text', attribute = 'ani_heading', value = 'Ani News Letter'");			
			$this->db->query("INSERT INTO " . DB_PREFIX . "aninews_assets SET type = 'ani_text', attribute = 'ani_label_title', value = 'Please Fill Your Email Id'");			
			$this->db->query("INSERT INTO " . DB_PREFIX . "aninews_assets SET type = 'ani_text', attribute = 'ani_placeholder_text', value = 'Enter The Email To Subscribe'");			
			$this->db->query("INSERT INTO " . DB_PREFIX . "aninews_assets SET type = 'ani_text', attribute = 'ani_button_text', value = 'Go'");			
			$this->db->query("INSERT INTO " . DB_PREFIX . "aninews_assets SET type = 'ani_text', attribute = 'ani_close_link_text', value = 'Close'");

		}
	}
	
	
	public function saveSettings($data){	

		$this->db->query("UPDATE " . DB_PREFIX . "aninews_assets SET value = '".$data['ani_background_color']."' WHERE attribute = 'ani_background_color'");
		$this->db->query("UPDATE " . DB_PREFIX . "aninews_assets SET value = '".$data['ani_main_border_color']."' WHERE attribute = 'ani_main_border_color'");
		$this->db->query("UPDATE " . DB_PREFIX . "aninews_assets SET value = '".$data['ani_main_boxshadow_color']."' WHERE attribute = 'ani_main_boxshadow_color'");
		$this->db->query("UPDATE " . DB_PREFIX . "aninews_assets SET value = '".$data['ani_label_text_color']."' WHERE attribute = 'ani_label_text_color'");
		$this->db->query("UPDATE " . DB_PREFIX . "aninews_assets SET value = '".$data['ani_button_background_color']."' WHERE attribute = 'ani_button_background_color'");
		$this->db->query("UPDATE " . DB_PREFIX . "aninews_assets SET value = '".$data['ani_button_background_hover_color']."' WHERE attribute = 'ani_button_background_hover_color'");
		$this->db->query("UPDATE " . DB_PREFIX . "aninews_assets SET value = '".$data['ani_close_link_color']."' WHERE attribute = 'ani_close_link_color'");
		$this->db->query("UPDATE " . DB_PREFIX . "aninews_assets SET value = '".$data['ani_close_link_hover_color']."' WHERE attribute = 'ani_close_link_hover_color'");

		$this->db->query("UPDATE " . DB_PREFIX . "aninews_assets SET value = '".$data['ani_heading']."' WHERE attribute = 'ani_heading'");
		$this->db->query("UPDATE " . DB_PREFIX . "aninews_assets SET value = '".$data['ani_label_title']."' WHERE attribute = 'ani_label_title'");
		$this->db->query("UPDATE " . DB_PREFIX . "aninews_assets SET value = '".$data['ani_placeholder_text']."' WHERE attribute = 'ani_placeholder_text'");
		$this->db->query("UPDATE " . DB_PREFIX . "aninews_assets SET value = '".$data['ani_button_text']."' WHERE attribute = 'ani_button_text'");
		$this->db->query("UPDATE " . DB_PREFIX . "aninews_assets SET value = '".$data['ani_close_link_text']."' WHERE attribute = 'ani_close_link_text'");

	}

	
    public function uninstall(){

        $res0 = $this->db->query("SHOW TABLES LIKE '".DB_PREFIX."aninews'");
        if($res0->num_rows > 0){
			$query = $this->db->query("DROP TABLE `".DB_PREFIX."aninews`");
        }
		
        $res1 = $this->db->query("SHOW TABLES LIKE '".DB_PREFIX."aninews_assets'");
        if($res1->num_rows > 0){
			$query = $this->db->query("DROP TABLE `".DB_PREFIX."aninews_assets`");
        }		
    }	
}
?>