<?php echo $header; ?>
        <!-- CONTENT -->
        <div id="content">
                <div class="main_page_slider">
        <div class="slides_container">
                <div class="slide">
                        <div class="caption0">
                                <img src="catalog/view/theme/default/images/slides/slide2.jpg" alt="">
                        </div>
                        <div class="caption1">Cистемы видеонаблюдения</div>
                        <div class="caption2">
                            <p>Комплексные системы видеонаблюдения – это охрана, контроль и безопасность на базе передовых технологий. Вся совокупность аппаратных, технических и программных средств видеонаблюдения от традиционных до сетевых для бытового, производственного, общественного и корпоративного назначения. Готовые решения для широкого спектра задач. </p>     
                            <a href="sb-arsenal.ru/uslugi/oblachnoe-videonabljudenie/">Облачное видеонаблюдение</a>
                            <a href="<?php echo $this->url->link('information/information', 'information_id=' .  6);?>">Узнать больше</a>
                        </div>
                </div>
                <div class="slide">
                        <div class="caption0">
                                <img src="catalog/view/theme/default/images/slides/slide4.jpg" alt="">
                        </div>
                        <div class="caption1">Системы охраны имущества.</div>
                        <div class="caption2">
                            <p>Вся совокупность передовых решений по организации многоуровневых систем охраны имущества. Несколько рубежей защиты с оперативной передачей тревожных сигналов для незамедлительного реагирования. Охрана периметров, объектов, территорий, технологических процессов с тотальным контролем и абсолютной страховкой от возможных ЧП и действий злоумышленников. </p>    
                            <a href="<?php echo $this->url->link('information/information', 'information_id=' .  5);?>">Узнать больше</a>
                        </div>
                </div>
                <div class="slide">
                        <div class="caption0">
                                <img src="catalog/view/theme/default/images/slides/slide3.jpg" alt="">
                        </div>
                        <div class="caption1">Системы пожарной безопасности</div>
                        <div class="caption2">
                            <p>Системные средства и решения для организации высокотехнологичных систем пожарной безопасности на любом объекте и территории. Датчики-контролеры, сигнализация и системы оповещения, средства огнезащитной обработки и пожаротушения. Надежность работы аппаратно-программных технических средств гарантирует максимальную защиту и минимизацию негативных последствий. </p>   
                            <a href="<?php echo $this->url->link('information/information', 'information_id=' .  3);?>">Узнать больше</a>
                        </div>
                </div>
                <div class="slide">
                        <div class="caption0">
                                <img src="catalog/view/theme/default/images/slides/slide1.jpg" alt="">
                        </div>
                        <div class="caption1">Cистемы контроля доступа</div>
                        <div class="caption2">
                            <p>Комплексный подход, передовые решения, удобное и понятное управление. Вся совокупность необходимых средств для управления, контроля, идентификации, регистрации и ограничения доступа через определенную «точку прохода» с возможностями решения широкого спектра дополнительных задач и интеграции в общую систему безопасности или ее отдельные элементы. </p>     
                            <a href="<?php echo $this->url->link('information/information', 'information_id=' .  4);?>">Узнать больше</a>
                        </div>
                </div>
        </div>
</div>

<script>
        $(function(){
                $('.main_page_slider').slides({
                        preload: false,
                        play: 5000,
                        pause: 1500,
                        effect: 'fade',
                        crossfade: true,
                        fadeSpeed: 1000,
                        generateNextPrev: true,
                        hoverPause: true
                });
        });
</script><script type="text/javascript" src="catalog/view/theme/default/js/jquery.dotdotdot.js"></script>
<div class="usluga3_services">
        <div class="wrap">
        <div class="serv_title">
            Наши услуги
        </div>
        <div class="service_line_home"></div>
        <a href="<?php echo $this->url->link('information/information', 'information_id=' .  3);?>" class="serv_item serv_item1_home">
            <div class="title_pic title_home_img">
                <img src="catalog/view/theme/default/images/serv_fire.png" alt="">
            </div>
            <div class="serv_op">
                Системы пожарной безопасности
            </div>
            <div class="serv_cont">
                <div class="serv_cont_img">
                    <img src="catalog/view/theme/default/images/serv_pic2.jpg" alt="" class="grayscale">
                </div>
                <div class="serv_mask"></div>
                <div class="serv_cont_info">
                    Лицензированная деятельность по установке пожарных систем безопасности
                </div>
            </div>
        </a>
        <a href="<?php echo $this->url->link('information/information', 'information_id=' .  6);?>" class="serv_item serv_item2">
            <div class="title_pic">
                <img src="catalog/view/theme/default/images/serv_cam.png" alt="">
            </div>
            <div class="serv_op">
                Системы видеонаблюдения
            </div>
            <div class="serv_cont">
                <div class="serv_cont_img">
                    <img src="catalog/view/theme/default/images/serv_pic1.jpg" alt="">
                </div>
                <div class="serv_mask"></div>
                <div class="serv_cont_info">
                    Профессиональный подбор, проектирование и монтаж систем видеонаблюдения
                </div>
            </div>
        </a>
        <a href="<?php echo $this->url->link('information/information', 'information_id=' .  5);?>" class="serv_item serv_item3">
            <div class="title_pic">
                <img src="catalog/view/theme/default/images/serv_close.png" alt="">
            </div>
            <div class="serv_op">
                Системы охраны имущества
            </div>
            <div class="serv_cont">
                <div class="serv_cont_img">
                    <img src="catalog/view/theme/default/images/serv_pic3.jpg" alt="">
                </div>
                <div class="serv_mask"></div>
                <div class="serv_cont_info">
                    Современные методы решения охраны имущества системами безопасности
                </div>
            </div>
        </a>
        <a href="<?php echo $this->url->link('information/information', 'information_id=' .  4);?>" class="serv_item serv_item4">
            <div class="title_pic">
                <img src="catalog/view/theme/default/images/serv_img.png" alt="">
            </div>
            <div class="serv_op">
                Системы управления доступом
            </div>
            <div class="serv_cont">
                <div class="serv_cont_img">
                    <img src="catalog/view/theme/default/images/serv_pic4.jpg" alt="">
                </div>
                <div class="serv_mask"></div>
                <div class="serv_cont_info">
                    Удобные и понятные системы контроля и управления доступом
                </div>
            </div>
        </a>
        <div class="clr"></div>
        </div>
</div>
<script type="text/javascript">
    $(function() {
        $('.serv_cont_info').dotdotdot();
                $("a[rel=example_group]").fancybox({
                                'transitionIn'          : 'none',
                                'transitionOut'         : 'none',
                                'titlePosition'         : 'over'
                        });

    });
</script>
<section class="we">
<div class="why_we">
        <div class="wrap">
                <div class="why_we_h2">
                        <h2>
                                Почему мы?
                        </h2>
                </div>
                <div class="why_we_text1">
                        <div class="why_we_bigtext why_we_bigtext1">
                                <span class="text_24">
                                        На рынке более
                                </span>
                                <span class="text_60 t1">
                                        10 лет
                                </span>
                        </div>
                        <span class="why_we_lowtext">
                                Мы отлично разбираемся в своем деле и предлагаем только рабочие решения
                        </span>
                        <div class="clr">
                                
                        </div>
                </div>
                <div class="why_we_text2">
                        <div class="why_we_bigtext why_we_bigtext2">
                                <span class="text_30">
                                        Более
                                </span>
                                <span class="text_72 t2">
                                        2000
                                </span>
                                <span class="text_18">
                                        выполненых
                                </span>
                                <span class="text_24">
                                        объектов
                                </span>
                        </div>
                        <span class="why_we_lowtext">
                                Налаженные бизнес-процессы позволяют создавать решения систем безопасности быстро, качественно и в срок
                        </span>
                        <div class="clr">
                                
                        </div>
                </div>
                <div class="why_we_text3">
                        <div class="why_we_bigtext why_we_bigtext3">
                                <span class="text_24">
                                        Большой
                                </span>
                                <span class="text_48 t3">
                                        штат
                                </span>
                                <span class="text_23">
                                        своих тех.
                                </span>
                                <span class="text_16">
                                        специалистов
                                </span>
                        </div>
                        <span class="why_we_lowtext">
                                Вам не придется ждать и мы не затягиваем сроки
                        </span>
                        <div class="clr">
                                
                        </div>
                </div>
                <div class="why_we_text1">
                        <div class="why_we_bigtext why_we_bigtext1">
                                <span class="text_40">
                                        Гарантия
                                </span>
                                <span class="text_24 t4">
                                        на монтаж и
                                </span>
                                <span class="text_24">
                                        оборудование
                                </span>
                        </div>
                        <span class="why_we_lowtext">
                                Мы даем гарантию на выполненные работы и оборудование
                        </span>
                        <div class="clr">
                                
                        </div>
                </div>
                <div class="why_we_text2">
                        <div class="why_we_bigtext why_we_bigtext2">
                                <span class="text_34">
                                        Низкие
                                </span>
                                <span class="text_48 t5">
                                        цены
                                </span>
                        </div>
                        <span class="why_we_lowtext">
                                Являясь дилерами основных крупных производителей систем безопасности, мы можем предлагать самые низкие цены
                        </span>
                        <div class="clr">
                                
                        </div>
                </div>
                <div class="why_we_text3">
                        <div class="why_we_bigtext why_we_bigtext3">
                                <span class="text_18">
                                        Оборудование
                                </span>
                                <span class="text_40 t6">
                                        Всегда
                                </span>
                                <span class="text_23">
                                        в наличии
                                </span>
                        </div>
                        <span class="why_we_lowtext">
                                Большой собственный склад позволяет оперативно выполнять самые требовательные задачи
                        </span>
                        <div class="clr">
                                
                        </div>
                </div>
                <div class="clr">
                        
                </div>
                <div class="form">
                        <h2>
                                Есть вопросы?
                        </h2>
                        <h2>
                                Мы вам позвоним!
                        </h2>
                        <form class="form_phone" method="POST" onsubmit="yaCounter20762257.reachGoal('homePage_callback'); return true;">
                                <input type="text" placeholder="Ваше имя" name="name"/>
                                <input type="text" placeholder="Контактный телефон" name="phone" id="user_phone3" />
                                <input type="hidden" value="Заказ обратного звонка" name="subject" />
                                <input type="button" class="btn_form" value="Заказать обратный звонок" id="form_phone"/>
                        </form>
                </div>
                <div class="ppl1">
                        <img src="catalog/view/theme/default/images/why_we_ppl1.png" alt="image" />
                </div>
                <div class="clr">
                
                </div>
        </div>
</div>
        <div class="why_we2">
                <div class="wrap">
                        <div class="ppl2">
                                <img src="catalog/view/theme/default/images/why_we_ppl2.png" alt="image" />
                        </div>
                        <div class="why_we_cam">
                                
                        </div>
                        <div class="why_we_numbers">
                                <div class="why_we_one">
                                        <p>
                                                Абсолютно бесплатно выезжаем на ваш объект
                                        </p>
                                </div>
                                <div class="why_we_two">
                                        <p>
                                                Подбираем оборудование, проектируем, предлагаем решение
                                        </p>
                                </div>
                                <div class="why_we_three">
                                        <p>
                                                Монтируем и сдаем объект
                                        </p>
                                </div>
                        </div>
                </div>
        </div>
</section>
<section class="otzuvu">
        <div class="wrap">
                <h2>
                        Отзывы наших клиентов
                </h2>
                <div class="otz_otz ot1">
                        <div class="us_im">
                                <img src="catalog/view/theme/default/images/leonid.jpeg" alt="image" />
                        </div>
                        <span class="ot_name">
                                Леонид Жданов

                        </span>
                        <p>
                                Сотрудничаем уже несколько лет. Все мои магазины оборудованы системами видеонаблюдения и сигнализации силами компании "ТД Арсенал". Я всегда доволен качеством, ценой и сроками работ. Молодцы! 
                        </p>

                </div>
                <div class="otz_otz ">
                        <div class="us_im">
                            <img src="catalog/view/theme/default/images/r.jpeg" alt="image" />
                                
                        </div>
                        <span class="ot_name">
                                Роман Мухонько

                        </span>
                        <p>
                                Оборудовали большой торговый центр, "Арсенал" выступал суб-подрядчиком. Не смотря на перебои с поставкой оборудования с нашей стороны, специалисты Арсенала  закончили работу в срок. Очень доволен сотрудничеством. 
                        </p>
                </div>
                <div class="otz_otz ot2">
                        <div class="us_im">
                                <img src="catalog/view/theme/default/images/d.jpg" alt="image" />
                        </div>
                        <span class="ot_name">
                                Дарья Селикова

                        </span>
                        <p>
                                Выражаю благодарность компании Арсенал за профессионализм, качество выполненных работ и вообще за интересный, профессиональный подход к проектированию и установке систем безопасности
                        </p>
                </div>
                <div class="otz_otz">
                        <div class="us_im">
                                <img src="catalog/view/theme/default/images/r2.jpeg" alt="image" />
                        </div>
                        <span class="ot_name">
                                Роман Доля

                        </span>
                        <p>
                                Рекомендую "Торговый Дом Арсенал" как ответственных, знающих свое дело профессионалов. ТД Арсенал выступает уже несколько лет стабильным партнером по поставкам оборудования нам, мы инсталляторы систем видеонаблюдения и ОПС. Все отлично.
                        </p>
                </div>

                <div class="clr">
                        
                </div>
                
                
        </div>
</section>
<section class="sertif">
        <div class="wrap">
                <h2>
                        Сертификаты и награды
                </h2>
                <?php echo $content_top; ?>
                
                <div class="sert_men">
                        <!--<img src="catalog/view/theme/default/images/sert_men.png" alt="image" />-->
                </div>
               
                <?php echo $column_left;?>
                
                
                <?php echo $content_bottom; ?>
                <div class="clr">
                        
                </div>
        </div>
        
</section>

<section class="newsblog main-news-widget">
                <div class="wrap">
                <h2>
                        Новости и информация
                </h2>
                        <div class='news_main'>
                                <?php echo $news_and_blog; ?>
                        </div>
                        
                        <div class='blog_main'>
                                <?php echo $news_and_blog_two; ?>
                        </div>

                <div class="clr">
                        
                </div>
                                </div>
</section>

<section class="feedback call_us">
        <div class="wrap clearfix">
                <h2>Свяжитесь с нами</h2>
                <span class="call_sp"> и мы вам поможем!</span>
                <div class="call_men">
                        <img src="catalog/view/theme/default/images/call_men.png" alt="image" />
                </div>
                <div class="left">
                        <div class="note n1">Мы работаем: ежедневно  с 9:00 до 18:00 без перерывов и выходных</div>
                        <div class="info_5">
                                <div class="phone">8 (8634) 611-958, 8 (8634)  431-132</div>
                                <div class="mail"><script type="text/javascript">eval(unescape('%64%6f%63%75%6d%65%6e%74%2e%77%72%69%74%65%28%27%3c%61%20%68%72%65%66%3d%22%6d%61%69%6c%74%6f%3a%73%61%6c%65%73%40%73%62%2d%61%72%73%65%6e%61%6c%2e%72%75%22%3e%73%61%6c%65%73%40%73%62%2d%61%72%73%65%6e%61%6c%2e%72%75%3c%2f%61%3e%27%29%3b'))</script></div>
                                <div class="icq">647 727 706</div>
                                <div class="skype">sb-arsenal</div>
                                <div class="location">г. Таганрог, пер Комсомольский д. 14</div>
                        </div>
                        <a href="#" class="btn_form show_popup">Заказать обратный звонок</a>
                </div>
                <div class="right">
                        <div class="note">Если Вы не смогли найти ответов на какие-либо интересующие Вас вопросы, мы предлагаем Вам связаться с нами по телефону или воспользуйтесь формой обратной связи.</div>
                        <form class="form_contacts" method="POST" onsubmit="yaCounter20762257.reachGoal('send_form_2'); return true;">
                                <input type="text" placeholder="Ваше имя" name="name"/>
                                <input type="text" placeholder="E-mail" name="mail"/>
                                <input type="text" placeholder="Телефон" name="phone" id="user_phone"/>
                                <textarea placeholder="Комментарий" name="comment"></textarea>
                                <input type="button" value="Отправить" id="form_callback" class="btn_form"/>
                        </form>
                </div>
        </div>
</section>            <div class="clr"></div>        
        </div><!-- end CONTENT -->
 <?php echo $footer; ?>  
   
  