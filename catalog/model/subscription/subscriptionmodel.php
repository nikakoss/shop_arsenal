<?php

class ModelSubscriptionSubscriptionmodel extends Model
{
    public function in_mail($name, $mail){
        $this->db->query("INSERT INTO ". DB_PREFIX ."subscription(Name_sub, Email_sub, Sub_active) VALUES ('".$name."', '".$mail."',1)");
    }
    
}
