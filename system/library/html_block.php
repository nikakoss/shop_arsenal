<?php
	Class Html_block {

		private $config;

		public function __construct($registry) {
			$this->config = $registry->get('config');
		}
		
		function get($html_block_id) {

			if ($block = $this->config->get('html_block_' . $html_block_id)) {				
				 
				$content =	isset($block['content'][$this->config->get('config_language_id')]) ? 
									$block['content'][$this->config->get('config_language_id')] : '';
				
				$html = html_entity_decode($content, ENT_QUOTES, 'UTF-8');
				
				return $html;
				
			}
				
		}

	}