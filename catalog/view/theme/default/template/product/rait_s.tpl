<?php foreach ($reviews as $review) { ?>
<div class="reyt">
    Рейтинг: 
    <span>
        <img class="rait_cl" src="catalog/view/theme/default/image/stars-<?php echo $review['rait_s'] . '.png'; ?>" alt="<?php echo $review['reviews']; ?>" />
    </span>
</div>
<div class="reviews">
    <a href="#">Отзывы</a> (<?=$review['total']?>)
</div>
<?php } ?>