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
            <img src="catalog/view/theme/default/images/slides/slide1.jpg" alt="">
        </div>
        <div class="pic_info">
            <div class="pic_title"><?php echo $heading_title; ?></div>
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
                ПОЗВОНИТЕ СЕЙЧАС И ПОЛУЧИТЕ СКИДКУ НА ОБОРУДОВАНИЕ И МОНТАЖ СИСТЕМЫ КОНТРОЛЯ И УПРАВЛЕНИЯ ДОСТУПОМ!
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
            <a href="#" class="time_c_button btn_form" onclick="yaCounter20762257.reachGoal('order_service_3'); return true;">
                Заказать услугу
            </a>
            <div class="clr"></div>
            <div class="bot_line"></div>
            <script type="text/javascript">
                if ($.cookie('the_usluga4') == null) {
                    var c_data = new Date().getTime();
                    $.cookie('the_usluga4', c_data + 86299950, {expires: 1});
                }

                var my_datal = new Date().getTime();
                var my_data3 = parseInt($.cookie('the_usluga4'));
                var time = my_data3 - my_datal;

                if (time > 0) {
                    var clock = $('.clock').FlipClock(time / 1000, {
                        clockFace: 'DailyCounter',
                        countdown: true
                    });
                } else {
                    time = new Date().getTime();

                    $.cookie('the_usluga4', null);
                    $.cookie('the_usluga4', time + 18000000, {expires: 1});

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
                Системы контроля доступа – простое, но эффективное средство предотвращения несанкционированного прохода лиц, проезда транспорта на охраняемую территорию или объект. В современных условиях контроль доступа применяется в различных секторах: на бытовом уровне в виде домофонов различного типа, на корпоративном – как более совершенные устройства отслеживания и контроля на уровне пропускного режима, на производственных и особо ответственных объектах – как обязательный элемент комплексного режима безопасности. 
            </p>
            <div class="info_attacker">
                <div class="attacker_acts">
                    <h2>
                        Наличие систем контроля доступа на объекте  является удобным средством для ограничения входа или въезда посторонних посетителей, организации комфорта и безопасности.
                    </h2>
                    <div class="security_item s_item_1">
                        <div class="si_title">
                            Турникет
                        </div>
                        <div class="si_info">
                            Наиболее универсальное, практичное, удобное средство для контроля точек прохода
                        </div>
                        <div class="clr"></div>
                    </div>
                    <div class="security_item s_item_2">
                        <div class="si_title">
                            Шлагбаум
                        </div>
                        <div class="si_info">
                            Мы предлагаем качественные устройства контроля проездов от известных мировых производителей
                        </div>
                        <div class="clr"></div>
                    </div>
                    <div class="security_item s_item_3">
                        <div class="si_title">
                            Автоматические ворота
                        </div>
                        <div class="si_info">
                            Автоматику каждым воротам!
                        </div>
                        <div class="clr"></div>
                    </div>
                    <div class="security_item s_item_4">
                        <div class="si_title">
                            Учет рабочего времени
                        </div>
                        <div class="si_info">
                            Контролируйте ваших сотрудников: приход и уход с работы, перерывы, перекуры. Повысьте эффективность работы вашей команды
                        </div>
                        <div class="clr"></div>
                    </div>
                    <div class="security_item s_item_5">
                        <div class="si_title">
                            Пропускной режим
                        </div>
                        <div class="si_info">
                            Автоматическая пропускная система позволит организовать доступ только нужных людей и гостей.
                        </div>
                        <div class="clr"></div>
                    </div>
                    <div class="security_item s_item_6">
                        <div class="si_title">
                            Организация парковочных мест
                        </div>
                        <div class="si_info">
                            Надоело каждый день искать место для парковки своей машины? Установите автоматическую парковочную систему, определив место для своей машины раз и навсегда.
                        </div>
                        <div class="clr"></div>
                    </div>
                    <div class="security_item s_item_7">
                        <div class="si_title">
                            Блокираторы проездов
                        </div>
                        <div class="si_info">
                            Автоматические блокираторы проездов закроют проезд любому транспорту в нужное время. 
                        </div>
                        <div class="clr"></div>
                    </div>                            

                </div>
                <div class="security_system">
                    <div class="secur_cam4">
                        
                    </div>
                    <div class="ss_inform">
                        <span>Передовые системы контроля доступа обладают широким функционалом. Они способны не только контролировать пропускной режим, но и вести видеонаблюдение, максимально предотвращать схемы обхода, оперативно реагировать на попытки несанкционированного доступа и передавать сигналы для незамедлительного реагирования. Огромный модельный ряд отдельных и системных устройств, готовых и индивидуально скомплектованных систем позволяет найти идеальное решение, соблюсти баланс эффективности и затратности. Желаете получить действенную и надежную систему? Получите экспертные консультации компании ТД Арсенал. Мы подберем оптимальную комплектацию, поставим и смонтируем систему на высоком профессиональном уровне.</span>
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
                <a href="#" class="btn_form" onclick="yaCounter20762257.reachGoal('get_callback_3'); return true;">Заказать обратный звонок</a>

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
                    <?php echo $column_blockone; ?>

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
        <a href="<?php echo $this->url->link('information/information', 'information_id=' .  6);?>" class="serv_item serv_item1">
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
        <a href="<?php echo $this->url->link('information/information', 'information_id=' .  5);?>" class="serv_item serv_item2">
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
        <a href="<?php echo $this->url->link('information/information', 'information_id=' .  3);?>" class="serv_item serv_item3">
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