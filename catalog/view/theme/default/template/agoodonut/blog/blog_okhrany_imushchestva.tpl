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
            <img src="catalog/view/theme/default/images/slides/slide4.jpg" alt="">
        </div>
        <div class="pic_info">
            <div class="pic_title"><?php echo $heading_title_2; ?></div>
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
                ПОЗВОНИТЕ СЕЙЧАС И ПОЛУЧИТЕ СКИДКУ НА ОБОРУДОВАНИЕ И МОНТАЖ ОХРАННОЙ СИГНАЛИЗАЦИИ!
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
            <a href="#" class="time_c_button btn_form" onclick="yaCounter20762257.reachGoal('order_service_4'); return true;">
                Заказать услугу
            </a>
            <div class="clr"></div>
            <div class="bot_line"></div>
            <script type="text/javascript">
                if ($.cookie('the_usluga5') == null) {
                    var c_data = new Date().getTime();
                    $.cookie('the_usluga5', c_data + 86299950, {expires: 1});
                }

                var my_datal = new Date().getTime();
                var my_data3 = parseInt($.cookie('the_usluga5'));
                var time = my_data3 - my_datal;

                if (time > 0) {
                    var clock = $('.clock').FlipClock(time / 1000, {
                        clockFace: 'DailyCounter',
                        countdown: true
                    });
                } else {
                    time = new Date().getTime();

                    $.cookie('the_usluga5', null);
                    $.cookie('the_usluga5', time + 18000000, {expires: 1});

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
               Системы охраны имущества – это комплексные меры обеспечения безопасности, предусматривающие контролирование ситуации, воспрепятствование несанкционированному доступу, сигнализацию о фактах доступа злоумышленников и оперативную передачу информации для незамедлительного реагирования. Установка только одного элемента системы не несет максимальной эффективности. Нужен комплексный и персональный подход. Вся полнота передовых средств и оборудования, услуг и возможностей позволяет компании Арсенал предлагать наиболее эффективные решения для сохранности вашего имущества. 
            </p>
            <div class="info_attacker">
                <div class="attacker_acts">
                    <h2>
                        Узнайте для чего устанавливаются системы охранной сигнализации
                    </h2>
                    <div class="security_item s_item_1">
                        <div class="si_title">
                            Защита протяженных периметров
                        </div>
                        <div class="si_info">
                            Граница на замке!
                        </div>
                        <div class="clr"></div>
                    </div>
                    <div class="security_item s_item_2">
                        <div class="si_title">
                            Охрана прилегающих территорий
                        </div>
                        <div class="si_info">
                            Для полного контроля обычно формируют несколько рубежей охраны. 
                        </div>
                        <div class="clr"></div>
                    </div>
                    <div class="security_item s_item_3">
                        <div class="si_title">
                            Контроль безопасности объектов недвижимости
                        </div>
                        <div class="si_info">
                            Правильно спроектированные комплексные охранные системы: несколько рубежей защиты,  видео и аудио мониторинг - залог безопасности Вашего имущества!
                        </div>
                        <div class="clr"></div>
                    </div>
                    <div class="security_item s_item_4">
                        <div class="si_title">
                            Передача сообщений на пульты ЧОП и МВД
                        </div>
                        <div class="si_info">
                            Группы быстрого реагирования (ГБР) после тревоги моментально отреагируют на тревожное сообщение.
                        </div>
                        <div class="clr"></div>
                    </div>
                    <div class="security_item s_item_5">
                        <div class="si_title">
                            Вы всегда в курсе происходящего на охраняемых объектах
                        </div>
                        <div class="si_info">
                            Системы охраны позволят управлять, контролировать, считывать информацию удаленно в любое удобное время.
                        </div>
                        <div class="clr"></div>
                    </div>
                    <div class="security_item s_item_6">
                        <div class="si_title">
                            Будьте спокойны  за себя и близких
                        </div>
                        <div class="si_info">
                            Будьте застрахованы от возможных неприятных последствий и заблаговременно защитите себя, свой дом и своих близких от возможных покушений злоумышленников на свое имущество и здоровье.
                        </div>
                        <div class="clr"></div>
                    </div>
                </div>
                <div class="security_system">
                    <div class="secur_cam2">
                        
                    </div>
                    <div class="ss_inform">
                        <span>
                           Во все времена системы охранной сигнализации считались основой систем охраны имущества. Первые прототипы современных систем сигнализации появились в России в 1990-х годах, но в силу ограниченности возможностей и малого радиуса действия рассматривались как дополнительная, а не ключевая мера безопасности. Сегодня в практику входят более совершенные технологии фиксации и передачи сигналов. Передовая сигнализация может быть самодостаточным средством охраны имущества, но для наиболее ценного имущества целесообразно применять комплексный подход. Оценить все риски, избрать наиболее эффективное средство их нейтрализации, спроектировать, укомплектовать и смонтировать систему охраны имущества на объекте – главный аспект рационального подхода к имущественной безопасности. </span>
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
                <?php echo $column_left; ?>aaaaa
                <a href="#" class="btn_form show_popup" onclick="yaCounter20762257.reachGoal('get_callback_4'); return true;">Заказать обратный звонок</a>

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
                    <?php echo $column_there;?>                    

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
        <a href="http://sb-arsenal.ru/uslugi/sistemy-videonablyudeniya" class="serv_item serv_item1">
            <div class="title_pic">
                <img src="catalog/view/theme/default/images/serv_cam.png" alt="">
            </div>
            <div class="serv_op">
                Системы видеонаблюдения
            </div>
            <div class="serv_cont">
                <div class="serv_cont_img">
                    <img src="catalog/view/theme/default/images/serv_pic1.png" alt="" class="grayscale">
                </div>
                <div class="serv_mask"></div>
                <div class="serv_cont_info">
                    Профессиональный подбор, проектирование и монтаж систем видеонаблюдения
                </div>
            </div>
        </a>
        <a href="http://sb-arsenal.ru/uslugi/sistemy-pozharnoy-bezopasnosti" class="serv_item serv_item2">
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