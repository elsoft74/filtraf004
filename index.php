<html>

<head>
    <link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3">
    <script src="js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"></script>
    <script type="text/javascript" src="https://oss.sheetjs.com/sheetjs/xlsx.full.min.js"></script>
    <link rel="stylesheet" href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- <link href="css/tabulator.min.css" rel="stylesheet"> -->
    <!-- <link href="css/tabulator_materialize.min.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/sweetalert2.min.css">
    <!-- <script type="text/javascript" src="js/moment-with-locales.min.js"></script> -->
    <!-- <script type="text/javascript" src="js/luxon.min.js"></script> -->
    <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="js/listFiles.js"></script>
    <script type="text/javascript" src="js/upload.js"></script>
    <script type="text/javascript" src="js/clean.js"></script>
    <!-- <script type="text/javascript" src="js/tabulator.min.js"></script> -->
    <!-- <script type="text/javascript" src="js/jquery_wrapper.js"></script> -->
    <!-- <script type="text/javascript" src="js/utils.js"></script> -->
    <!-- <script type="text/javascript" src="js/requests.js"></script> -->
    <!-- <script type="text/javascript" src="js/menu.js"></script> -->
    <!-- <script type="text/javascript" src="js/fasi.js"></script> -->
    <!-- <script type="text/javascript" src="js/login.js"></script> -->
    <!-- <script type="text/javascript" src="js/insert.js"></script> -->
    <!-- <script type="text/javascript" src="js/edit.js"></script> -->
    <!-- <script type="text/javascript" src="js/sweetalert2.all.min.js"></script> -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>

<body>
    <div id="upload" class="container">
        <!-- <form enctype="multipart/form-data" method="post" action="be/upload.php"> -->
        <form enctype="multipart/form-data" method="post">
            <div class="mb-3">
                <label for="formFile" class="form-label">File excel da dividere</label>
                <input class="form-control" name="file" type="file" id="formFile" accept=".xls, .xlsx, .csv">
            </div>
            <div class="mb-3">
                <label for="invia" class="form-check-label">Invia ad usca via e-mail</label>
                <input class="form-check-input" name="invia" type="checkbox" id="invia">
                <label for="cancella" class="form-check-label" id="cancellaLabel">Cancella dopo l'invio dell'e-mail</label>
                <input class="form-check-input" name="cancella" type="checkbox" id="cancella">
            </div>
            <div class="mb-3">
                <input class="button form-control" type="submit" id="submitbutton" onclick="upload()">
            </div>
        </form>
    </div>
    <div class="container">
        <label for="results" class="form-label">File disponibili per il download</label>
        <div id="results" class="mb-3">
        </div>
        <div class="mb-3">
            <input class="button form-control" value="Pulisci" type="submit" id="submitbutton" onclick="clean()">
        </div>
    </div>
    <div id="loader"></div>
    <!-- <div id="firma"><a href="https://ivopugliese.it">©2022 Ivo Pugliese</a></div> -->
    <script>       
        window.onload = function() {
            $("#loader").hide();
            listFiles("#results");
        };
    </script>
</body>

</html>