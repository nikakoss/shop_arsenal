<?php

class ModelSubscriptionSubscriptionmodel extends Model
{
    public function in_mail($mail){
        $this->db->query("INSERT INTO ". DB_PREFIX ."subscription(Email_sub, Sub_active) VALUES ('".$mail."',1)");
    }
    
}
