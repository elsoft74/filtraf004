function upload() {
    var f = $("#formFiles").prop("files");
    if (f == undefined) {
        Swal.fire({
            text: "Nessun file da dividere.",
            icon: 'error',
            showCancelButton: false,
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'Ok'
        });
    }
    let xhr = new XMLHttpRequest();
    let url = "be/upload.php";
    var formData = new FormData();
    formData.append("invia",$("#invia").prop("checked"));
    formData.append("files", f.length);
    for (i=0;i<f.length;i++){
        formData.append("file"+i,f[i]);
    }
    formData.append("etichetta",$("#formEtichetta").val());

    xhr.open("POST", url, true);
    xhr.onreadystatechange = function () {
        try {
            if (xhr.readyState === 4) {
                $("#loader").hide();
                if (xhr.status === 200) {
                    let result = JSON.parse(xhr.responseText);
                    if (result.status == "OK") {
                        Swal.fire({
                            text: "Operazione completata.\n" + JSON.stringify(result.data),
                            icon: 'info',
                            showCancelButton: false,
                            confirmButtonColor: '#3085d6',
                            confirmButtonText: 'Ok'
                        }).then(() => {
                            location.reload();
                        });
                    } else if (result.status == "KO") {
                        throw result.error;
                    } else {
                        throw "Errore nella risposta.";
                    }
                } else {
                    throw "Stato della risposta: " + xhr.status;
                }
            }
        } catch (error) {
            Swal.fire({
                text: "File non elaborato.\n" + error,
                icon: 'error',
                showCancelButton: false,
                confirmButtonColor: '#3085d6',
                confirmButtonText: 'Ok'
            }).then(() => {
                location.reload();
            }
            );
        }

    }
    $("#loader").show();
    xhr.send(formData);
    event.preventDefault();
}