/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

const expresion = {
  nombre: /^[a-zA-ZÀ-ÿ\s]{1,20}$/, // Letras y espacios, pueden llevar acentos. Del 1 a 20 caracteres
  appat: /^[a-zA-ZÀ-ÿ\s]{1,30}$/, // Letras y espacios, pueden llevar acentos. Del 1 a 30 caracteres
  apmat: /^[a-zA-ZÀ-ÿ\s]{1,30}$/, // Letras y espacios, pueden llevar acentos. Del 1 a 30 caracteres
  boleta: /^\d{1,10}$/, // 1 a 10 numeros
  tel: /^\d{1,10}$/, // 1 a 10 numeros.
};

function validar_nombre(e) {
  var teclado = document.all ? e.keyCode : e.which;
  if (teclado == 8) return true;

  var prueba = String.fromCharCode(teclado);
  return expresion.nombre.test(prueba);
}

function validar_appat(e) {
  var teclado = document.all ? e.keyCode : e.which;
  if (teclado == 8) return true;

  var prueba = String.fromCharCode(teclado);
  return expresion.appat.test(prueba);
}

function validar_apmat(e) {
  var teclado = document.all ? e.keyCode : e.which;
  if (teclado == 8) return true;

  var prueba = String.fromCharCode(teclado);
  return expresion.apmat.test(prueba);
}

function validar_boleta(e) {
  var teclado = document.all ? e.keyCode : e.which;
  if (teclado == 8) return true;

  var prueba = String.fromCharCode(teclado);
  return expresion.boleta.test(prueba);
}

function validar_tel(e) {
  var teclado = document.all ? e.keyCode : e.which;
  if (teclado == 8) return true;

  var prueba = String.fromCharCode(teclado);
  return expresion.tel.test(prueba);
}

document.oncopy = (event) => {
  event.preventDefault();
  event.clipboardData.setData("text/plain", "¿Porque esta copiando texto? ¯\_(ツ)_/¯ ");
};

document.oncut = (event) => {
  event.preventDefault();
  event.clipboardData.setData("text/plain", "¿Porque esta cortando texto? ¯\_(ツ)_/¯ ");
};

document.onpaste = (event) => {
  event.preventDefault();
};

document.ondrag = (event) => {
  event.preventDefault();
};

document.ondrop  = (event) => {
  event.preventDefault();
};



