<?php
class ModelSaleSubscription extends Model {
		public function getSubscription() {
      	$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "subscription");		
		return $query->rows;
	}
		public function changeSubscription($id,$val) {
      	$this->db->query("UPDATE oc_subscription SET Sub_active='".$val."' WHERE id_sub='".$id."' ");		
	}
}