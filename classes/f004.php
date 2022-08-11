<?php
    require '../vendor/autoload.php';
    require_once("db.php");
    ini_set('memory_limit', '512M');
    use PhpOffice\PhpSpreadsheet\IOFactory;
    use PhpOffice\PhpSpreadsheet\Spreadsheet;
    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;
    use PHPMailer\PHPMailer\SMTP;
    
    Class F004{


        public $Cognome;
        public $Nome;
        public $CodiceFiscale;
        public $Sesso;
        public $DataDiNascita;
        public $IdLuogoNascita;
        public $IdLuogoResidenza;
        public $IndirizzoResidenza;
        public $IdLuogoDomicilio;
        public $IndirizzoDomicilio;
        public $IdAspCompetenza;
        public $Telefono;
        public $Mail;
        public $IdCategoria;
        public $AltraCategoria;
        public $Motivo;
        public $IdSintomatologia;
        public $DataInizioSintomi;
        public $Febbre;
        public $Dispnea;
        public $DoloriMuscolari;
        public $MalDiGola;
        public $AlterazioneGusto;
        public $AlterazioneOlfatto;
        public $Cefalea;
        public $DisturbiIntestinali;
        public $Ricovero;
        public $DataRicovero;
        public $IdPresidio;
        public $DataDecesso;
        public $DataEsecuzione;
        public $IdStrutturaEsecuzione;
        public $Metodica;
        public $PositivitaTmp;
        public $hash;
        
        public function __construct($val){
            $this->Cognome = $val['Cognome'];
            $this->Nome = $val['Nome'];
            $this->CodiceFiscale = array_key_exists("IdentificativoPaziente",$val)?strtoupper($val['IdentificativoPaziente']):strtoupper($val['CodiceFiscale']);
            $this->Sesso = $val['Sesso'];
            $this->formattaData($val,'DataDiNascita');
            $this->IdLuogoNascita = $val['IdLuogoNascita'];
            $this->IdLuogoResidenza = $val['IdLuogoResidenza'];
            $this->IndirizzoResidenza = $val['IndirizzoResidenza'];
            $this->IdLuogoDomicilio = $val['IdLuogoDomicilio'];
            $this->IndirizzoDomicilio = $val['IndirizzoDomicilio'];
            $this->IdAspCompetenza = ($val['IdAspCompetenza']=='')?205:$val['IdAspCompetenza'];
            $this->Telefono = $val['Telefono'];
            $this->Mail = $val['Mail'];
            $this->IdCategoria = (($val['IdCategoria']==12 && $val['AltraCategoria']=='')||$val['IdCategoria']=='')?20:$val['IdCategoria'];
            $this->AltraCategoria = $val['AltraCategoria'];
            $this->Motivo = $val['Motivo'];
            $this->IdSintomatologia = $val['IdSintomatologia'];
            $this->formattaData($val,'DataInizioSintomi');
            $this->Febbre = $val['Febbre'];
            $this->Dispnea = $val['Dispnea'];
            $this->DoloriMuscolari = $val['DoloriMuscolari'];
            $this->MalDiGola = $val['MalDiGola'];
            $this->AlterazioneGusto = $val['AlterazioneGusto'];
            $this->AlterazioneOlfatto = $val['AlterazioneOlfatto'];
            $this->Cefalea = $val['Cefalea'];
            $this->DisturbiIntestinali = $val['DisturbiIntestinali'];
            $this->Ricovero = $val['Ricovero'];
            $this->formattaData($val,'DataRicovero');
            $this->IdPresidio = $val['IdPresidio'];
            $this->formattaData($val,'DataDecesso');
            $this->formattaData($val,'DataEsecuzione');
            $this->IdStrutturaEsecuzione = array_key_exists("idStrutturaExt",$val)?$val['idStrutturaExt']:$val['IdStrutturaEsecuzione'];
            $this->Metodica = $val['Metodica'];
            $this->PositivitaTmp = $val['PositivitaTmp'];
            $this->hash=hash("sha256",$this->CodiceFiscale.$this->IdStrutturaEsecuzione.$this->DataEsecuzione.$this->PositivitaTmp);
        }
        



        static function elabora($fileTmpLoc,$etichetta){
            $out = new StdClass();
            $out->status = "KO";
            $out->data = new StdClass();
            
            try {
                if(null!=$fileTmpLoc){
                    $spreadsheets = [];
                    
                    $tmpObj = new StdClass();
                    $tmpObj->spread = F004::inizializza();
                    $tmpObj->spreadArray = [];
                    $spreadsheets['ALTRI']=$tmpObj;
                    $tmpObj = new StdClass();
                    $tmpObj->spread = F004::inizializza();
                    $tmpObj->spreadArray = [];
                    $spreadsheets['F004']=$tmpObj;
                    $tmpObj = new StdClass();
                    $tmpObj->spread = F004::inizializza();
                    $tmpObj->spreadArray = [];
                    $spreadsheets['ESISTENTI']=$tmpObj;
                    
                    $reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReaderForFile($fileTmpLoc);
                    $reader->setReadDataOnly(true);
                    $spreadsheet = $reader->load($fileTmpLoc);
                    $worksheet = $spreadsheet->getActiveSheet();//->toArray(null, true, true, true);
                    $rows = [];
                    foreach ($worksheet->getRowIterator() AS $row) {
                        $cellIterator = $row->getCellIterator();
                        $cellIterator->setIterateOnlyExistingCells(FALSE); // This loops through all cells,
                        $cells = [];
                        foreach ($cellIterator as $cell) {
                            $cells[] = $cell->getValue();
                        }
                        if (isset($keys)) {
                            $rows[] = array_combine($keys, $cells);
                        } else {
                            $keys = $cells;
                        }
                    }
                    foreach($rows as $row){
                        $elemento = new F004($row);
                        switch($elemento->controlla()){
                            case "F":
                                array_push($spreadsheets['F004']->spreadArray,$elemento->asArray());
                                break;
                            case "E":
                                array_push($spreadsheets['ESISTENTI']->spreadArray,$elemento->asArray());
                                break;
                            case "A":
                                array_push($spreadsheets['ALTRI']->spreadArray,$elemento->asArray());
                                break;
                        }
                    }   
                    F004::genera($spreadsheets['ALTRI'],"F004_ALTRI_".$etichetta);
                    F004::genera($spreadsheets['F004'],"F004_".$etichetta);
                    F004::genera($spreadsheets['ESISTENTI'],"F004_ESISTENTI_".$etichetta);

                    $out->status="OK";
                } else {
                    throw new Exception("Impossibile leggere il file");
                }

            } catch (Exception $ex){
                $out->error = $ex->getMessage();
            }
            
            return $out;   
        }

        static function inizializza(){
            $spreadsheet = new Spreadsheet();
            $spreadsheet->setActiveSheetIndex(0);
            $spreadsheet->getActiveSheet()
                ->setCellValue('A1', 'Cognome')
                ->setCellValue('B1', 'Nome')
                ->setCellValue('C1', 'CodiceFiscale')
                ->setCellValue('D1', 'Sesso')
                ->setCellValue('E1', 'DataDiNascita')
                ->setCellValue('F1', 'IdLuogoNascita')
                ->setCellValue('G1', 'IdLuogoResidenza')
                ->setCellValue('H1', 'IndirizzoResidenza')
                ->setCellValue('I1', 'IdLuogoDomicilio')
                ->setCellValue('J1', 'IndirizzoDomicilio')
                ->setCellValue('K1', 'IdAspCompetenza')
                ->setCellValue('L1', 'Telefono')
                ->setCellValue('M1', 'Mail')
                ->setCellValue('N1', 'IdCategoria')
                ->setCellValue('O1', 'AltraCategoria')
                ->setCellValue('P1', 'Motivo')
                ->setCellValue('Q1', 'IdSintomatologia')
                ->setCellValue('R1', 'DataInizioSintomi')
                ->setCellValue('S1', 'Febbre')
                ->setCellValue('T1', 'Dispnea')
                ->setCellValue('U1', 'DoloriMuscolari')
                ->setCellValue('V1', 'MalDiGola')
                ->setCellValue('W1', 'AlterazioneGusto')
                ->setCellValue('X1', 'AlterazioneOlfatto')
                ->setCellValue('Y1', 'Cefalea')
                ->setCellValue('Z1', 'DisturbiIntestinali')
                ->setCellValue('AA1', 'Ricovero')
                ->setCellValue('AB1', 'DataRicovero')
                ->setCellValue('AC1', 'IdPresidio')
                ->setCellValue('AD1', 'DataDecesso')
                ->setCellValue('AE1', 'DataEsecuzione')
                ->setCellValue('AF1', 'IdStrutturaEsecuzione')
                ->setCellValue('AG1', 'Metodica')
                ->setCellValue('AH1', 'PositivitaTmp');
            return $spreadsheet;
        }

        static function salva($file,$label){
            $out = "Non inviata";
            date_default_timezone_set("Etc/UTC");
            $now=new DateTime();            
            $file->getActiveSheet()->getStyle('E:E')->getNumberFormat()->setFormatCode('dd/mm/yyyy');
            $file->getActiveSheet()->getStyle('R:R')->getNumberFormat()->setFormatCode('dd/mm/yyyy');
            $file->getActiveSheet()->getStyle('AB:AB')->getNumberFormat()->setFormatCode('dd/mm/yyyy');
            $file->getActiveSheet()->getStyle('AD:AD')->getNumberFormat()->setFormatCode('dd/mm/yyyy');
            $file->getActiveSheet()->getStyle('AE:AE')->getNumberFormat()->setFormatCode('dd/mm/yyyy');
            $file->getActiveSheet()->freezePane('A2');
            $file->getActiveSheet()->getStyle("A:AH")->getFont()->setSize(11);
            foreach(range('A','AH') as $columnID) {
                $file->getActiveSheet()->getColumnDimension($columnID)
                    ->setAutoSize(true);
            }
            $file->getActiveSheet()->setAutoFilter(
                $file->getActiveSheet()
                    ->calculateWorksheetDimension()
            );
            $file->getActiveSheet()->getAutoFilter()->setRangeToMaxRow();
            $writer = new \PhpOffice\PhpSpreadsheet\Writer\Xlsx($file);
            $filename = $label.".xlsx";
            $pathAndName="../output/".$filename;
            $writer->save($pathAndName);           
            return $out;
        }

        function controlla(){
            $out = ""; // Assumerà il valore "E"->esistente "F"->F004 "A"->ALTRI
            if(!$this->checkIdStrutturaIsASP()){
                $this->pulisciNomeCognome();
                $this->pulisciContatti();
                $this->pulisciMotivo();
                if ($this->checkCF()){
                    $out=$this->checkIsNew();
                    if("E"!==$out){
                        DB::inserisci($this->hash);
                        $out="F";
                    }
                    } else {
                        $out = "A";
                    }
                }
            return $out;
        }

        static function genera($data,$label){
            if ($data->spreadArray){
                $data->spread->getActiveSheet()->fromArray($data->spreadArray, null, 'A2');
                F004::salva($data->spread,$label);
            }
        }

        function checkCF(){
            $this->CodiceFiscale=trim($this->CodiceFiscale);
            $this->CodiceFiscale=trim($this->CodiceFiscale,"$");
            return strlen($this->CodiceFiscale)==16;
        }
        
        function checkIsNew(){
            $out = DB::esiste($this->hash);
            //var_dump($out);
            return($out->data=="1")?"E":"F";
        }

        function pulisciNomeCognome(){
            $keys=['Nome','Cognome'];
            foreach($keys as $key){
                $this->$key=str_replace("`","'",$this->$key);
                $this->$key=str_replace("-"," ",$this->$key);
                $this->$key=str_replace("_"," ",$this->$key);
                $this->$key=str_replace("À","A'",$this->$key);
                $this->$key=str_replace("È","E'",$this->$key);
                $this->$key=str_replace("Ì","I'",$this->$key);
                $this->$key=str_replace("Ò","O'",$this->$key);
                $this->$key=str_replace("Ù","U'",$this->$key);
                $this->$key=str_replace("à","a'",$this->$key);
                $this->$key=str_replace("è","e'",$this->$key);
                $this->$key=str_replace("é","e'",$this->$key);
                $this->$key=str_replace("ì","i'",$this->$key);
                $this->$key=str_replace("ò","o'",$this->$key);
                $this->$key=str_replace("ù","u'",$this->$key);
            }

        }

        function pulisciContatti(){
            $invalide=array("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","(",")","-","/",".","//","\\",",","à","è","é","ì","ò","ù");
            //$numeriinvalidi=array("0","00","000","0000");
            $this->Telefono=strtolower($this->Telefono);
            $this->Telefono=str_replace($invalide,"",$this->Telefono);
            $this->Telefono=str_replace("  "," ",$this->Telefono);
            if (strlen($this->Telefono)<7 || intval($this->Telefono)==0){
                $this->Telefono="";
            }
            $this->Mail=strtolower($this->Mail);
            $this->Mail=str_replace("@@","@",$this->Mail);
            $this->Mail=str_replace("@.","@",$this->Mail);
            $this->Mail=str_replace(".@","@",$this->Mail);
            //if(in_array($this->Telefono,$numeriinvalidi)){
            //    $this->Telefono="";
            //}
        }

        function pulisciMotivo(){

            // $valide=array("SCREENING","CONTACT TRACING");
            // if (!in_array(strtoupper($this->Motivo),$valide)){
                $this->Motivo="SCREENING";
            // }
        }

        function formattaData($val,$key){
            $this->$key = $val[$key];
            $this->$key = str_replace(" GEN ","-01-",strtoupper($this->$key));
            $this->$key = str_replace(" JAN ","-01-",strtoupper($this->$key));
            $this->$key = str_replace(" FEB ","-02-",strtoupper($this->$key));
            $this->$key = str_replace(" MAR ","-03-",strtoupper($this->$key));
            $this->$key = str_replace(" APR ","-04-",strtoupper($this->$key));
            $this->$key = str_replace(" MAG ","-05-",strtoupper($this->$key));
            $this->$key = str_replace(" MAY ","-05-",strtoupper($this->$key));
            $this->$key = str_replace(" GIU ","-06-",strtoupper($this->$key));
            $this->$key = str_replace(" JUN ","-06-",strtoupper($this->$key));
            $this->$key = str_replace(" LUG ","-07-",strtoupper($this->$key));
            $this->$key = str_replace(" JUL ","-07-",strtoupper($this->$key));
            $this->$key = str_replace(" AGO ","-08-",strtoupper($this->$key));
            $this->$key = str_replace(" AUG ","-08-",strtoupper($this->$key));
            $this->$key = str_replace(" SET ","-09-",strtoupper($this->$key));
            $this->$key = str_replace(" SEP ","-09-",strtoupper($this->$key));
            $this->$key = str_replace(" OTT ","-10-",strtoupper($this->$key));
            $this->$key = str_replace(" OCT ","-10-",strtoupper($this->$key));
            $this->$key = str_replace(" NOV ","-11-",strtoupper($this->$key));
            $this->$key = str_replace(" DIC ","-12-",strtoupper($this->$key));
            $this->$key = str_replace(" DEC ","-12-",strtoupper($this->$key));
        }

        function checkIdStrutturaIsASP(){
            return ("190205"==$this->IdStrutturaEsecuzione || 190205==$this->IdStrutturaEsecuzione);
        }

        function asArray(){
            $out=[];
            $out['Cognome'] = $this->Cognome;
            $out['Nome'] = $this->Nome;
            $out['CodiceFiscale'] = $this->CodiceFiscale;
            $out['Sesso'] = $this->Sesso;
            $out['DataDiNascita'] = $this->DataDiNascita;
            $out['IdLuogoNascita'] = $this->IdLuogoNascita;
            $out['IdLuogoResidenza'] = $this->IdLuogoResidenza;
            $out['IndirizzoResidenza'] = $this->IndirizzoResidenza;
            $out['IdLuogoDomicilio'] = $this->IdLuogoDomicilio;
            $out['IndirizzoDomicilio'] = $this->IndirizzoDomicilio;
            $out['IdAspCompetenza'] = $this->IdAspCompetenza;
            $out['Telefono'] = $this->Telefono;
            $out['Mail'] = $this->Mail;
            $out['IdCategoria'] = $this->IdCategoria;
            $out['AltraCategoria'] = $this->AltraCategoria;
            $out['Motivo'] = $this->Motivo;
            $out['IdSintomatologia'] = $this->IdSintomatologia;
            $out['DataInizioSintomi'] = $this->DataInizioSintomi;
            $out['Febbre'] = $this->Febbre;
            $out['Dispnea'] = $this->Dispnea;
            $out['DoloriMuscolari'] = $this->DoloriMuscolari;
            $out['MalDiGola'] = $this->MalDiGola;
            $out['AlterazioneGusto'] = $this->AlterazioneGusto;
            $out['AlterazioneOlfatto'] = $this->AlterazioneOlfatto;
            $out['Cefalea'] = $this->Cefalea;
            $out['DisturbiIntestinali'] = $this->DisturbiIntestinali;
            $out['Ricovero'] = $this->Ricovero;
            $out['DataRicovero'] = $this->DataRicovero;
            $out['IdPresidio'] = $this->IdPresidio;
            $out['DataDecesso'] = $this->DataDecesso;
            $out['DataEsecuzione'] = $this->DataEsecuzione;
            $out['IdStrutturaEsecuzione'] = $this->IdStrutturaEsecuzione;
            $out['Metodica'] = $this->Metodica;
            $out['PositivitaTmp'] = $this->PositivitaTmp;
            return $out;
        }

        static function rimuoviChiaviNonValide($row){
            $valids=array(
            'Cognome',
            'Nome',
            'CodiceFiscale',
            'Sesso',
            'DataDiNascita',
            'IdLuogoNascita',
            'IdLuogoResidenza',
            'IndirizzoResidenza',
            'IdLuogoDomicilio',
            'IndirizzoDomicilio',
            'IdAspCompetenza',
            'Telefono',
            'Mail',
            'IdCategoria',
            'AltraCategoria',
            'Motivo',
            'IdSintomatologia',
            'DataInizioSintomi',
            'Febbre',
            'Dispnea',
            'DoloriMuscolari',
            'MalDiGola',
            'AlterazioneGusto',
            'AlterazioneOlfatto',
            'Cefalea',
            'DisturbiIntestinali',
            'Ricovero',
            'DataRicovero',
            'IdPresidio',
            'DataDecesso',
            'DataEsecuzione',
            'IdStrutturaEsecuzione',
            'Metodica',
            'PositivitaTmp');
            $keys = array_keys($row);
            foreach($keys as $key){
                if (!in_array($key,$valids)){
                    unset($row[$key]);
                }
            }
        }
    }
