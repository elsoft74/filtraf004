<?php
    include_once("../config/config.php");
    class DB {       
        public static function conn(){
            $msg="ERRORE DI CONNESSIONE";
            try {
                $dsn = 'mysql:host='.SERVER.';dbname='.DBNAME;
                $options = array(
                    PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
                ); 
                $conn = new PDO($dsn, UNAME, PASSWORD, $options);
                $msg="CONNESSO";
            } catch(Exception $e){
                $conn=null;
            }
            //file_put_contents("../log/dbtest.log",(new DateTime("now"))->format("Y-m-d H:i").$msg."\n",FILE_APPEND);
            return $conn;
        }

        public static function getUscaFromLocalita($localita) {
            $out = new stdClass();
            $out->status="KO";
            $out->data="";
            $conn = DB::conn();
            if ($conn != null){
                try {
                    $query = "SELECT chiave FROM `localita` JOIN `usca` ON `usca`.id=`localita`.`id_usca` WHERE `localita`.`nome` = UPPER(:localita)";
                    $stmt = $conn->prepare($query);
                    $stmt->bindParam(':localita',$localita,PDO::PARAM_STR);
                    $stmt->execute();
                    if($stmt->rowCount()>1){
                        $out->data="";
                    } else {
                        $res=$stmt->fetch(PDO::FETCH_ASSOC);
                        $out->data=($res)?$res['chiave']:"";
                    }
                    $out->status="OK";
                } catch(Exception $ex){
                        $out->error=$ex->getMessage();
                    }
            }
            return $out;
        }

        public static function getChiaviUsca(){
            $out = new stdClass();
            $out->status="KO";
            $out->data="";
            $conn = DB::conn();
            if ($conn != null){
                try {
                    $query = "SELECT chiave FROM `usca` WHERE is_active = 1";
                    $stmt = $conn->prepare($query);
                    $stmt->execute();
                    $res=$stmt->fetchAll(PDO::FETCH_ASSOC);
                    $out->data=[];
                    foreach($res as $chiave){
                        array_push($out->data,$chiave['chiave']);
                    }
                    $out->status="OK";
                } catch(Exception $ex){
                        $out->error=$ex->getMessage();
                    }
            }
            return $out;
        }

        public static function getUscaLabel($key){
            $out = new stdClass();
            $out->status="KO";
            $out->data="";
            $conn = DB::conn();
            if ($conn != null){
                try {
                    $query = "SELECT descrizione FROM `usca` WHERE chiave =UPPER(:chiave)";
                    $stmt = $conn->prepare($query);
                    $stmt->bindParam(':chiave',$key,PDO::PARAM_STR);
                    $stmt->execute();
                    $res=$stmt->fetch(PDO::FETCH_ASSOC);
                    $descrizione=($res)?$res['descrizione']:"";
                    if($descrizione!=""){
                        $out->data=$descrizione;
                        $out->status="OK";
                    }
                } catch(Exception $ex){
                        $out->error=$ex->getMessage();
                    }
            }
            return $out;
        }

        public static function getUscaMail($key){
            $out = new stdClass();
            $out->status="KO";
            $out->data="";
            $conn = DB::conn();
            if ($conn != null){
                try {
                    $query = "SELECT email FROM `usca` WHERE chiave =UPPER(:chiave)";
                    $stmt = $conn->prepare($query);
                    $stmt->bindParam(':chiave',$key,PDO::PARAM_STR);
                    $stmt->execute();
                    $res=$stmt->fetch(PDO::FETCH_ASSOC);
                    $email=($res)?$res['email']:"";
                    if($email!=""){
                        $out->data=$email;
                        $out->status="OK";
                    }
                } catch(Exception $ex){
                        $out->error=$ex->getMessage();
                    }
            }
            return $out; 
        }
    }
?>
