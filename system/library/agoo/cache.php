<?php
class agooCache
{
	private $expire = 36000;
	public function get($key)
	{
		error_reporting(0);
		set_error_handler('agoo_error_handler');

		$files = glob(DIR_CACHE . 'cache.' . preg_replace('/[^A-Z0-9\._-]/i', '', $key) . '.*');
		if ($files) {
			if (is_file($files[0]) && file_exists($files[0])) {
				$cache = file_get_contents($files[0]);
				$data  = unserialize($cache);
			} //file_exists($files[0])
			else {
				$data = false;
			}
			foreach ($files as $file) {
				$time = substr(strrchr($file, '.'), 1);
				if ($time < time()) {
					if (is_file($file) && file_exists($file)) {
						clearstatcache();
						@unlink($file);
						clearstatcache();
						//clearstatcache(TRUE, $file);
					} //file_exists($file)
				} //$time < time()
			} //$files as $file

			restore_error_handler();
			error_reporting(E_ALL);

			return $data;
		} //$files
	}
	public function set_expire($value)
	{
		$this->expire = $value;
	}
	public function get_expire()
	{
		return $this->expire;
	}
	public function set($key, $value)
	{
		

		$this->delete($key);
		$file   = DIR_CACHE . 'cache.' . preg_replace('/[^A-Z0-9\._-]/i', '', $key) . '.' . (time() + $this->expire);
		$handle = fopen($file, 'w');
		fwrite($handle, serialize($value));
		fclose($handle);
	}
	public function delete($key)
	{
		error_reporting(0);
		set_error_handler('agoo_error_handler');
		$files = glob(DIR_CACHE . 'cache.' . preg_replace('/[^A-Z0-9\._-]/i', '', $key) . '.*');
		if ($files) {
			foreach ($files as $file) {
				if (is_file($file) && file_exists($file)) {
					clearstatcache();
					@unlink($file);
					clearstatcache();
					//clearstatcache(TRUE, $file);
				} //file_exists($file)
			}

		} //$files
			restore_error_handler();
			error_reporting(E_ALL);
	}
}
if (!function_exists('agoo_error_handler')) {
	function agoo_error_handler($errno, $errstr)
	{
	}
}


?>