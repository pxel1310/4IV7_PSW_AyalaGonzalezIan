// Problema 04
function validarn_problema04(e) {
  var teclado = document.all ? e.keyCode : e.which;
  if (teclado == 8) return true;

  var patron = /[0-9\d .]/;

  var prueba = String.fromCharCode(teclado);
  return patron.test(prueba);
}

function borrar_problema04() {
  document.formulario04.p4_input_1re.value = "";
  document.formulario04.p4_input_2do.value = "";
  document.formulario04.p4_input_3ro.value = "";
  document.formulario04.p4_input_exa.value = "";
  document.formulario04.p4_input_tra.value = "";

  document.formulario04.querySelector("#p4_output").textContent =
    "Esperando datos...";
}

function problema04() {
  if (
    document.formulario04.p4_input_1re.value > 10 ||
    document.formulario04.p4_input_2do.value > 10 ||
    document.formulario04.p4_input_3ro.value > 10 ||
    document.formulario04.p4_input_exa.value > 10 ||
    document.formulario04.p4_input_tra.value > 10
  ) {
    return validarn_problema04(event);
  } else {
    var p4_input_1re = parseFloat(document.formulario04.p4_input_1re.value);
    var p4_input_2do = parseFloat(document.formulario04.p4_input_2do.value);
    var p4_input_3ro = parseFloat(document.formulario04.p4_input_3ro.value);

    var promedio = (p4_input_1re + p4_input_2do + p4_input_3ro) / 3;

    var p4_input_exa = parseFloat(document.formulario04.p4_input_exa.value);
    var p4_input_tra = parseFloat(document.formulario04.p4_input_tra.value);

    var i = promedio * 0.55;
    var j = p4_input_exa * 0.3;
    var k = p4_input_tra * 0.15;

    var p4_output = i + j + k;

    document.formulario04.querySelector("#p4_output").textContent  = p4_output + " calificación final.";
  }
}
