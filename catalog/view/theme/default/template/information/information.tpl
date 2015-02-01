<?php echo $header; ?>
<!-- CONTENT -->
	<div id="content"><section class="bread_crumps">
	<div class="wrap">
		
		<nav xmlns:v="http://rdf.data-vocabulary.org/#">
                    <?php  $count=1; foreach ($breadcrumbs as $breadcrumb) { 
                    if(sizeof($breadcrumbs)==$count){ ?>
                    <?php echo $breadcrumb['separator']; ?><span typeof="v:Breadcrumb"><span property="v:title"><?php echo $breadcrumb['text']; ?></span></span>
                   <?php }else{?>
                   <?php echo $breadcrumb['separator']; ?><span typeof="v:Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" rel="v:url" property="v:title"><?php echo $breadcrumb['text']; ?></a></span>
                    <?php } $count++; } ?>
		</nav>
		<h1><?php echo $heading_title; ?></h1>
	</div>
</section><section class="news_page">
  	<div class="news_wrap">
  		<div class="wrap">
                    <div class="text">
  			<?php echo $description; ?>
		</div>
		</div>
  	</div>

  	
</section>            <div class="clr"></div>        
        </div><!-- end CONTENT -->
<?php echo $footer; ?>