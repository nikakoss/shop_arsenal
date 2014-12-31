<?php
class ModelTotalCoupon extends Model {
	public function getTotal(&$total_data, &$total, &$taxes) {
		if (isset($this->session->data['coupon'])) {
			$this->language->load('total/coupon');
			
			$this->load->model('checkout/coupon');
			 
			$coupon_info = $this->model_checkout_coupon->getCoupon($this->session->data['coupon']);
			
			if ($coupon_info) {
				$discount_total = 0;
				
				if (!$coupon_info['product']) {
					$sub_total = $this->cart->getSubTotal();
				} else {
					$sub_total = 0;
				
					foreach ($this->cart->getProducts() as $product) {
						if (in_array($product['product_id'], $coupon_info['product'])) {
							$sub_total += $product['total'];
						}
					}					
				}
				
				if ($coupon_info['type'] == 'F') {
					$coupon_info['discount'] = min($coupon_info['discount'], $sub_total);
				}
				
				foreach ($this->cart->getProducts() as $product) {
					$discount = 0;
					
					if (!$coupon_info['product']) {
						$status = true;
					} else {
						if (in_array($product['product_id'], $coupon_info['product'])) {
							$status = true;
						} else {
							$status = false;
						}
					}
					
					if ($status) {
						if ($coupon_info['type'] == 'F') {
							$discount = $coupon_info['discount'] * ($product['total'] / $sub_total);
						} elseif ($coupon_info['type'] == 'P') {
							$discount = $product['total'] / 100 * $coupon_info['discount'];
						}
				
						if ($product['tax_class_id']) {
							$tax_rates = $this->tax->getRates($product['total'] - ($product['total'] - $discount), $product['tax_class_id']);
							
							foreach ($tax_rates as $tax_rate) {
								if ($tax_rate['type'] == 'P') {
									$taxes[$tax_rate['tax_rate_id']] -= $tax_rate['amount'];
								}
							}
						}
					}
					
					$discount_total += $discount;
				}
				
				if ($coupon_info['shipping'] && isset($this->session->data['shipping_method'])) {
					if (!empty($this->session->data['shipping_method']['tax_class_id'])) {
						$tax_rates = $this->tax->getRates($this->session->data['shipping_method']['cost'], $this->session->data['shipping_method']['tax_class_id']);
						
						foreach ($tax_rates as $tax_rate) {
							if ($tax_rate['type'] == 'P') {
								$taxes[$tax_rate['tax_rate_id']] -= $tax_rate['amount'];
							}
						}
					}
					
					$discount_total += $this->session->data['shipping_method']['cost'];				
				}				
      			
				$total_data[] = array(
					'code'       => 'coupon',
        			'title'      => sprintf($this->language->get('text_coupon'), $this->session->data['coupon']),
	    			'text'       => $this->currency->format(-$discount_total),
        			'value'      => -$discount_total,
					'sort_order' => $this->config->get('coupon_sort_order')
      			);

				$total -= $discount_total;
			} 
		}
              /**/
                $discount_price=null;
        if ($this->customer->isLogged()) { // logget user
             $this->load->model('checkout/coupon'); // include model
             //
              $getStatusAcount = $this->model_checkout_coupon->getStatusAcount();              
              $total_discount=FALSE;
            foreach ($this->cart->getProducts() as $product) {              
                
                 // coupon products
                $coupon = $this->model_checkout_coupon->getCouponProducts($product['product_id']);
                
                // coupon category
                if(!$coupon){
                   $coupon=$this->model_checkout_coupon->getCouponCategory($product['product_id']);
                }
               //&& isset($coupon[0]['status_client']) && (int)$coupon[0]['status_client']==(int)$customer_info['id']
                if ($coupon && $getStatusAcount['id']==$coupon[0]['status_client']) {
                    
                    
                    if ($coupon[0]['type'] == 'P') {
                          //  $discount_price = $product['price'] - (($product['price'] / 100) * $coupon[0]['discount']);                       
                            $discount_price = (($product['price'] / 100) * $coupon[0]['discount'])*(int)$product['quantity'];                       
                    }

                    if ($coupon[0]['type'] == 'F') {                           
                            //$discount_price = $product['price'] - $coupon[0]['discount'];   
                            $discount_price = $coupon[0]['discount']*(int)$product['quantity'];   
                    }
                   // $total-=$discount_price*(int)$product['quantity'];
                    $total-=$discount_price;
                }                
                $total_discount+=$discount_price;
                
            }
         if($total_discount){
          $total_data[] = array(
                'code' => 'coupon',
                'title' => "Cкидка",
                'text' => round($total_discount,2)." руб",
                'value' => max(0, $total),
                'sort_order' => $this->config->get('total_sort_order')-1
            );    
         }
           
        } // logget user
    }
	
	public function confirm($order_info, $order_total) {
		$code = '';
		
		$start = strpos($order_total['title'], '(') + 1;
		$end = strrpos($order_total['title'], ')');
		
		if ($start && $end) {  
			$code = substr($order_total['title'], $start, $end - $start);
		}	
		
		$this->load->model('checkout/coupon');
		
		$coupon_info = $this->model_checkout_coupon->getCoupon($code);
			
		if ($coupon_info) {
			$this->model_checkout_coupon->redeem($coupon_info['coupon_id'], $order_info['order_id'], $order_info['customer_id'], $order_total['value']);	
		}						
	}
}
?>