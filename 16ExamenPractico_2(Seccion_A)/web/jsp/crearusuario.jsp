<%-- 
    Document   : inicioS
    Created on : 22/04/2022, 11:58:59 PM
    Author     : pxel1310
--%>
<%@page contentType="text/html" language="java"
        import="java.sql.*, java.util.*, java.text.*" 
        pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style.css">
    <title>Inicio en Registro de Reportes de Inmuebles CECyT 9</title>
</head>
<body>
    <h1><i>REGISTRO DE REPORTES DE INMUEBLES CECYT 9</i></h1><%
        
        Connection con = null;
        Statement set = null;
        ResultSet rs = null;
    
        String userName, URL, password, driver;
    
        URL = "jdbc:mysql://localhost/reg_reportes_inmuebles";
        userName = "root";
        password = "99310675";
        driver = "com.mysql.cj.jdbc.Driver";
        
        try{
            Class.forName(driver);
            con = DriverManager.getConnection(URL, userName, password);
            
            try{
                String pro_nombre, pro_appat, pro_apmat, pro_fnacimiento, pro_email, pro_contrasena;
                int pro_numempleado, sex_id;
                
                pro_nombre = request.getParameter("pro_nombre");
                pro_appat = request.getParameter("pro_appat");
                pro_apmat = request.getParameter("pro_apmat");
                pro_fnacimiento = request.getParameter("pro_fnacimiento");
                pro_email = request.getParameter("pro_email");
                pro_contrasena = request.getParameter("pro_contrasena");
                        
                pro_numempleado = Integer.parseInt(request.getParameter("pro_numempleado"));
                sex_id = Integer.parseInt(request.getParameter("sex_id"));

                String q = "INSERT INTO profesores (pro_numempleado, pro_nombre, pro_appat, "
                        + "pro_apmat, sex_id, pro_fnacimiento, pro_email, pro_contrasena) VALUES "
                        + "("+ pro_numempleado + ", '"+pro_nombre+"', '"+pro_appat+"', '"+pro_apmat+"', "
                        +sex_id+", '"+pro_fnacimiento+"', '"+pro_email+"', '"+pro_contrasena+"')";
                
                set = con.createStatement();
                int reg = set.executeUpdate(q);
%>
    <h2>Usuario Registrado con Exito</h2>
    <p>Ya puedes <a href="../index.html">Iniciar Sesión</a></p><%
            }catch(SQLException es){

                System.out.println("Error al registrar en la tabla");
                System.out.println(es.getMessage());
%>
    <h2>Error al Usuario Inexistente</h2>
    <p>Una Disculpa Vuelve a <a href="../nuevo_usuario.html">Crear Usuario</a></p>
    <p><a href="../index.html">Iniciar Sesión</a></p><%
            }
        }catch(Exception e){
            
        System.out.println("Error al conectar BD");
        System.out.println(e.getMessage());
%>
        <h1>No conecto</h1>
        <p>Una Disculpa Vuelve a <a href="../nuevo_usuario.html">Crear Usuario</a></p>
        <p><a href="../index.html">Iniciar Sesión</a></p><%
            
            }
         
%>
</body>
</html>