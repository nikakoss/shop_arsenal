<?php echo $header; ?>
<!-- CONTENT -->
        <div id="content"><section class="bread_crumps">
        <div class="wrap">
                <h1><?php echo $heading_title; ?></h1>
                <nav xmlns:v="http://rdf.data-vocabulary.org/#">
                    <?php  $count=1; foreach ($breadcrumbs as $breadcrumb) { 
                    if(sizeof($breadcrumbs)==$count){ ?>
                    <?php echo $breadcrumb['separator']; ?><span typeof="v:Breadcrumb"><span property="v:title"><?php echo $breadcrumb['text']; ?></span></span>
                   <?php }else{?>
                   <?php echo $breadcrumb['separator']; ?><span typeof="v:Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" rel="v:url" property="v:title"><?php echo $breadcrumb['text']; ?></a></span>
                    <?php } $count++; } ?>
                </nav>
        </div>
</section><div class="pic_block">
        <div class="pic_wrap">
                <img src="catalog/view/theme/default/images/slides/slide2.png" alt="">
        </div>
        <div class="pic_info">
                <div class="pic_title">Системы охраны имущества</div>
                <div class="pic_descrip">
                        <p>Совокупность программно-аппаратных технических средств безопасности, имеющих целью ограничение и регистрацию входа-выхода объектов на заданной территории через «точки прохода»: двери, ворота, КПП.</p>
                        <p>Основная задача - управление доступом на заданную территорию. Кого пускать, в какое время и на какую территорию</p>
                </div>
        </div>
        
</div>
<script src="catalog/view/theme/default/js/base.js"></script>
<script src="catalog/view/theme/default/js/flipclock.js"></script>
<script src="catalog/view/theme/default/js/dailycounter.js"></script>
<section class="time_count">
        <div class="wrap">
        <h2 class="time_title">
                Позвоните сейчас и получи скидку на оборудование видеонаблюдения!
        </h2>
        <div class="time_last">
                до конца акции Осталость
        </div>
        <div class="clock_wrap">
                <div class="clock" ></div>
                <div class="clr"></div>
                <div class="clock_day">
                        дни
                </div>
                <div class="clock_hour">
                        часы
                </div>
                <div class="clock_minute">
                        минуты
                </div>
                <div class="clock_seconds">
                        секунды
                </div>
                <div class="clr"></div>
        </div>
        <div class="clr"></div>
        <a href="#" class="time_c_button btn_form" onclick="yaCounter20762257.reachGoal('order_service_1'); return true;">
                Заказать услугу
        </a>
        <div class="clr"></div>
        <div class="bot_line"></div>
        <script type="text/javascript"> 
                        var my_datal = new Date().getTime();
                        var my_data3 = new Date("April 15, 2014 13:54:00").getTime();
                        time = my_data3 - my_datal;
                        // alert(my_datal);
                        // alert(my_data3);
                        // alert(time);
                        var clock = $('.clock').FlipClock(time/1000, {
                                clockFace: 'DailyCounter',
                                countdown: true
                        });
                </script>
        </div>
</section><section class="usluga3_info">
        <div class="wrap">
                <p>
                        Студент Мидлсекского университета разработал систему безопасности в виде человеческого глаза. Система позволяет распознавать лица, различные объекты и <a href="#">своим внешним видом может оказать психологическое влияние на преступниvков.</a> Имя новому устройству - Sentient , в переводе - "ощущающий".
                </p>
                <div class="info_attacker">
                        <div class="attacker_acts">
                                <h2>
                                        Узнайте, как действуют злоумышленники <br> и как обезопасить себя, сохранив свою личную информацию и деньги.
                                </h2>
                                <div class="security_item s_item_1">
                                        <div class="si_title">
                                                Охраняет частную собственность и прилегающие территории
                                        </div>
                                        <div class="si_info">
                                                Зашита и охрана собственности является одной из важнейших задач любого государства и права.
                                        </div>
                                        <div class="clr"></div>
                                </div>
                                <div class="security_item s_item_2">
                                        <div class="si_title">
                                                Следит за вашими сотрудниками
                                        </div>
                                        <div class="si_info">
                                                Владельцам небольших организаций экономически сложнее оборудовать свой офис системой безопасности, чем крупным бизнесменам.
                                        </div>
                                        <div class="clr"></div>
                                </div>
                                <div class="security_item s_item_3">
                                        <div class="si_title">
                                                Контролирует технологические процессы и работу сложного оборудования
                                        </div>
                                        <div class="si_info">
                                                Представляет из себя систему планирования и управления всем предприятием. Благодаря разнообразным формам отчетов вы можете планировать работу предприятия, опираясь на точные, проверенные данные.
                                        </div>
                                        <div class="clr"></div>
                                </div>
                                <div class="security_item s_item_4">
                                        <div class="si_title">
                                                Осуществляет видеоконтроль опасных объектов
                                        </div>
                                        <div class="si_info">
                                                Камеры устанавливают по всему периметру здания. Внутри школы на мониторе за уличной обстановкой следит охрана. 
                                        </div>
                                        <div class="clr"></div>
                                </div>
                                <div class="security_item s_item_5">
                                        <div class="si_title">
                                                Обеспечивает безопасность дорожного движения
                                        </div>
                                        <div class="si_info">
                                                В новой редакции закона особое внимание уделяется правам и обязанностям участников дорожного движения.
                                        </div>
                                        <div class="clr"></div>
                                </div>
                                <div class="security_item s_item_6">
                                        <div class="si_title">
                                                Заботится о ваших близких
                                        </div>
                                        <div class="si_info">
                                                Прочная, недорогая, почти незаметная для глаз антимоскитная сетка позволит Вам наслаждаться свежим воздухом.
                                        </div>
                                        <div class="clr"></div>
                                </div>
                        </div>
                        <div class="security_system">
                                <div class="secur_cam">
                                        <span>
                                                Система безопасности в виде человеческого глаза
                                        </span>
                                </div>
                                <div class="ss_inform">
                                        <span>
                                                Имя новому устройству - Sentient , в переводе - "ощущающий". В центре «глаза» расположен объектив видеокамеры, вокруг которого светодиоды создают желтую "радужную оболочку". Сверху и снизу разместились подвижные «веки». При обнажурении движения, "радужка" становится красной.
                                        </span>
                                        <span class="ss_important">
                                                Кёртис Джон считает, что новинка может оказывать сильное психологическое давления на злоумышленников, уменьшая при этом риск совершения правонарушения. 
                                        </span>
                                        <span>
                                                Представьте себе, что в темном помещении внезапно "оживает" глаз, вокруг которого вращаются желтые светодиоды, затем останавливается "взглядом" на Вас, меняя цвет диодов на красный .
                                        </span>
                                </div>
                        </div>
                        <div class="clr"></div>
                </div>
                <div class="your_sequrity">
                        <div class="ys_title">
                                Ваше имущество всегда <span>в безопасности!</span>
                        </div>
                        <div class="ys_photo">
                                <img src="catalog/view/theme/default/images/usluga3_cam.png" alt="">
                        </div>
                </div>
        </div>
</section><section class="usluga3_form">
        <div class="wrap clearfix">
                <div class="left">
                        <div class="info_5">
                                <div class="phone">8 (8634) 611-958, 8 (8634)  431-132</div>
                                <div class="mail">sales@sb-arsenal.ru</div>
                                <div class="icq">647 727 706</div>
                                <div class="skype">sb-arsenal</div>
                                <div class="location">г. Таганрог, пер Комсомольский д. 14</div>
                        </div>
                        <a href="#" class="btn_form" onclick="yaCounter20762257.reachGoal('get_callback_1'); return true;">Заказать обратный звонок</a>
                        <div class="social_block">
                                <img src="catalog/view/theme/default/images/social.png" alt="">
                        </div>
                </div>
                <div class="right">
                        <div class="note">Если Вы не смогли найти ответов на какие-либо интересующие Вас вопросы, мы предлагаем Вам связаться с нами по телефону, и мы с удовольствием ответим Вам, или воспользуйтесь формой обратной связи.</div>
                <form class="form_contacts" method="POST">
                        <input type="text" placeholder="Ваше имя" value="" name="name"/>
                        <input type="text" placeholder="E-mail" value="" name="mail"/>
                        <input type="text" placeholder="Телефон" value="" name="phone" id="user_phone4"/>
                        <textarea placeholder="Комментарий" name="comment" ></textarea>
                        <input type="button" value="Отправить" id="sendUsluga"  class="btn_form"/>
                </form>
                </div>
                <div class="clr"></div>
        <div class="bot_line"></div>
        </div>
</section><section class="usluga3_articles">
        <div class="wrap">
                <h2>
                        Статьи и материалы
                </h2>
                <a href="#"  class="article_one">                       
                        <div class="artic_img">
                                <img src="catalog/view/theme/default/images/article1.png" alt="">
                        </div>
                        <span>
                                Монтаж и проектирование видеонаблюдения
                        </span>
                </a>
                <a href="#"  class="article_one">                       
                        <div class="artic_img">
                                <img src="catalog/view/theme/default/images/article2.png" alt="">
                        </div>
                        <span>
                                ПРОТИВОВЗЛОМНАЯ ФУРНИТУРА
                        </span>
                </a>
                <a href="#"  class="article_one">                       
                        <div class="artic_img">
                                <img src="catalog/view/theme/default/images/article3.png" alt="">
                        </div>
                        <span>
                                IP видеонаблюдение
                        </span>
                </a>
                <a href="#" class="article_one ">                       
                        <div class="artic_img">
                                <img src="catalog/view/theme/default/images/article4.png" alt="">
                        </div>
                        <span>
                                Системы видеонаблюдения
                        </span>
                </a>
                <div class="clr"></div>
        </div>
</section>

<script type="text/javascript">
        $('.article_one').each(function(){
                if (($(this).index() > 2) & (($(this).index()-3) % 5 == 1)){
                        $(this).addClass('artic_last');
                        $(this).after('<div class="clr"></div>')
                } 
         })
</script><script type="text/javascript" src="catalog/view/theme/default/js/jquery.dotdotdot.js"></script>
<section class="usluga3_services">
        <div class="wrap">
        <div class="serv_title">
            Другие услуги
        </div>
        <div class="service_line"></div>
        <a href="#" class="serv_item serv_item1">
            <div class="title_pic">
                <img src="catalog/view/theme/default/images/serv_fire.png" alt="">
            </div>
            <div class="serv_op">
                Системы пожарной безопасности
            </div>
            <div class="serv_cont">
                <div class="serv_cont_img">
                    <img src="catalog/view/theme/default/images/serv_pic2.png" alt="" class="grayscale">
                </div>
                <div class="serv_mask"></div>
                <div class="serv_cont_info">
                    Лицензированная деятельность по установке пожарных систем безопасности
                </div>
            </div>
        </a>
        <a href="#" class="serv_item serv_item2">
            <div class="title_pic">
                <img src="catalog/view/theme/default/images/serv_cam.png" alt="">
            </div>
            <div class="serv_op">
                Монтаж системы видеонаблюдени
            </div>
            <div class="serv_cont">
                <div class="serv_cont_img">
                    <img src="catalog/view/theme/default/images/serv_pic1.png" alt="">
                </div>
                <div class="serv_mask"></div>
                <div class="serv_cont_info">
                    Профессиональный подбор, проектирование и монтаж систем видеонаблюдения
                </div>
            </div>
        </a>
        <a href="#" class="serv_item serv_item3">
            <div class="title_pic">
                <img src="catalog/view/theme/default/images/serv_close.png" alt="">
            </div>
            <div class="serv_op">
                Системы охраны имущества
            </div>
            <div class="serv_cont">
                <div class="serv_cont_img">
                    <img src="catalog/view/theme/default/images/serv_pic3.png" alt="">
                </div>
                <div class="serv_mask"></div>
                <div class="serv_cont_info">
                    Современные методы решения охраны имущества системами безопасности
                </div>
            </div>
        </a>
        <a href="#" class="serv_item serv_item4">
            <div class="title_pic">
                <img src="catalog/view/theme/default/images/serv_img.png" alt="">
            </div>
            <div class="serv_op">
                Системы управления доступом
            </div>
            <div class="serv_cont">
                <div class="serv_cont_img">
                    <img src="catalog/view/theme/default/images/serv_pic4.png" alt="">
                </div>
                <div class="serv_mask"></div>
                <div class="serv_cont_info">
                    Удобные и понятные системы контроля и управления доступом
                </div>
            </div>
        </a>
        <div class="clr"></div>
        </div>
</section>
<script type="text/javascript">
    $(function() {
        $('.serv_cont_info').dotdotdot();
    });
</script>
            <div class="clr"></div>        
        </div><!-- end CONTENT -->
<?php echo $footer; ?>