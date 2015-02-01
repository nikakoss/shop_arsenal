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
			<div class="blogg">
                    <?php if (isset ($settings_blog['view_date']) && $settings_blog['view_date'] ) { ?>
                        <div class="date"><?php echo $date_added; ?></div>
	     <?php } ?>
  			
                        <?php echo $description; ?>
				</div>
				<div class="rubric">
						<?php echo $column_news_blog; ?>
				</div>
						<section class="usluga3_form">
							<div class="wrap clearfix">
								<div class="left">									
									<?php 
									echo $column_left; ?>
									<a href="#" class="btn_form show_popup">Заказать обратный звонок</a>
								</div>
								<div class="right">
									<div class="note">Если Вы не смогли найти ответов на какие-либо интересующие Вас вопросы, мы предлагаем Вам связаться с нами по телефону, и мы с удовольствием ответим Вам, или воспользуйтесь формой обратной связи.</div>
									<form class="form_contacts" method="POST">
										<input type="text" placeholder="Ваше имя" value="" name="name"/>
										<input type="text" placeholder="E-mail" value="" name="mail"/>
										<input type="text" placeholder="Телефон" value="" name="phone" id="user_phone4"/>
										<input type="hidden" value=" Запрос с формы контактов" name="subject" />
										<textarea placeholder="Комментарий" name="comment" ></textarea>
										<input type="button" value="Отправить" id="sendUsluga"  class="btn_form"/>
									</form>
									</div>
								<div class="clr"></div>
								<div class="bot_line"></div>
							</div>
						</section>
                        <div class="social_like">
  <?php if (isset ($settings_blog['view_share']) && $settings_blog['view_share'] ) { ?>
<div class="share floatleft"><!-- AddThis Button BEGIN -->





  <div  class="addthis_toolbox addthis_default_style floatleft">
          <a class="addthis_button_facebook"></a>
          <a class="addthis_button_vk"></a>
          <a class="addthis_button_odnoklassniki_ru"></a>
          <a class="addthis_button_youtube"></a>
          <a class="addthis_button_twitter"></a>
          <a class="addthis_button_email"></a>
          <a class="addthis_button_compact"></a>
          </div>

          <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js"></script>
          <!-- AddThis Button END -->
        </div> <br>
 <?php } ?>
 

 
        </div>
		</div>
  	</div>

  	<div class="wrap">
  	
		
            
            
		
                              <?php if ($comment_status) {
            $h=end($breadcrumbs);
            $href=$h['href'];
            ?>
            
                <?php if ($comment_status) { ?>
                <div id="tab-review" class="tab-content">
                </div>
                <?php } ?>

            <?php } ?>
            
	  	<?php echo $content_bottom; ?>	   
                        
		
	</div>
</section>            <div class="clr"></div>        
        </div><!-- end CONTENT -->
<?php echo $footer; ?>