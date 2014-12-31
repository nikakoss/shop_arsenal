<?php
class ControllerModuleSxd extends Controller {

	private $error = array(); 
	
	/* 
	* We strongly recommend to rename the folder /system/library/sxd to somthing like 
	* and change variable $sxd_folder. For example, if you change the folder to /system/library/sxd_8b1
	* $sxd_folder should be 'sxd_8b1'
	*
	* This is extra protection of you data
	*/
	
	private $sxd_folder = 'sxd'; 
		
	public function index() {   
	
		if(version_compare(VERSION, '1.5.5', '>=')) {
			$this->language->load('module/sxd');
		}
		else {
			$this->load->language('module/sxd');
		}

		$this->document->setTitle($this->language->get('heading_title'));
        
		$this->data['heading_title'] = $this->language->get('heading_title');		
		$this->data['error_select_dump'] = $this->language->get('error_select_dump');		
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_download'] = $this->language->get('button_download');
		$this->data['author_text']   = $this->language->get('author_text');
		$this->data['author_link']   = $this->language->get('author_link');		
        
    	$this->data['breadcrumbs'] = array();

   	$this->data['breadcrumbs'][] = array(
    		'text'      => $this->language->get('text_home'),
    		'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
    		'separator' => false
   	);

   	$this->data['breadcrumbs'][] = array(
     		'text'      => $this->language->get('text_module'),
		   	'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
     		'separator' => ' :: '
   	);
		
   	$this->data['breadcrumbs'][] = array(
     		'text'      => $this->language->get('heading_title'),
    		  'href'      => $this->url->link('module/sxd', 'token=' . $this->session->data['token'], 'SSL'),
     		'separator' => ' :: '
   	);
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['sxd_link'] = HTTP_CATALOG . 'system/library/'.$this->sxd_folder.'/?token='. $this->session->data['token'];
		$this->data['download_link'] = HTTP_SERVER . 'index.php?route=module/sxd/download&token='. $this->session->data['token'];
		
		$this->template = 'module/sxd.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	function download() {
	
		if(version_compare(VERSION, '1.5.5', '>=')) {
			$this->language->load('module/sxd');
		}
		else {
			$this->load->language('module/sxd');
		}
	
		if (!$this->user->hasPermission('modify', 'module/sxd')) {
			exit( $this->language->get('error_permission') );
		}

		
		if (!isset($this->request->get['file']) || empty($this->request->get['file'])) {
			exit("Error: No \$_GET['file'] is set");
		};
		
		$filename = urldecode($this->request->get['file']);
		$path_to_file = DIR_SYSTEM . 'library/' . $this->sxd_folder . '/backup/' . $filename;
		
		if (!is_file($path_to_file)) {
			exit("Error: No file on the path: ".$path_to_file);
		}
		
		if (function_exists('ini_set')) {
			ini_set('max_execution_time', 300); // 5 mins
		}
		
		header("Pragma: public");
		header("Expires: 0");
		header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
		header("Content-Type: application/octet-stream");
		header("Content-Transfer-Encoding: binary");
		header("Content-Disposition: attachment; filename=". $filename);  
		header("Content-Length: ". filesize($path_to_file));
		readfile($path_to_file);


	}
}
