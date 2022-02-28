/*
javascript es un lenguaje que posee un paradigma
orientado a objetos y a funciones, por tal motivo presenta
una presenta una particulariadad la cual es: No tipado

Variables tipo -> VAR

De acuerdo al Estandar ES6 se maneja 3 tipos de variables:

VAR
LET es una variable tipo "protected"
CONST

*/

function validar(formulario){
    //obtener los datos y discriminar a los que tiene 3 lestras
    if(formulario.nombre.value.length < 5){
        alert("Escriba por lo menos 5 caracteres en el campo del Nombre")
        formulario.nombre.focus();
        return false;
    }

    var checkOK = "QWERTYUIOPÄSDFGHJKLÑZXCVBNM"
    + "qwertyuiopasdfghjklñzxcvbnm";

    var checkStr = formulario.nombre.value;

    var todoesvalido = true;

    for(var i=0; i < checkStr.length; i++){
        var ch = checkStr.charAt(i);

        for (var j=0; j < checkOK.length; j++){
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
        alert("Escriba unicamente lentras en el campo Nombre")
        formulario.nombre.focus();
        return false;
    }
    var checkOK = "0123456789"

    var checkStr = formulario.edad.value;

    var todoesvalido = true;

    for(var i=0; i < checkStr.length; i++){
        var ch = checkStr.charAt(i);

        for (var j=0; j < checkOK.length; j++){
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
        alert("Escriba unicamente lentras en el campo Nombre")
        formulario.edad.focus();
        return false;
    }

    var txt = formulario.email,values;

    //expresiones regulares
    var b = /^[^@\s]+[^@\.\s]+(\.[^@\.\s]+$)/;

    alert("Email " + (b.test(txt)?" ":"No")+" Valido");
    return b.test;
}