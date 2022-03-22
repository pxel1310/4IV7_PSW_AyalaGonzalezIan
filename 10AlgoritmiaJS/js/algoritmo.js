function validarn(e){
  var teclado = (document.all)? e.keyCode : e.which;
  if(teclado == 8) return true;
  var patron = /[0-9\d .]/;
  var codigo = String.fromCharCode(teclado);
  return patron.test(codigo);
}

//Problema 1
function problema1() {

  var p1_input = document.getElementById("p1-input").value;
  var p1_frase = p1_input.split(" ").reverse();
  var p1_newStr = " ";


  p1_frase.forEach(function (palabra, i) {
    if (i != 0 || i != p1_frase.length) {
      p1_newStr += " ";
      p1_newStr += palabra;
    }
  });

  document.getElementById("p1-output").textContent = p1_newStr;
}

//Problema 2
function problema2(){

  var x1 = document.querySelector('#p2-x1').value;
  var x2 = document.querySelector('#p2-x2').value;
  var x3 = document.querySelector('#p2-x3').value;
  var x4 = document.querySelector('#p2-x4').value;
  var x5 = document.querySelector('#p2-x5').value;

  var y1 = document.querySelector('#p2-y1').value;
  var y2 = document.querySelector('#p2-y2').value;
  var y3 = document.querySelector('#p2-y3').value;
  var y4 = document.querySelector('#p2-y4').value;
  var y5 = document.querySelector('#p2-y5').value;

  var vector1 = [x1, x2, x3, x4, x5];
  var vector2 = [y1, y2, y3, y4, y5];

  vector1 = vector1.sort(function (x, y){
      return x - y;
  });
  
  vector2 = vector2.sort(function (x, y){
      return x - y;
  });

  vector2 = vector2.reverse();

  var p2_resultado = 0;

  for(i = 0; i < vector1.length; i++){
      p2_resultado = p2_resultado + (vector1[i]*vector2[i]);
  }
  
  document.querySelector('#p2-output').textContent = 'Producto escalar mínimo: ' + p2_resultado;
}


// Problema 3
function problema3() {
  //definir un albeto
  var alfabeto = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "Ñ",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
  ];

  //Obtener la cadena del input y separar por comas

  var p3_input = document.getElementById("p3-input").value;

  var p3_palabras = p3_input.split(",");

  //eliminar el espacio que hay entre cada palabra
  p3_palabras = p3_palabras.map(function (palabra) {
    return palabra.replace(/\s/g, "").toUpperCase();
  });

  //calcular los caracteres unicos de cada palabra

  var p3_res = "";

  //iterar en cada palabra

  p3_palabras.forEach(function (palabra, i) {
    //separar las palabras en un array para leer cada letra
    var letras_unicas = [];
    var palabra_array = palabra.split("");
    //iterar al alfabeto
    alfabeto.forEach(function (letra, j) {
      //iterar por palabra
      palabra_array.forEach(function (letra_palabra, k) {
        //comprobar que la letra esta dentro del alfabeto
        if (letra_palabra == letra) {
          //si la letra no la hemos contado, la agregamos a un array
          //para contar las letras unicas
          if (letras_unicas.indexOf(letra) < 0) {
            letras_unicas.push(letra);
          }
        }
      });
    });
    p3_res += "Palabra: " + palabra + " = " + letras_unicas.length + "\n";
  });

  document.getElementById("p3-output").textContent = p3_res;
}
