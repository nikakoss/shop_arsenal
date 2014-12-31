<?php  
class ControllerModuleAninews extends Controller {
	public function index() {
	
		$this->language->load('module/aninews');		
		$this->load->model('aninews/aninews');
		
		$aninewsexistandisactive = $this->model_aninews_aninews->getAninewsModule('aninews','aninews_module_status');

		if($_SERVER['HTTP_REFERER'] == HTTP_SERVER){
			$parent_route = "index.php";
		}else{
			$parent_ref = $_SERVER['HTTP_REFERER'];
			$parent_ref_exp = explode("?route=",$parent_ref);
			$parent_route = $parent_ref_exp[1];				
		}

		$style_array = $this->model_aninews_aninews->getAssets('ani_style');
		$this->data['style_array'] = $style_array;
		
		$text_array = $this->model_aninews_aninews->getAssets('ani_text');
		$this->data['text_array'] = $text_array;			
			
			
		if(($parent_route == "common/home") || ($parent_route == "index.php")){
			if($aninewsexistandisactive){
				$this->data['heading_title'] = $this->language->get('heading_title');
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/aninews.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/module/aninews.tpl';
				} else {
					$this->template = 'default/template/module/aninews.tpl';
				}
				$this->response->setOutput($this->render());
			}
		}
	}
	
	public function saveEmail() {
	
		$json = array();
		$this->load->model('aninews/aninews');
		$data_aninews = array();
		$data_aninews['email_id'] = $_REQUEST['email_id'];
		$save_email_in_db = $this->model_aninews_aninews->saveEmailinDb($data_aninews);
		if($save_email_in_db > 0){
			$json['aninews_response_msg'] = "success";
		}else{
			$json['aninews_response_msg'] = "failed";
		}
		
		$this->response->setOutput(json_encode($json));			
	}
	

	public function chaeckIfModuleIsInstalled() {
	
		$json = array();
		$this->load->model('aninews/aninews');
		$aninewsexistandisactive = $this->model_aninews_aninews->checkAssestExists('aninews');
		
		if($aninewsexistandisactive){
			$json['aninews_response_msg'] = true;
		}else{
			$json['aninews_response_msg'] = false;
		}
		$this->response->setOutput(json_encode($json));			
	}	
	
}
?>