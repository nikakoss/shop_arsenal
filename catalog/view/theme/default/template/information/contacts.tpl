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
</section><section class="contacts_us">
  <div class="wrap">

    <div class="contacts_left">
      <div class="we_work">Мы работаем: ежедневно  с 9:00 до 18:00 без перерывов и выходных</div>
<?php echo $column_left; ?>

      <a href="#" class="btn_form show_popup">Заказать обратный звонок</a>
	

<div class="map_bg_l">
        <div>г. Ростов-на-дону, проспект Шолохова д.9</div>
        <script type="text/javascript" charset="utf-8" src="//api-maps.yandex.ru/services/constructor/1.0/js/?sid=LxsOcP12_OQ7gTs_8l83LGfKIZuyEKom&width=450&height=350"></script>
        </div> 
		
      <div class="note">Если Вы не смогли найти ответов на какие-либо интересующие Вас вопросы, мы предлагаем Вам связаться с нами по телефону или воспользуйтесь формой обратной связи.</div>

      <form class="form_contacts" method="POST">
        <input type="text" placeholder="Ваше имя" name="name"/>
        <input type="text" placeholder="E-mail" name="mail" id="zq"/>
        <input type="hidden" value="Запрос с формы контактов" name="subject" />
        <!--<label for="zq" style="color: red">*</label>-->
        <input type="text" placeholder="Телефон" name="phone" id="user_phone"/>
        <textarea placeholder="Комментарий" name="comment" id="zx"></textarea>
        <!--<label for="zx" style="color: red">*</label> -->
        <input type="button" value="Отправить" id="sendContacts"  class="btn_form"/>
      </form>	
    </div>

    <div class="contacts_right">
    
    <div class="cut_b">
      <div class="contact_us_title">Свяжитесь с нами</div>
      <div class="cut_blue">и мы вам поможем!</div> 
    </div>

      <div class="loc_map_cont">
        <div class="map_bg_l"></div>
        <div class="map_bg_r"></div>
        <div id="map"></div>
      </div>

      
        <div class="map_bg_r">
        <div style="color:000">г. Таганрог, пер Комсомольский д. 14</div>
        <script type="text/javascript" charset="utf-8" src="//api-maps.yandex.ru/services/constructor/1.0/js/?sid=npweopSMlzimzEtRRgSvStntu9YJgjpk&width=470&height=350"></script>
        </div>
               
      <div class="single_team_c">
        <img class="margin-5" src="/catalog/view/theme/default/images/single_team_c.png" alt="image">
      </div>

      <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
      <script src="/catalog/view/theme/default/js/contacts_map.js"></script>
      <script src="/catalog/view/javascript/common.js"></script>
      
    </div>
   
   <div class="clr"></div>
  </div>
</section>            <div class="clr"></div>        
        </div><!-- end CONTENT -->
        <?php echo $footer; ?>