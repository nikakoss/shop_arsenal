<?php if ($records) { ?>
<section class="usluga3_articles">
        <div class="wrap">
            <h2>
                более подробно
            </h2>
<?php foreach ($records as $record) { ?>
<a href="<?php echo $record['href']; ?>"  class="article_one">
    <?php if ($record['thumb']) { ?>
    <div class="artic_img">
        <img alt="<?php echo $record['name']; ?>" title="<?php echo $record['name']; ?>" src="<?php echo $record['thumb']; ?>">
    </div>
    <?php } ?>
    <span>
        <?php echo $record['name']; ?>
    </span>
</a>
<?php } ?>

<div class="clr"></div>
        </div>
    </section>
<?php } ?>



