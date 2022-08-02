function clean() {
    let xhr = new XMLHttpRequest();
    let url = "be/clean.php";
    xhr.open("POST", url, true);
    xhr.onreadystatechange = function () {
        try {
            if (xhr.readyState === 4) {
                $("#loader").hide();
                if (xhr.status === 200) {
                    let result = JSON.parse(xhr.responseText);
                    if (result.status == "OK") {
                        location.reload();
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
    xhr.send();
    event.preventDefault();
}