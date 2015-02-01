<?php echo $header; ?>
<!-- CONTENT -->
<div id="content"><section class="bread_crumps">
        <div class="wrap">
            
            <nav xmlns:v="http://rdf.data-vocabulary.org/#">
                <?php $i=0; foreach ($breadcrumbs as $breadcrumb) { $i++; ?>
                <?php echo $breadcrumb['separator']; ?>
                <?php if (count($breadcrumbs)!= $i) { ?>
                <span typeof="v:Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" rel="v:url" property="v:title"><?php } ?>                        
                        <?php if (count($breadcrumbs)==$i) { ?>
                        <span typeof="v:Breadcrumb"><span property="v:title"><?php echo $breadcrumb['text']; ?></span></span>
                        <?php }else{ ?>
                        <?php echo $breadcrumb['text']; ?>
                        <?php } ?>
                        <?php if (count($breadcrumbs)!=$i) { ?>
                    </a></span><?php } ?>
                <?php } ?>            
            </nav>
			<h1><?php echo $heading_title; ?></h1>
        </div>
    </section><section class="news">
        <div class="wrap">
			
			<div class="all_articles blogg fix-news">
                <?php if ($records) { ?>
                <?php foreach ($records as $record) { ?>
                <div class="article">
                    <?php if ($record['thumb']) { ?>
                    <div class="img_article">
                        <img src="<?php echo $record['thumb']; ?>" title="<?php echo $record['name']; ?>" alt="<?php echo $record['name']; ?>">
                    </div>
                    <?php } ?>
                    <div class="text_article correct">
                        <a href="<?php echo $record['href']; ?>" class="article_title"><?php echo $record['name']; ?></a>
                            <?php if (isset ($record['settings_blog']['view_date']) && $record['settings_blog']['view_date'] ) { ?>
      <?php if ($record['date_available']) { ?>
        <div class="date_new"><?php echo $record['date_available']; ?></div>
      <?php } ?>
    <?php } ?>
                        
                        
                        <?php echo $record['description']; ?>
                        <a href="<?php echo $record['href']; ?>" class="read_more btn_form">Подробнее</a>
                    </div>
                    <div class="clr"></div>
                </div>
                <?php } ?>
                <?php } ?>
            </div>

			

			
            <div class="clr"></div>
        </div>
    </section>
    
    <?php if ($records) { ?>    
    <section class="pagination_page">
        <?php echo $pagination; ?>
    </section>  
     <?php } ?>
	 
    <div class="clr"></div>        
</div><!-- end CONTENT -->
<?php echo $footer; ?>