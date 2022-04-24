function obtener() {
  var pro_numempleado =
    document.profesores.querySelector("#pro_numempleado").value;
  var pro_nombre = document.profesores.querySelector("#pro_nombre").value;
  var pro_appat = document.profesores.querySelector("#pro_appat").value;
  var pro_apmat = document.profesores.querySelector("#pro_apmat").value;
  var sex_id = document.profesores.querySelector("#sex_id").value;
  var pro_fnacimiento =
    document.profesores.querySelector("#pro_fnacimiento").value;
  var pro_email = document.profesores.querySelector("#pro_email").value;
  var pro_contraseña =
    document.profesores.querySelector("#pro_contraseña").value;

  console.log(
    pro_numempleado,
    pro_nombre,
    pro_appat,
    pro_apmat,
    sex_id,
    pro_fnacimiento,
    pro_email,
    pro_contraseña
  );
}
