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

        public static function esiste($hashkey){
            $out = new StdClass();
            $conn = DB::conn();
            if ($conn != null){
                try {
                    $query = "SELECT count(id) AS presente FROM `inseriti` WHERE `hashkey` =:hashkey";
                    $stmt = $conn->prepare($query);
                    $stmt->bindParam(':hashkey',$hashkey,PDO::PARAM_STR);
                    $stmt->execute();
                    $res=$stmt->fetch(PDO::FETCH_ASSOC);
                    $out->data=($res)?$res['presente']:0;
                    $out->status="OK";
                } catch(Exception $ex){
                        $out->error=$ex->getMessage();
                    }
            }
            return $out;
        }

        public static function inserisci($hashkey){
            $out = new StdClass();
            $out->statut="KO";
            $conn = DB::conn();
            if ($conn != null){
                try {
                    $query = "INSERT INTO `inseriti` (`hashkey`) VALUES (:hashkey)";
                    $stmt = $conn->prepare($query);
                    $stmt->bindParam(':hashkey',$hashkey,PDO::PARAM_STR);
                    $stmt->execute();
                    $out->status="OK";
                } catch(Exception $ex){
                        $out->error=$ex->getMessage();
                    }
            }
            return $out;
        }
    }
?>
