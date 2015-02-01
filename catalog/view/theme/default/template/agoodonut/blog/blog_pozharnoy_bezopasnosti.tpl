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
            <img src="catalog/view/theme/default/images/slides/slide3.jpg" alt="">
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
                ПОЗВОНИТЕ СЕЙЧАС И ПОЛУЧИТЕ СКИДКУ НА ОБОРУДОВАНИЕ И МОНТАЖ ПОЖАРНОЙ СИГНАЛИЗАЦИИ!
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
            <a href="#" class="time_c_button btn_form" onclick="yaCounter20762257.reachGoal('order_service_2'); return true;">
                Заказать услугу
            </a>
            <div class="clr"></div>
            <div class="bot_line"></div>
            <script type="text/javascript">
                if ($.cookie('the_usluga3') == null) {
                    var c_data = new Date().getTime();
                    $.cookie('the_usluga3', c_data + 86299950, {expires: 1});
                }

                var my_datal = new Date().getTime();
                var my_data3 = parseInt($.cookie('the_usluga3'));
                var time = my_data3 - my_datal;

                if (time > 0) {
                    var clock = $('.clock').FlipClock(time / 1000, {
                        clockFace: 'DailyCounter',
                        countdown: true
                    });
                } else {
                    time = new Date().getTime();

                    $.cookie('the_usluga3', null);
                    $.cookie('the_usluga3', time + 18000000, {expires: 1});

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
               Организация эффективной системы пожаробезопасности – гарантия имущественной безопасности и сохранности жизни людей. Современные средства, технологии, оборудование и ресурсы позволяют обеспечить максимальный уровень пожарной безопасности. Любая система пожарной безопасности требует предварительного обследования объекта и проектирования системы, профессионального монтажа и обслуживания. Торговый Дом Арсенал предлагает всю полноту услуг в рамках лицензионной деятельности, обеспечивает системную комплектацию средств и оборудования. 
            </p>
            <div class="info_attacker">
                <div class="attacker_acts">
                    <h2>
                        Пожарная безопасность — важнейший элемент инженерных систем, от которого зависит сохранность Вашего имущества и здоровья
                    </h2>
                    <div class="security_item s_item_1">
                        <div class="si_title">
                            Ты установил дома датчик-дыма? 
                        </div>
                        <div class="si_info">
                            Необходимость установки подтверждена печальной статистикой, позаботьтесь о себе, близких и имуществе.
                        </div>
                        <div class="clr"></div>
                    </div>
                    <div class="security_item s_item_2">
                        <div class="si_title">
                            В вашем офисе работает пожарная сигнализация?
                        </div>
                        <div class="si_info">
                            "Зачем пожарная сигнализация, зачем тратить деньги на это, зачем я буду платить у меня же друг начальник МЧС?"...  Кто столкнулся с пожаром больше не задает этих вопросов.  
                        </div>
                        <div class="clr"></div>
                    </div>
                    <div class="security_item s_item_3">
                        <div class="si_title">
                            Если все-таки загорелось? 
                        </div>
                        <div class="si_info">
                            Огнетушитель на рабочем месте Ваш друг и защитник. А Вы назначили ответственного за пожарную безопасность на предприятии?!
                        </div>
                        <div class="clr"></div>
                    </div>
                    <div class="security_item s_item_4">
                        <div class="si_title">
                            А вы знаете что металл тоже горит? 
                        </div>
                        <div class="si_info">
                            Огнезащитная обработка металических и бетонных несущих конструкций, деревянных перекрытий и деревянной отделки,  поможет значительно уменьшить ущерб от пожара избежать разрушения зданий!
                        </div>
                        <div class="clr"></div>
                    </div>
                    <div class="security_item s_item_5">
                        <div class="si_title">
                            А как узнают Ваши сотрудники о возникновении экстренной ситуации 
                        </div>
                        <div class="si_info">
                            Вовремя оповестить сотрудников поможет система оповещения людей о пожаре, также эта система позволит проигрывать фоновую музыку и сообщать объявления!
                        </div>
                        <div class="clr"></div>
                    </div>
                    <div class="security_item s_item_6">
                        <div class="si_title">
                            Как вы узнаете о возникновении пожара? 
                        </div>
                        <div class="si_info">
                            Где бы Вы не находились система оповестит Вас о ЧП по доступным каналам связи будь то телефнная линия, радиоканал, сети GSM или Интернет. 
                        </div>
                        <div class="clr"></div>
                    </div>
                </div>
                <div class="security_system">
                    <div class="secur_cam3">
                        
                    </div>
                    <div class="ss_inform">
                        <span>
                           В отличие от иных систем безопасности, система пожаробезопасности – гораздо более емкое понятие. Оно объединяет совокупность правил, средств, способов, действий, обеспечивающих пожарную безопасность и своевременность оценки пожарного риска. 
                        </span>
                        <span class="ss_important">
                            В минимально необходимом виде система пожаробезопасности – это:
                            <ul>
                                <li>комплекс профилактики и правил пожаробезопасности на объекте;</li>
                                <li>системы оповещения, эвакуации;</li>
                                <li>оборудование пожаротушения;</li>
                                <li>средства дымоудаления, вентиляции;</li>
                            </ul>
                        </span>
                        <span>
                           Арсенал – компания, которая на высоком уровне компетентности и эффективности подходит к организации систем пожарной безопасности. Совокупность возможностей - сервис и комплектация систем - обеспечит комплексный подход к выполнению поставленных задач.
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
    </section>
        <section class="usluga3_form">
        <div class="wrap clearfix">
            <div class="left">
                <?php echo $column_left; ?>
                <a href="#" class="btn_form" onclick="yaCounter20762257.reachGoal('get_callback_2'); return true;">Заказать обратный звонок</a>

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
                    <?php echo $column_two;?>

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
        <a href="http://sb-arsenal.ru/uslugi/sistemy-videonablyudeniya" class="serv_item  serv_item2 serv_item1">
            <div class="title_pic">
                <img src="catalog/view/theme/default/images/serv_cam.png" alt="">
            </div>
            <div class="serv_op">
                Системы видеонаблюдения
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
        <a href="http://sb-arsenal.ru/uslugi/sistemy-okhrany-imushchestva" class="serv_item serv_item3">
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