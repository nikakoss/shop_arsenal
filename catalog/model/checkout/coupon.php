<?php 
class ModelCheckoutCoupon extends Model {
	public function getCoupon($code) {
		$status = true;

		$coupon_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "coupon` WHERE code = '" . $this->db->escape($code) . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) AND status = '1'");

		if ($coupon_query->num_rows) {
			if ($coupon_query->row['total'] >= $this->cart->getSubTotal()) {
				$status = false;
			}

			$coupon_history_query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "coupon_history` ch WHERE ch.coupon_id = '" . (int)$coupon_query->row['coupon_id'] . "'");

			if ($coupon_query->row['uses_total'] > 0 && ($coupon_history_query->row['total'] >= $coupon_query->row['uses_total'])) {
				$status = false;
			}

			if ($coupon_query->row['logged'] && !$this->customer->getId()) {
				$status = false;
			}

			if ($this->customer->getId()) {
				$coupon_history_query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "coupon_history` ch WHERE ch.coupon_id = '" . (int)$coupon_query->row['coupon_id'] . "' AND ch.customer_id = '" . (int)$this->customer->getId() . "'");

				if ($coupon_query->row['uses_customer'] > 0 && ($coupon_history_query->row['total'] >= $coupon_query->row['uses_customer'])) {
					$status = false;
				}
			}

			// Products
			$coupon_product_data = array();

			$coupon_product_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "coupon_product` WHERE coupon_id = '" . (int)$coupon_query->row['coupon_id'] . "'");

			foreach ($coupon_product_query->rows as $product) {
				$coupon_product_data[] = $product['product_id'];
			}

			// Categories
			$coupon_category_data = array();

			$coupon_category_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "coupon_category` cc LEFT JOIN `" . DB_PREFIX . "category_path` cp ON (cc.category_id = cp.path_id) WHERE cc.coupon_id = '" . (int)$coupon_query->row['coupon_id'] . "'");

			foreach ($coupon_category_query->rows as $category) {
				$coupon_category_data[] = $category['category_id'];
			}			
			
			$product_data = array();
			
			if ($coupon_product_data || $coupon_category_data) {
				foreach ($this->cart->getProducts() as $product) {
					if (in_array($product['product_id'], $coupon_product_data)) {
						$product_data[] = $product['product_id'];

						continue;
					}

					foreach ($coupon_category_data as $category_id) {
						$coupon_category_query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "product_to_category` WHERE `product_id` = '" . (int)$product['product_id'] . "' AND category_id = '" . (int)$category_id . "'");

						if ($coupon_category_query->row['total']) {
							$product_data[] = $product['product_id'];

							continue;
						}						
					}
				}	

				if (!$product_data) {
					$status = false;
				}
			}
		} else {
			$status = false;
		}

		if ($status) {
			return array(
				'coupon_id'     => $coupon_query->row['coupon_id'],
				'code'          => $coupon_query->row['code'],
				'name'          => $coupon_query->row['name'],
				'type'          => $coupon_query->row['type'],
				'discount'      => $coupon_query->row['discount'],
				'shipping'      => $coupon_query->row['shipping'],
				'total'         => $coupon_query->row['total'],
				'product'       => $product_data,
				'date_start'    => $coupon_query->row['date_start'],
				'date_end'      => $coupon_query->row['date_end'],
				'uses_total'    => $coupon_query->row['uses_total'],
				'uses_customer' => $coupon_query->row['uses_customer'],
				'status'        => $coupon_query->row['status'],
				'date_added'    => $coupon_query->row['date_added']
			);
		}
	}

	public function redeem($coupon_id, $order_id, $customer_id, $amount) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "coupon_history` SET coupon_id = '" . (int)$coupon_id . "', order_id = '" . (int)$order_id . "', customer_id = '" . (int)$customer_id . "', amount = '" . (float)$amount . "', date_added = NOW()");
	}
        
    public function getCouponProducts($product_id) {
        $coupon_product_data = array();
        $query = $this->db->query("SELECT cp.product_id, c.name, c.type, c.discount,c.status_client FROM " . DB_PREFIX . "coupon_product cp, " . DB_PREFIX . "coupon c WHERE cp.product_id = '" . (int) $product_id . "' AND cp.coupon_id=c.coupon_id AND c.status=1");

        return $query->rows;
    }
    
    public function getCouponCategory($product_id) {
        // level category 1
        $query = $this->db->query("SELECT * FROM `oc_product_to_category` pc, oc_coupon_category cc, oc_coupon cinf WHERE pc.product_id=".(int)$product_id." AND pc.category_id=cc.category_id AND cc.coupon_id=cinf.coupon_id");
       return $query->rows;
    }
    
    public function getStatusAcount() {
        $query = $this->db->query("SELECT sum(total) AS total FROM oc_order WHERE oc_order.customer_id=" . $this->customer->isLogged() . " AND oc_order.order_status_id=5");
        $queryPromo = $this->db->query("SELECT discount_status FROM " . DB_PREFIX . "customer WHERE customer_id=" . $this->customer->isLogged());
        if ($query->row['total'] == NULL) {
            $query->row['total'] = 0;
        }

        $query1total = $this->db->query("SELECT id,name, discount, url FROM " . DB_PREFIX . "coupon_name WHERE discount = (SELECT MAX(discount) FROM " . DB_PREFIX . "coupon_name WHERE sum <= " . $query->row['total'] . ")");
        $query1promo = $this->db->query("SELECT id,name, discount, url FROM " . DB_PREFIX . "coupon_name WHERE id = " . $queryPromo->row['discount_status']);
/*
        echo "<pre>";
        var_dump($query1total->row['discount'] < $query1promo->row['discount']);
        var_dump($query1total);
        var_dump($query1promo);
        exit;

        */
        if (isset($query1total->row['discount']) && isset($query1promo->row['discount']) && $query1total->row['discount'] < $query1promo->row['discount']) {
            $output_data = $query1promo;
        } elseif(isset($query1total->row['discount']) && isset($query1promo->row['discount']) && (int)$query1total->row['discount'] <= (int)$query1promo->row['discount']){
		$output_data = $query1promo;
		}else {
            $output_data = $query1total;
        }

		/*
		if($_SERVER['SERVER_ADDR'] =='37.143.15.216'){
		var_dump(isset($query1total->row['discount'])); 
		var_dump(isset($query1promo->row['discount'])); 
		var_dump($query1total->row['discount']); 
		var_dump($query1promo->row['discount']); 
		
		var_dump($query1total->row['discount'] < $query1promo->row['discount']); 
		exit;
		}
		*/
		
		
        return $output_data->row;
    }

}
?>
