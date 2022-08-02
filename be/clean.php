<?php
    // ini_set('display_errors', 1);
    // ini_set('display_startup_errors', 1);
    // error_reporting(E_ALL);
    $out = new StdClass();
    $out->status="KO";
    try{
        $out->data=shell_exec("rm -f ../output/*.xlsx");
        $out->status="OK";
    } catch(Exception $ex){
        $out->error=$ex->getMessage();
    }
    echo(json_encode($out));
?>