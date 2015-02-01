<?php

class subscription_model extends Model
{
    public function in_mail($name, $mail){
        var_dump($mail);
        $this->db->query("insert into oc_subscription(Name_sub, Email_sub) values ('".$name."', '".$mail."')");
    }
    
}
