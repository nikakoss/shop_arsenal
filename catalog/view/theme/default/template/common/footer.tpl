 </div><!-- end WRAPPER --> 
 <a href="#" class="up_button"></a>
 <script type="text/javascript">
$(document).ready(function () {
                 // button up
    if ($(document).scrollTop() > $(window).height()) {
        $('.up_button').show();
    } else if ($(document).scrollTop() < $(window).height()) {
        $('.up_button').hide();
    }
    ;
    $(window).scroll(function() {
        if ($(document).scrollTop() > $(window).height()) {
            $('.up_button').fadeIn();
        } else if ($(document).scrollTop() < $(window).height()) {
            $('.up_button').fadeOut();
        }
        ;
    });
    $('.up_button').click(function(event) {
        event.preventDefault();        
        
        $('body, html').animate({
            scrollTop: 0
        }, 250);
    });
        });
</script>
    <!-- FOOTER -->
    <footer>
         
                <div class="wrap">
           <div class="left_foot">
            <!-- logo -->
                    <a href="#" class="footer_logo" title="Арсенал"></a>
                    <!-- social buttons -->
                    <div class="social">
                        <span>Мы в социальных сетях</span>
                        <a href="#" class="youtube" title="Youtube"></a>
                        <a href="#" class="tweet" title="Twitter"></a>
                        <a href="#" class="facebook" title="Facebook"></a>
                        <a href="#" class="vk" title="Вконтакте"></a>
                        <a href="#" class="odnoklasniki" title="Однокласники" ></a>
                    </div>
                    <div class="clr"></div>
                    <!-- footer menu -->
                    <ul>
                        <li><a href="/">Главная</a></li>
                        <li><a href="/uslugi">Наши услуги</a></li>
                        <li><a href="/news">Новости</a></li>
                        <li><a href="/blog">Блог</a></li>
                        <li><a href="<?php echo $this->url->link('information/information', 'information_id=' .  8);?>">FAQ</a></li>
                        <li><a href="<?php echo $this->url->link('information/information', 'information_id=' .  10);?>">Вакансии</a></li>
                        <li><a href="<?php echo $this->url->link('information/information', 'information_id=' .  7);?>">Контакты</a></li>
                    </ul>
                    <div class="clr"></div>
                    <!-- copyright -->
                    <span class="copyr">&#169; ООО "Торговый Дом Арсенал" 2009-2013. Все права защищены.</span>

                    <span class="develop">
                    <!-- Yandex.Metrika informer -->
<a href="https://metrika.yandex.ru/stat/?id=20762257&amp;from=informer"
target="_blank" rel="nofollow"><img src="//bs.yandex.ru/informer/20762257/3_1_6D4DD5FF_4D2DB5FF_1_pageviews"
style="width:88px; height:31px; border:0;" alt="Яндекс.Метрика" title="Яндекс.Метрика: данные за сегодня (просмотры, визиты и уникальные посетители)" onclick="try{Ya.Metrika.informer({i:this,id:20762257,lang:'ru'});return false}catch(e){}"/></a>
<!-- /Yandex.Metrika informer -->

<!-- Yandex.Metrika counter -->
<script type="text/javascript">
(function (d, w, c) {
    (w[c] = w[c] || []).push(function() {
        try {
            w.yaCounter20762257 = new Ya.Metrika({id:20762257,
                    webvisor:true,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true});
        } catch(e) { }
    });

    var n = d.getElementsByTagName("script")[0],
        s = d.createElement("script"),
        f = function () { n.parentNode.insertBefore(s, n); };
    s.type = "text/javascript";
    s.async = true;
    s.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//mc.yandex.ru/metrika/watch.js";

    if (w.opera == "[object Opera]") {
        d.addEventListener("DOMContentLoaded", f, false);
    } else { f(); }
})(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="//mc.yandex.ru/watch/20762257" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
                        Разработка сайта: <br/>
                        Интернет агенство <a href="#">Arsenal-Media.net</a>
                    </span>
                </div>
                <!-- form -->
                <div class="right_foot">
                    <div class="head_text">Отправьте запрос и <span>получите карту скидок </span>в нашем магазине!</div>
                    <form class="form_footer" method="POST" onsubmit="yaCounter20762257.reachGoal('get_discount_cart'); return true;">
                        <input type="text" placeholder="Ваше имя" value="" name="name"/>
                        <input type="text" placeholder="Телефон" value="" name="phone" id="user_phone2"/>
                        <input type="text" placeholder="Email" value="" name="mail"/>
                        <input type="hidden" value="Запрос на получение карты скидок" name="subject" />
                        <input type="hidden" value="Комментарий в данной форме отсутствует" name="comment"/>
                        <input type="checkbox" class="check" value="one" name="check" checked/>
                        <span class="check_text">Я согласен получать новости и предложения на свой e-mail</span>
                        <div class="clr"></div>
                        <a href="" id="form_footer" class="btn_form send_form_footer">Отправить</a>
                        <!--<input type="button" value="Отправить" id="form_footer"  class="btn_form"/>-->
                    </form>
                    
                </div>
                <div class="clr"></div>
                </div>

        </footer>
    <!-- end FOOTER -->

<!-- POPUP -->

<div class="popupOverlay"></div>

<div class="popupCont popupUsluga">
    <div class="popupTitle">
        Заказать Усулугу
    </div>
    <div class="popupSep"></div>
    <div class="popupDescr">
        Если Вы не смогли найти ответов на какие-либо интересующие Вас вопросы, мы предлагаем Вам связаться с нами по телефону, и мы с удовольствием ответим Вам, или воспользуйтесь формой обратной связи.
    </div>
    <div class="popupSep"></div>
    <div class="popupForm">
        <form class="form_call" method="POST" onsubmit="yaCounter20762257.reachGoal('get_service'); return true;">
            <input type="text" placeholder="Ваше имя" name="name"/>
            <input type="text" placeholder="Контактный телефон" name="phone" id="user_phone5"/>
            <input type="hidden" value="Заказ услуги со скидкой" name="subject" />
            <input type="text" placeholder="Электронная почта" name="mail"/>
            <div class="formTitle">
                Услуга которая вас интересует:
            </div>
            <div class="popupCheck">
                <label class="checkbox_in">
                    <input type="checkbox" name="check1"/>
                    <span></span>
                    Системы видеонаблюдения
                </label>
                <br>
                <label class="checkbox_in">
                    <input type="checkbox" name="check2"/>
                    <span></span>
                    Системы охраны имущества
                </label>
                <br>
                <label class="checkbox_in">
                    <input type="checkbox" name="check3"/>
                    <span></span>
                    Системы пожарной безопасности
                </label>
                <br>
                <label class="checkbox_in">
                    <input type="checkbox" name="check4"/>
                    <span></span>
                    Системы контроля доступа
                </label>
                <br>
                <span class="error_u" style="color: red; display: none">Выберите услугу</span>
            </div>
            <input type="button" value="Отправить" id="returnCall" class="popupSent btn_form"/>
            <span class="popupClose"></span>
        </form>
    </div>
</div>



<div class="popupCont popupMain">
    <div class="popupTitle">
        Заказать обратный звонок
    </div>
    <div class="popupSep"></div>
    <div class="popupDescr">
        Если Вы не смогли найти ответов на какие-либо интересующие Вас вопросы, мы предлагаем Вам связаться с нами по телефону, или воспользуйтесь формой обратной связи.
    </div>
    <div class="popupSep"></div>
    <div class="popupForm">
        <form class="form_call_header" onsubmit="yaCounter20762257.reachGoal('send_form_1'); return true;">
            <input class="contact-name" type="text" placeholder="Ваше имя" name="name"/>
            <input class="contact-telephone" type="text" placeholder="Контактный телефон" name="phone" id="user_phone8"/>
            <input type="hidden"  value="Email в форме не указывается" name="mail"/>
            <input type="hidden" value="Заказ обратного звонка" name="subject" />
            <input class="contact-time" type="text" placeholder="Удобное время для звонка" name="time"/>
            <input type="button" value="Заказать обратный звонок" id="callHeader" class="popupSent popupSentSubmit btn_form"/>
            <span class="popupClose"></span>
        </form>
    </div>
</div>

<div class="popupCont popupSuccess">
    <div class="popupTitle"></div>
    <div class="popupSep"></div>
    <div class="popupDescr"> </div>
    <div class="popupSep"></div>
    <div class="popupForm">
        <form class="form_contacts">
            <span class="popupClose"></span>
        </form>
    </div>
</div>

<script src="/catalog/view/theme/default/js/ie.js"></script>
<script src="/catalog/view/theme/default/js/jquery.placeholder.min.js"></script>
<script src="catalog/view/theme/default/js/slides.min.jquery.js"></script>
 <?php foreach ($scripts as $script) { ?>
 <script type="text/javascript" src="<?php echo $script; ?>"></script>
 <?php } ?>
 <script src="/catalog/view/theme/default/js/script.js"></script>
 <script src="/catalog/view/theme/default/js/is.mobile.js"></script>
 <script src="/catalog/view/theme/default/js/jquery.maskedinput.min.js"></script>   

 
<script src="catalog/view/theme/default/js/main.js"></script>

</body>
</html>