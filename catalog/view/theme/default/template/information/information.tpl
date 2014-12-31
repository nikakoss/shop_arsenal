<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
    <div class="line_razd"></div>
    <h1><?php echo $heading_title; ?></h1>

    <ul class="bread_crumbs clearfix">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li>
            <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        </li>
        <?php } ?>   
    </ul>
  <div class="line_razd_2"></div>
  <div class="content_text clearfix">
  <?php echo $description; ?>  
  </div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>