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
    </section><div class="pic_block">
        <div class="pic_wrap">
            <img src="catalog/view/theme/default/images/slides/slide2.jpg" alt="">
        </div>
        <div class="pic_info">
            <div class="pic_title"><?php echo $heading_title_2; ?></div>
            <div class="pic_descrip">
                <p>Совокупность программно-аппаратных технических средств безопасности, имеющих целью видеоконтроль и регистрацию  объектов на заданной территории.</p>
                <p>Основная задача  - контроль за ситуацией на объекте.</p>
            </div>
        </div>

    </div>
    <script src="catalog/view/theme/default/js/base.js"></script>
    <script src="catalog/view/theme/default/js/flipclock.js"></script>
    <script src="catalog/view/theme/default/js/dailycounter.js"></script>
    <section class="time_count">
        <div class="wrap">
            <h2 class="time_title">
                ЗАКАЖИТЕ УСЛУГУ СЕЙЧАС И ПОЛУЧИТЕ СКИДКУ!
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
            <a href="#" class="time_c_button btn_form" onclick="yaCounter20762257.reachGoal('order_service_5'); return true;">
                Заказать услугу
            </a>
            <div class="clr"></div>
            <div class="bot_line"></div>
            <script type="text/javascript">
                if ($.cookie('the_usluga6') == null) {
                    var c_data = new Date().getTime();
                    $.cookie('the_usluga6', c_data + 86299950, {expires: 1});
                }

                var my_datal = new Date().getTime();
                var my_data3 = parseInt($.cookie('the_usluga6'));
                var time = my_data3 - my_datal;

                if (time > 0) {
                    var clock = $('.clock').FlipClock(time / 1000, {
                        clockFace: 'DailyCounter',
                        countdown: true
                    });
                } else {
                    time = new Date().getTime();

                    $.cookie('the_usluga6', null);
                    $.cookie('the_usluga6', time + 18000000, {expires: 1});

                    var clock = $('.clock').FlipClock(18000000 / 1000, {
                        clockFace: 'DailyCounter',
                        countdown: true
                    });
                }
                ;
            </script>
        </div>
    </section><section class="usluga3_info">
        <div class="wrap">
            <p>
               Видеонаблюдение – не роскошь! Вы цените свое спокойствие, безопасность и желаете быть уверенными, что ничто и никто не останется бесконтрольным в ваше отсутствие? Современное видеонаблюдение способно в точности отвечать пользовательским запросам, быть гибким и умным, снижать затраты на услуги охранных структур.
            </p>
            <div class="info_attacker">
                <div class="attacker_acts">
                    <h2>
                        Системы видеонаблюдения на страже порядка
                    </h2>
                    <div class="security_item s_item_1">
                        <div class="si_title">
                            Охраняет частную собственность и прилегающие территории
                        </div>
                        <div class="si_info">
                            Никто и ни что не ускользнет от всевидящего ока службы безопасности!
                        </div>
                        <div class="clr"></div>
                    </div>
                    <div class="security_item s_item_2">
                        <div class="si_title">
                            Следит за вашими сотрудниками
                        </div>
                        <div class="si_info">
                            Ваши сотрудники бездельничают, решили поломать казенный принтер, или украсть пачку бумаги, тогда мы идем к ним!
                        </div>
                        <div class="clr"></div>
                    </div>
                    <div class="security_item s_item_3">
                        <div class="si_title">
                            Контролирует технологические процессы и работу сложного оборудования
                        </div>
                        <div class="si_info">
                            Не всегда имееться возможность лично присутствовать на производстве и видеть воочию процес изготоления продукта-это решение для ВАС!
                        </div>
                        <div class="clr"></div>
                    </div>
                    <div class="security_item s_item_4">
                        <div class="si_title">
                            Осуществляет видеоконтроль опасных объектов
                        </div>
                        <div class="si_info">
                            Атомный реактор, плавка метала в доменной печи, взрывные работы, .... видеть все это в непосредственной близости и одновременно находится на безопасном расстоянии, хотите? Мы вам поможем!
                        </div>
                        <div class="clr"></div>
                    </div>
                    <div class="security_item s_item_5">
                        <div class="si_title">
                            Обеспечивает безопасность дорожного движения
                        </div>
                        <div class="si_info">
                            Пересек сплошную,  проскочил на красный, превысил скорость, мы все видим!
                        </div>
                        <div class="clr"></div>
                    </div>
                    <div class="security_item s_item_6">
                        <div class="si_title">
                            Заботится о ваших близких
                        </div>
                        <div class="si_info">
                            Сетевая видеокамера установленная в вашем доме или квартире обеспечит ваше спокойствие за Ваших близких когда вы на работе или в коммандировке!
                        </div>
                        <div class="clr"></div>
                    </div>
                </div>
                <div class="security_system">
                    <div class="secur_cam1">
                        
                    </div>
                    <div class="ss_inform">
                        <span>
                            Неважно, желаете ли вы обезопасить свое домашнее имущество или лично себя, являетесь ли вы владельцем крупного производства или маленького офиса. Главное одно – вы разумный человек, а значит, вам не нужно объяснять, зачем нужны современные средства безопасности. Чтобы достичь цели можно нанять охранников, поставить сигнализацию или, скажем, самому периодически отслеживать ситуацию. Но будет ли это действенно? 
                        </span>
                        <span>
                            Видеонаблюдение – самодостаточный и эффективный способ контроля и охраны. От всевидящего ока ни что не ускользнет. Но оно способно не просто наблюдать. Фиксация и запись сигналов, незамедлительная передача для быстрого реагирования и даже самостоятельное принятие решений – современные системы технически совершены и отзывчивы к потребностям владельцев. Мы подберем оборудование под Вашу задачу в нашем магазине видеонаблюдения.
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
                <?php echo $column_left; ?>
                <a href="#" class="btn_form show_popup" onclick="yaCounter20762257.reachGoal('get_callback_5'); return true;">Заказать обратный звонок</a>

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
	
	<?php if($description){?>
	<section class="usluga3_info">
		<div class="wrap prices"><?php echo $description; ?></div>
	</section>
	<?php }?>
                    <?php echo $column_four;?>
                    

    <script type="text/javascript">
        $('.article_one').each(function() {
            if (($(this).index() > 2) & (($(this).index() - 3) % 5 == 1)) {
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
        <a href="http://sb-arsenal.ru/uslugi/sistemy-okhrany-imushchestva" class="serv_item serv_item1">
            <div class="title_pic">
                <img src="catalog/view/theme/default/images/serv_close.png" alt="">
            </div>
            <div class="serv_op">
                Системы охраны имущества
            </div>
            <div class="serv_cont">
                <div class="serv_cont_img">
                    <img src="catalog/view/theme/default/images/serv_pic3.png" alt="" class="grayscale">
                </div>
                <div class="serv_mask"></div>
                <div class="serv_cont_info">
                    Современные методы решения охраны имущества системами безопасности
                </div>
            </div>
        </a>
        <a href="http://sb-arsenal.ru/uslugi/sistemy-pozharnoy-bezopasnosti" class="serv_item serv_item3">
            <div class="title_pic">
                <img src="catalog/view/theme/default/images/serv_fire.png" alt="">
            </div>
            <div class="serv_op">
                Системы пожарной безопасности
            </div>
            <div class="serv_cont">
                <div class="serv_cont_img">
                    <img src="catalog/view/theme/default/images/serv_pic2.png" alt="">
                </div>
                <div class="serv_mask"></div>
                <div class="serv_cont_info">
                   Лицензированная деятельность по установке пожарных систем безопасности
                </div>
            </div>
        </a>
        <a href="http://sb-arsenal.ru/uslugi/sistemy-kontrolya-dostupa" class="serv_item serv_item4">
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