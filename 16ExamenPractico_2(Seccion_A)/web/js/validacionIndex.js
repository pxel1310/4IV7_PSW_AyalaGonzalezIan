const email = document.getElementById("pro_email");
const password = document.getElementById("pro_contrasena");

form.addEventListener("submit", (e) => {
  e.preventDefault();

  checkInputs();
});

function checkInputs() {
  const emailValue = email.value.trim();
  const passwordValue = password.value.trim();

  if (emailValue === "") {
    setErrorFor(email, "No puede dejar el email en blanco");
  } else if (!isEmail(emailValue)) {
    setErrorFor(email, "No ingreso un email válido");
  } else {
    setSuccessFor(email);
  }
  if (passwordValue === "") {
    setErrorFor(password, "Password no debe ingresar en blanco.");
  } else {
    setSuccessFor(password);
  }
}

function setErrorFor(input, message) {
  const formControl = input.parentElement;
  const small = formControl.querySelector("small");
  formControl.className = "form-control error";
  small.innerText = message;
}

function setSuccessFor(input) {
  const formControl = input.parentElement;
  formControl.className = "form-control success";
}

function isEmail(email) {
  return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(
    email
  );
}

function validarn(e) {
  var teclado = document.all ? e.keyCode : e.which;
  
  if (teclado === 8) return true;

  var patron = /[0-9\d .]/;

  var prueba = String.fromCharCode(teclado);
  return patron.test(prueba);
}

function validar(formulario) {

  if (formulario.nombre.value.length < 3) {
    alert("Por favor escribe tres carácteres o más en tu nombre");
    formulario.nombre.focus();
    return false;
  }


  if (formulario.appat.value.length < 3) {
    alert("Por favor escribe tres carácteres o más en tu apellido paterno");
    formulario.appat.focus();
    return false;
  }


  if (formulario.apmat.value.length < 3) {
    alert("Por favor escribe tres carácteres o más en tu apellido materno");
    formulario.apmat.focus();
    return false;
  }

  for (var i = 0; i < checkAppat.length; i++) {
    var ch = checkAppat.charAt(i);
    for (var j = 0; j < checkOk.length; j++) if (ch == checkOk.charAt(j)) break;
    if (j == checkOk.length) {
      allValid = false;
      break;
    }
  }
  if (!allValid) {
    alert("Escribe solo letras en tu apellido paterno");
    formulario.appat.focus();
    return false;
  }

  //validar apellido
  for (var i = 0; i < checkApmat.length; i++) {
    var ch = checkApmat.charAt(i);
    for (var j = 0; j < checkOk.length; j++) if (ch == checkOk.charAt(j)) break;
    if (j == checkOk.length) {
      allValid = false;
      break;
    }
  }
  if (!allValid) {
    alert("Escribe solo letras en tu apellido materno");
    formulario.apmat.focus();
    return false;
  }

}
