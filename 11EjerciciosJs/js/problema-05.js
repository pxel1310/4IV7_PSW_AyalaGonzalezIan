// Problema 05
function validarn_problema05(e) {
  var teclado = document.all ? e.keyCode : e.which;
  if (teclado == 8) return true;

  var patron = /[0-9\d .]/;

  var prueba = String.fromCharCode(teclado);
  return patron.test(prueba);
}

function borrar_problema05() {
  document.formulario05.p5_input_h.value = "";
  document.formulario05.p5_input_m.value = "";
  document.formulario05.querySelector("#p5_output").textContent =
    "Esperando datos...";
  document.formulario05.querySelector("#p5_output_h").textContent =
    "Esperando datos...";
  document.formulario05.querySelector("#p5_output_m").textContent =
    "Esperando datos...";
}

function problema05() {
  var p5_input_h = parseInt(
    document.formulario05.querySelector("#p5_input_h").value
  );
  var p5_input_m = parseInt(
    document.formulario05.querySelector("#p5_input_m").value
  );

  var p5_output = p5_input_h + p5_input_m;

  var p5_output_h = (p5_input_h / p5_output) * 100;
  var p5_output_m = (p5_input_m / p5_output) * 100;

  document.formulario05.querySelector("#p5_output").textContent =
    "Alumnos: " + p5_output;
  document.formulario05.querySelector("#p5_output_h").textContent =
    "Hombres: % " + p5_output_h;
  document.formulario05.querySelector("#p5_output_m").textContent =
    "Mujeres: % " + p5_output_m;
}
