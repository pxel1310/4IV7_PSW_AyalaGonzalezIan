function problema06() {
  var p6_input = document.formulario06.querySelector("#p6_input").value;

  var today = new Date();
  var cumpleanos = new Date(p6_input);
  var edad = today.getFullYear() - cumpleanos.getFullYear();

  var i = today.getMonth() - cumpleanos.getMonth();

  if (i < 0 || (i === 0 && today.getDate() < cumpleanos.getDate())) {
    edad--;
  }

  document.formulario06.querySelector("#p6_output").textContent =
    "La edad es de: " + edad;
}
