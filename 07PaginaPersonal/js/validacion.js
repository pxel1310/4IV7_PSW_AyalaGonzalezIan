function validar(formulario){
    if(formulario.nombre.value.length < 5){
        alert("Escriba por lo menos 5 caracteres en el campo Nombre");
        formulario.nombre.focus();
        return false;
    }
    var checkOK = "QWERTUIOPASDFGHJKLÑZXCVBNM" + "qwertyuiopasdfghjklñzxcvbnm";
    var checkStr = formulario.nombre.value;
    var todoesvalido = true;

    for(var i = 0; i < checkStr.length; i++){
        var ch = checkStr.charAt(i);
        for(var j = 0; j < checkOK.length; j++){
            if(ch == checkOK.charAt(j)){
                break;
            }
            
        }
        if(j == checkOK.length){
            todoesvalido = false;
            break;
        }
    }

    if(!todoesvalido){
        alert("Escriba unicamente letras en el campo Nombre");
        formulario.nombre.focus();
        return false;
    }

    var txt = formulario.email.value;
    var b = /^[^@\s]+[^@\.\s]+(\.[^@\.\s]+)+$/;
    alert("Email " + (b.test(txt)?" ":" no ")+" valido");
    return b.test;

}