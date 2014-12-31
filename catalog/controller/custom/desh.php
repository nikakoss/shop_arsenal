<?php
class ControllerCustomDesh extends Controller{
    public function index(){
$template="default/template/custom/desh.tpl"; // .tpl location and file

// $this->load->model('custom/recall.php');
$this->template = ''.$template.'';
$this->children = array(
'common/header',
'common/content_top',
'common/column_left',
'common/column_right',
'common/content_bottom',
'common/footer'
);
$this->response->setOutput($this->render());
}
}
?>
