<div class="best-offers">
    <h2><?php echo $heading_title; ?></h2>
    <div class="best-offers-content">
        <?php foreach ($products as $product) { ?>              
        <div class="clearfix">
            <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
            <div>
                <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                <strong>Цена:
                    <?php if (!$product['special']) { ?>
                    <span><?php echo $product['price']; ?><?php if(!empty($product['unit'])) { ?> за <?php echo $product['unit']; ?>.<?php } ?></span>
                    <?php } else { ?>
                    <span><?php echo $product['price']; ?></span> <span><?php echo $product['special']; ?><?php if(!empty($product['unit'])) { ?> за <?php echo $product['unit']; ?>.<?php } ?></span>
                    <?php } ?>
                </strong>                    
            </div>
        </div>
        <?php } ?>
    </div>
</div>
