<?php
    $out = new StdClass();
    $out->status="KO";
    try{
        $dir = 'output';
        $out->data = [];
        $files = array_diff(scandir('../'.$dir), array('..', '.'));
        foreach ($files as $key => $value) {
            array_push($out->data,$dir.'/'.$value);
        }
        $out->status="OK";
    } catch(Exception $ex){
        $out->debug=$ex;
    }
    echo(json_encode($out));
?>