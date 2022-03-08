function algoritmo(){
    function validar(){ //Funcion para comprobar que los datos han sido ingresados correctamente
        for(var i = 0; i < checkStr.length; i++){ //La funcion es recutilizada del 06Formulario
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
    }
    
    var auto_valor = parseFloat (document.interescompuesto.auto_valor.value);
    var periodo = parseFloat (document.interescompuesto.periodo.value);
    var interes = 0.0394
    var final = auto_valor*Math.pow(1.0+interes/5/100,periodo);
    document.interescompuesto.final.value = final; //Operación para el interes compuesto 

    //Valor del Auto
    var checkOK = "0123456789.";
    var checkStr = interescompuesto.auto_valor.value;
    var todoesvalido = true;
    
    if(interescompuesto.auto_valor.value.length < 8 || interescompuesto.auto_valor.value.length > 9){
        alert("Escriba por lo menos una cantidad a partir de 100,000.00, hasta 1,000,000.00");
        interescompuesto.auto_valor.focus();
        return false;
    }
    
    validar

    if(!todoesvalido){
        alert("Solo ingresa numeros en: Valor del Automovil");
        interescompuesto.auto_valor.focus();
        return false;
    }

    //Cuota Inicial
    var checkOK = "0123456789.";    
    var checkStr = interescompuesto.cuota_inicial.value;
    var todoesvalido = true;

    if(interescompuesto.cuota_inicial.value > auto_valor*10/100){
        alert("Escriba la cuota incial correctamente (10% de valor auto)");
        interescompuesto.cuota_inicial.focus();
        return false;
    }
    
    validar

    if(!todoesvalido){
        alert("Solo ingresa numeros en: Cuota incial");
        interescompuesto.cuota_inicial.focus();
        return false;
    }

    //Periodo
    var checkOK = "123689";    
    var checkStr = interescompuesto.periodo.value;
    var todoesvalido = true;
    
    if(interescompuesto.periodo.value != 3 || interescompuesto.periodo.value != 6 || interescompuesto.periodo.value != 9 || interescompuesto.periodo.value != 12 || interescompuesto.periodo.value != 18 ){
        alert("Solo los numeros: 3, 6, 9, 12, 18");
        interescompuesto.periodo.focus();
        return false;
    }

    validar
}
