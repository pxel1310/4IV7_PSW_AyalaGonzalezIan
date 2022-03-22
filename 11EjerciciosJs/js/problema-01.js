// Problema 01
function validarn_problema01(e) {
  var teclado = document.all ? e.keyCode : e.which;
  if (teclado == 8) return true;

  var patron = /[0-9\d .]/;

  var prueba = String.fromCharCode(teclado);
  return patron.test(prueba);
}

function borrar_problema01() {
  document.formulario01.p1_input_c.value = "";
  document.formulario01.p1_input_m.value = "";
  document.formulario01.querySelector("#p1_output").textContent =
    "Esperando datos...";
}

function problema01() {
  var p1_input_c = parseFloat(document.formulario01.querySelector("#p1_input_c").value);
  var p1_input_m = parseInt(
    document.formulario01.querySelector("#p1_input_m").value
  );

  if (p1_input_m < 0) {
    p1_input_m = 0;
    return p1_input_m;
  }
  if (p1_input_m > 48) {
    p1_input_m = 48;
    return p1_input_m;
  }


  var interes = p1_input_c * 0.02 * p1_input_m;
  var p1_output = interes + p1_input_c;

  document.formulario01.querySelector("#p1_output").textContent = "$" + p1_output + " de capital.";
}
