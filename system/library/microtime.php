<?php
class Microtime {

	private $start = array();
	private $finish = array();
	private $counters = array();
	private $round = 2;
	
	function start($key) {
		$key = $this->key($key);
		$this->start[$key] = microtime(true);
	}
	
	function end($key) {
		$key = $this->key($key);
		$this->finish[$key] = microtime(true);
	}
	
	function result($key) {
		if (isset($this->finish[$key]) && isset($this->start[$key])) {
			$this->counters[$key] = $this->finish[$key] - $this->start[$key];
		} else {
			$this->counters[$key] = 'NaN';
		}
	}
	
	function results() {
		foreach ($this->start as $key => $value) {
			$this->result($key);
		}
	}
	
	function parse($string) {
		
		$key = array();
		$value = array();
		$this->results();

		foreach ($this->counters as $_key => $_value) {
			$key[] 		= $_key;
			$value[] 	= round($_value, $this->round);
		}
		
		if ($value && $key) {
			return str_replace($key, $value, $string);
		} else {
			return $string;
		}
		
	}
	
	function key($key) {
		return $key = 'microtime_'.$key;
	}
	
}