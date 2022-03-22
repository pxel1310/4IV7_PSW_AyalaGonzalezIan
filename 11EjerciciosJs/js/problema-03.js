// Problema 03
function validarn_problema03(e) {
  var teclado = document.all ? e.keyCode : e.which;
  if (teclado == 8) return true;

  var patron = /[0-9\d .]/;

  var prueba = String.fromCharCode(teclado);
  return patron.test(prueba);
}

function borrar_problema03() {
  document.formulario03.p3_input.value = "";
  document.formulario03.querySelector("#p3_output_des").textContent =
    "Esperando datos...";
  document.formulario03.querySelector("#p3_output_final").textContent =
    "Esperando datos...";
}

function problema03() {
  var p3_input = parseInt(document.formulario03.querySelector("#p3_input").value);
  var interes = p3_input * 0.1;
  var total = p3_input - interes;

  var p3_output_des = interes.toFixed(2);
  var p3_output_final = total.toFixed(2);

  document.formulario03.querySelector("#p3_output_des").textContent =
    "$" + p3_output_des + " descuento.";
  document.formulario03.querySelector("#p3_output_final").textContent =
    "$" + p3_output_final + " precio final.";
}
