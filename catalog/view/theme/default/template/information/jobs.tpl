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
</section><script>
	$(document).ready(function(){

		$('.faq_box_btn').toggle(function(){
			$(this).addClass('opened');
			$(this).children('.upper').text('Свернуть')
			$(this).siblings().slideDown();
		},
		function(){
			$(this).removeClass('opened');
			$(this).children('.upper').text('Развернуть')
			$(this).siblings().slideUp();
		}
		);

	});
</script>

<section class="faq">
	<div class="wrap">
		<div class="text">
			<?php echo $description; ?>
		</div>
            
            <?php echo $content_top; ?>
            
	</div>
</section><section class="feedback">
	<div class="wrap clearfix">
		<div class="left">
			<a href="#" class="btn_form show_popup">Заказать обратный звонок</a>
		</div>
		<div class="right">
			<div class="note">Если Вы не смогли найти ответов на какие-либо интересующие Вас вопросы, мы предлагаем Вам связаться с нами по телефону, и мы с удовольствием ответим Вам, или воспользуйтесь формой обратной связи.</div>
			<form class="form_contacts" method="POST">
                            <input type="text" placeholder="Ваше имя" name="name"/>
                            <input type="text" placeholder="E-mail" name="mail"/>
                            <input type="text" placeholder="Телефон" name="phone" id="user_phone6"/>
                            <textarea placeholder="Комментарий" name="comment"></textarea>
                            <input type="button" value="Отправить" id="sendJobs"  class="btn_form"/>
                        </form>
		</div>
	</div>
</section>            <div class="clr"></div>        
        </div><!-- end CONTENT -->
<?php echo $footer; ?>