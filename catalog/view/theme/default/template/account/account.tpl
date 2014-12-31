<?php echo $header; ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content" class="clearfix personal_base">
    <?php echo $content_top; ?>
    <div class="dashboard-header clearfix">
        <div class="left">
            <h4><?php echo $heading_title; ?></h4>	
            <?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/breadcrumb.tpl'); ?>

        </div>
        <div class="right">
            <img src="catalog/view/theme/default/image/user-gold.png" alt="">
            <span>Статус клиента:</span>
            <a href="<?php echo $UrlAcount;?>"><?php echo $StatusAcount;?></a>
        </div>
    </div>
    <div class="dashboard-content clearfix">
        <div class="left">
            <!------------------------------------------фізична особа--------------------------------->
            <?php if($simple['customer_group'] == 1) { ?>
            <div class="personal-data">
                <h3>Личные данные</h3>
                <form action="index.php?route=account/account" class="form_f">
                    <label>
                        <strong><?php echo ($simple['main_firstname']['label']);?></strong>
                        <input type="text" class="field-13" name="firstname"
                               value="<?php echo ($simple['main_firstname']['value']);?>">
                    </label>
                    <label>
                        <strong><?php echo ($simple['main_lastname']['label']);?></strong>
                        <input type="text" class="field-14" name="lastname"
                               value="<?php echo ($simple['main_lastname']['value']);?>">
                    </label>
                    <label>
                        <strong><?php echo ($simple['main_email']['label']);?></strong>
                        <input type="text" class="field-15" name="email"
                               value="<?php echo ($simple['main_email']['value']);?>">
                    </label>
                    <label>
                        <strong><?php echo ($simple['main_telephone']['label']);?></strong>
                        <input type="text" class="field-16 click_phone" name="telephone"
                               value="<?php echo ($simple['main_telephone']['value']);?>">							  
                    </label> 
                    <label class="address-items" >
                        <a href="<?php echo $password; ?>"><?php echo $text_password; ?></a>
                    </label>
                    <input hidden type="text"  name="fax"  value="">
                    <button class="dashboard-changes" id="submitSaveF">Сохранить изменения</button>
                </form>
            </div>

            <!------------------------------------------юридична особа--------------------------------->
            <?php } else { ?>
            <div class="personal-data">
                <h3>Личные данные</h3>                
                <form action="index.php?route=account/account" class="form_y">
                    <label>
                        <strong><?php echo ($simple['main_email']['label']);?></strong>
                        <input class="field-3" type="text" name="email"
                               value="<?php echo ($simple['main_email']['value']);?>">
                    </label>
                    <label>
                        <strong><?php echo ($simple['main_telephone']['label']);?></strong>
                        <input class="field-4 click_phone" type="text" name="telephone"
                               value="<?php echo ($simple['main_telephone']['value']);?>">
                    </label>
                    <label>
                        <strong><?php echo ($simple['y_organization_name']['label']);?></strong>
                        <input class="field-5" type="text" name="y_organization_name"
                               value="<?php echo ($simple['y_organization_name']['value']);?>">
                    </label>
                    <label>
                        <strong><?php echo ($simple['y_y_address']['label']);?></strong>
                        <input class="field-6" type="text" name="y_y_address"
                               value="<?php echo ($simple['y_y_address']['value']);?>">
                    </label>
                    <label>
                        <strong><?php echo ($simple['y_f_address']['label']);?></strong>
                        <input class="field-7" type="text" name="y_f_address"
                               value="<?php echo ($simple['y_f_address']['value']);?>">
                    </label>
                    <label>
                        <strong><?php echo ($simple['y_inn']['label']);?></strong>
                        <input class="field-8" type="text" name="y_inn"
                               value="<?php echo ($simple['y_inn']['value']);?>">
                    </label>
                    <label>
                        <strong><?php echo ($simple['y_kpp']['label']);?></strong>
                        <input class="field-9" type="text" name="y_kpp"
                               value="<?php echo ($simple['y_kpp']['value']);?>">
                    </label>
                    <label>
                        <strong><?php echo ($simple['y_cal_account']['label']);?></strong>
                        <input class="field-10" type="text" name="y_cal_account"
                               value="<?php echo ($simple['y_cal_account']['value']);?>">
                    </label>
                    <label>
                        <strong><?php echo ($simple['y_bank_details']['label']);?></strong>
                        <input class="field-11" type="text" name="y_bank_details"
                               value="<?php echo ($simple['y_bank_details']['value']);?>">
                    </label>
                    <label>
                        <strong><?php echo ($simple['y_contact_person']['label']);?></strong>
                        <input class="field-12" type="text" name="y_contact_person"
                               value="<?php echo ($simple['y_contact_person']['value']);?>">
                    </label>
                    <label class="address-items" >
                        <a href="<?php echo $password; ?>"><?php echo $text_password; ?></a>
                    </label>
                    <button class="dashboard-changes" id="submitSave">Сохранить изменения</button>
                </form>
            </div>           
            <?php } ?>
					<script>
				   $('.click_phone').each(function(){
							$(this).mask("+7(999) 999-99-99");
					});
				   </script>

        </div>
        <div class="right">
            <div class="address">
                <h3>Адреса доставки</h3>
                <div>

                    <?php foreach ($addresses as $result) { ?>
                    <div class="address-item">
                        <div>
                            <strong>Адрес доставки</strong>
                            <a href="<?php echo $result['update']; ?>">Редактировать</a>
                            <a href="<?php echo $result['delete']; ?>">Удалить</a>
                            <?php if($default_address==$result['address_id']){ ?><div class="default_address address-acount">Основной адрес</div> <?php } ?>
                        </div>
                        <div>
                            <?php echo $result['address']; ?>                            
                        </div>
                    </div>
                    <?php } ?>

                    <hr>
                    <a href="<?php echo $insert; ?>">Добавить ещё...</a>
                </div>
            </div>
            <div class="address">
                <h3>Промокод</h3>
                <div>
                 <input type="text" id="promoCodeValue">
                 <a href="javascript:void(0);"  id="promoButton">использовать</a>
            </div>
            </div>
            
        </div>
    </div>    
    <div class="dashboard-order-history">
        <h3>История заказов</h3>
        <table>
            <tbody>
                <tr>
                    <th>№ Заказа</th>
                    <th>Дата заказа</th>
                    <th>Покупатель</th>
                    <th>Статус заказа</th>
                    <th>Сумма</th>
                </tr>
                <?php foreach ($orders as $order) { ?>
                <tr>
                    <td><a href='index.php?route=account/order/info&order_id=<?php echo $order["order_id"];?>'</a> Заказ № <?php echo $order["order_id"];?></td>
                    <td><?php echo $order['date_added']; ?></td>
                    <td><?php if ($order['name']== 'no_name no_lastname'){$order['name'] == '';}else { echo $order['name'];}?></td>
                    <td><?php echo $order['status']; ?></td>
                    <td> <?php echo $order['total']; ?></td>
                </tr>

                <?php } ?>                
            </tbody>
        </table>
    </div>
</div>
<?php echo $footer; ?> 