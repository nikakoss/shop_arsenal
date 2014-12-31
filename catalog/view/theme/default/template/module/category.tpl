<div class="left_navigation">
    <div class="kategory">Категории товаров</div>
    <ul id="menu-container" class="box-category">
        <?php foreach ($categories as $category) { ?>
        <li category-id="<?php echo $category['category_id']; ?>">
            <?php if ($category['category_id'] == $category_id) { ?>
             <a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a>
            <?php } else { ?>
               <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
            <?php } ?>
            <?php if ($category['children']) { ?>
            <ul>
                <?php foreach ($category['children'] as $child) { ?>
                <li>
                    <?php if ($child['category_id'] == $child_id) { ?>
                  <a href="<?php echo $child['href']; ?>" class="active"> - <?php echo $child['name']; ?></a>
                    <?php } else { ?>
                   <a href="<?php echo $child['href']; ?>"> - <?php echo $child['name']; ?></a>
                    <?php } ?>
                </li>
                <?php } ?>
            </ul> 
            <?php } ?>
        </li>
        <?php } ?>
    </ul>
</div><!-- .left_navigation -->
<script>
$(document).ready(function () {
	if($('div').hasClass('error404')){
	$('.error404 .dashboard-nav, .main section.clearfix article.clearfix').hide();
	}
})
</script>
