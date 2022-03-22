// Problema 02
function validarn_problema02(e) {
  var teclado = document.all ? e.keyCode : e.which;
  if (teclado == 8) return true;

  var patron = /[0-9\d .]/;

  var prueba = String.fromCharCode(teclado);
  return patron.test(prueba);
}

function borrar_problema02() {
  document.formulario02.p2_input.value = "";
  document.formulario02.querySelector("#p2_output_com").textContent =
    "Esperando datos...";
    document.formulario02.querySelector("#p2_output_total").textContent =
    "Esperando datos...";
}

function problema02() {
  var p2_input = document.formulario02.querySelector("#p2_input").value;
  var p2_input = parseInt(p2_input);
  var interes = (p2_input * 0.1) * 3;
  var total = interes + p2_input;

  var p2_output_com = interes.toFixed(2);
  var p2_output_total = total.toFixed(2);

  document.formulario02.querySelector("#p2_output_com").textContent  = "$" + p2_output_com + " concepto de comisiones.";
  document.formulario02.querySelector("#p2_output_total").textContent  = "$" + p2_output_total + " totales.";
}
