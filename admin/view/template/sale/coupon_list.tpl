<?php echo $header; ?>
<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="success"><?php echo $success; ?></div>
    <?php } ?>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/customer.png" alt="" /> <?php echo $heading_title; ?></h1>
            <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="document.getElementById('form').submit();" class="button"><?php echo $button_delete; ?></a></div>
        </div>
        <div class="content">
            <h2>Cтатусы клиентов</h2>
            <form action="<?php echo $updateDiscount; ?>" method="post" enctype="multipart/form-data" id="form_coupon">
                <table class="form" >
                    <tbody>
                        <?php
                        for ($i=0; $i<4; $i++){ ?>
                         <tr>
                            <td><span class="required">*</span>Название клиента:<input name="client<?php echo $i;?>name" value="<?php echo($discountData[$i]['name']);?>"></td>
                            <td>Ссылка на страницу описания:<input name="client<?php echo $i;?>url" value="<?php echo($discountData[$i]['url']);?>"></td>
                            
                            <td >Размер скидки в %:</td>
                            <td ><input name="client<?php echo $i;?>discount" value="<?php echo($discountData[$i]['discount']);?>"></td>
                           
                            <td>Сума:</td>
                            <td><input name="client<?php echo $i;?>sum" value="<?php echo($discountData[$i]['sum']);?>"></td>
                        </tr>
                        <?php } ?>                        
                    </tbody>
                </table>
            </form>
            <div class="buttons">
                <a onclick="$('#form_coupon').submit();" class="button">Сохранить</a>
            </div>
            <h2>дополнительные скидки</h2>
            <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
                <table class="list">
                    <thead>
                        <tr>
                            <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
                            <td class="left"><?php if ($sort == 'cd.name') { ?>
                                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                                <?php } else { ?>
                                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                                <?php } ?></td>
                            <td style="display: none;" class="left"><?php if ($sort == 'c.code') { ?>
                                <a href="<?php echo $sort_code; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_code; ?></a>
                                <?php } else { ?>
                                <a href="<?php echo $sort_code; ?>"><?php echo $column_code; ?></a>
                                <?php } ?></td>
                            
                            <td  class="right"><?php if ($sort == 'c.discount') { ?>
                                <a href="<?php echo $sort_discount; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_discount; ?></a>
                                <?php } else { ?>
                                <a href="<?php echo $sort_discount; ?>"><?php echo $column_discount; ?></a>
                                <?php } ?></td>
                            
                            <td style="display: none;" class="left"><?php if ($sort == 'c.date_start') { ?>
                                <a href="<?php echo $sort_date_start; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_start; ?></a>
                                <?php } else { ?>
                                <a href="<?php echo $sort_date_start; ?>"><?php echo $column_date_start; ?></a>
                                <?php } ?></td>
                            <td style="display: none;" class="left"><?php if ($sort == 'c.date_end') { ?>
                                <a href="<?php echo $sort_date_end; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_end; ?></a>
                                <?php } else { ?>
                                <a href="<?php echo $sort_date_end; ?>"><?php echo $column_date_end; ?></a>
                                <?php } ?></td>
                            <td class="left"><?php if ($sort == 'c.status') { ?>
                                <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                                <?php } else { ?>
                                <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                                <?php } ?></td>
                            
                            <td class="left">Статус клиента</td>
                            <td class="right"><?php echo $column_action; ?></td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if ($coupons) { ?>
                        <?php foreach ($coupons as $coupon) { ?>
                        <tr>
                            <td style="text-align: center;"><?php if ($coupon['selected']) { ?>
                                <input type="checkbox" name="selected[]" value="<?php echo $coupon['coupon_id']; ?>" checked="checked" />
                                <?php } else { ?>
                                <input type="checkbox" name="selected[]" value="<?php echo $coupon['coupon_id']; ?>" />
                                <?php } ?></td>
                            <td class="left"><?php echo $coupon['name']; ?></td>
                            <td style="display: none;" class="left"><?php echo $coupon['code']; ?></td>
                            <td class="right"><?php echo $coupon['discount']; ?></td>
                            <td style="display: none;" class="left"><?php echo $coupon['date_start']; ?></td>
                            <td style="display: none;" class="left"><?php echo $coupon['date_end']; ?></td>
                            <td class="left"><?php echo $coupon['status']; ?></td>
                            <td class="left"><?php echo $coupon['status_client']; ?></td>
                            <td class="right"><?php foreach ($coupon['action'] as $action) { ?>
                                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                                <?php } ?></td>
                        </tr>
                        <?php } ?>
                        <?php } else { ?>
                        <tr>
                            <td class="center" colspan="8"><?php echo $text_no_results; ?></td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </form></div>
        <!---------------------------------------promocode------------------------------------->
           <br><br><div class="box">
        <div class="heading">
            <h1>Промокоды для повышения уровня покупателей</h1>
            <div class="buttons"><a href="<?php echo $insertPromo; ?>" class="button"><?php echo $button_insert; ?></a></div>
        </div>
        <div class="content">
               <table class="list">
                    <thead>
                        <tr>
                            <td class="left">промокод</td>
                            <td class="left">количество использований</td>
                            <td class="left">повышение к</td>
                            <td class="left"></td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if ($promoList) { ?>
                        <?php foreach ($promoList as $key=> $promo) { ?>
                        <tr>                            
                            <td class="left"><?php echo $promo['code']; ?></td>
                            <td class="left"><?php echo $promo['uses']; ?></td>
                            <td class="left"><?php echo $promo['name']; ?></td>                   
                            <td><div class="buttons"><a onclick="document.getElementById('form<?php echo $key ?>').submit();" class="button"><?php echo $button_delete; ?></a></td>
                            <td hidden="true"><form action="<?php echo $deletePromo; ?>" method="post" enctype="multipart/form-data" id="form<? echo $key; ?>">
                                    <input  type="text" value="<?php echo $promo['id']; ?>" name="promo_id"></form></td>
                        </tr>
                        <?php } ?>
                        <?php } else { ?>
                        <tr>
                            <td class="center" colspan="8">Нет промокодов</td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table>
            <div class="pagination"><?php echo $pagination; ?></div>
        </div>
    </div>
</div>
<?php echo $footer; ?>