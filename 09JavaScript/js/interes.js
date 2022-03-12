/*
Vamos a realizar una funcion que se encargue de validar la entrada de números por medio de una
expresión regular
*/

function validarn(e){
    var teclado = (document.all)? e.keyCode : e.which;
    if(teclado == 8) return true;
    var patron = /[0-9\d .]/;
    var codigo = String.fromCharCode(teclado);
    return patron.test(codigo);
}

function interes(){

    var valor = document.formulario.cantidad.value;
    var resul = parseInt(valor);
    var interes = resul*0.037;
    var total = interes + resul;

    document.formulario.sueldoI.value= "$" + total;
}

function borrard(){

    document.formulario.cantidad.value="";
    document.formulario.sueldoI.value="";
}