<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Document</title>
</head>
<body>
    <div>
        <form name="inicio" method="post" action="VerificarUsuario">
            <label>Usuario</label>
            <br/>
            <input type="text" name="usuario"/>
            <br/>
            <label>Password</label>
            <br/>
            <input type="password" name="password"/>
            <br/>
            <label>Usuario</label>
            <br/>
            <input type="submit" value="Iniciar Sesion"/>
            <input type="reset" value="Eliminar"/>
            <a href="">Registrar Nuevo Empleado</a>
        </form>
    </div>
</body>
</html>