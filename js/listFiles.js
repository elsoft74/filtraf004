function listFiles(target) {
    let xhr = new XMLHttpRequest();
    let url = "be/listFiles.php";
    xhr.open("POST", url, true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            let result = JSON.parse(xhr.responseText);
            if (result.status == "OK") {
                files = result.data;
                div = $("<div>");
                for (file in files) {
                    filepath = files[file];
                    tmp = filepath.split("/");
                    filename = tmp[tmp.length-1];
                    el = $("<a>").attr({"href":filepath,"target":"_blank"}).text(filename);
                    $(div).append(el);
                    el = $("<BR>");
                    $(div).append(el);
                }
                $(target).append(div);
            } else {
                Swal.fire({
                    text: "C'è un problema con il recupero dell'elenco file.",
                    icon: 'error',
                    showCancelButton: false,
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: 'Ok'
                });
            }
        }
    }
    xhr.send();
}