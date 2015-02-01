<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content">
<div>


  <div class="breadcrumb" xmlns:v="http://rdf.data-vocabulary.org/#">
    <?php $i=0; foreach ($breadcrumbs as $breadcrumb) { $i++; ?>
    <?php echo $breadcrumb['separator']; ?><?php if (count($breadcrumbs)!= $i) { ?><a href="<?php echo $breadcrumb['href']; ?>"><?php } ?><?php echo $breadcrumb['text']; ?><?php if (count($breadcrumbs)!=$i) { ?></a><?php } ?>
    <?php } ?>
  </div>
<?php echo $content_top; ?>
  <h1 class="marginbottom5"><?php echo $heading_title; ?></h1>
  </div>

<?php echo $content_bottom; ?>
</div>

<?php echo $footer; ?>