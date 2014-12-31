<?php if ($records) { ?>
<nav class="dashboard-nav clearfix">
    <ul>
        <?php if (!$this->config->get('ControllerModuleCategory') && !$this->config->get('ControllerModuleFilterPro')) { ?>
        <li class="kat_act myNewPointer"><a id="menu_top">Категории товаров</a>
            <div class="left_navigation" id="top_menu_block"></div>
        </li>
        <?php } ?>
        <?php foreach ($records as $record) { ?>
        <li><a class="width_img" href="<?php echo $record['href']; ?>" title=""><?php echo $record['name']; ?></a></li>
        <?php } ?>
        <li><a class="cartStatus myPointer">Статус заказа</a></li>
        <li><a href="<?php echo $this->url->link('information/contact') ?>">Контакты</a></li>
    </ul>
</nav>
<?php } ?>
