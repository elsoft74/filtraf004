<?php
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);
    include_once("../classes/f004.php");
    $out = new StdClass();
    $out->status="KO";
    //$out->head=getallheaders();
    try{
        $fileTmpLoc = [];
        foreach ($_FILES as $file){
            array_push($fileTmpLoc,$file['tmp_name']);
        }
        $etichetta=array_key_exists("etichetta",$_POST)?$_POST["etichetta"]:"";
        $out=F004::elabora($fileTmpLoc,$etichetta);
        // $out->debug=print_r($_FILES,false);
        $out->status="OK";
    } catch(Exception $ex){
        $out->error=$ex->getMessage();
        // $out->debug=print_r($_FILES,false);
    }
    echo(json_encode($out));
?>
