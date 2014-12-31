    <?php foreach ($products as $product) { ?>
		<?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/product_list.tpl'); ?>
    <?php } ?>