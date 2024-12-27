$.ajax({
    url: "http://192.168.49.2:30080",  // A URL correta que irá acessar o serviço PHP no Kubernetes
    type: "post",
    data: {nome: txt_nome, comentario: txt_comentario, email: txt_email},
    beforeSend: function() {
        console.log("Tentando enviar os dados....");
    }
}).done(function(e) {
    alert("Dados Salvos");
})
