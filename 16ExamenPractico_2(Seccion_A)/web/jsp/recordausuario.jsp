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
    <title>Recordar Usuario</title>
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
                String pro_email;
                int pro_numempleado;

                pro_email = request.getParameter("pro_email");
                pro_numempleado = Integer.parseInt(request.getParameter("pro_numempleado"));

                String q = "SELECT * FROM profesores WHERE pro_email = '"+pro_email+"' AND pro_numempleado ="+pro_numempleado+" LIMIT 1";
                
                set = con.createStatement();
                int reg = set.executeUpdate(q);
                
                while(rs.next()){
%>
    <h2>Consulta Exitosa <i><%=rs.getString("pro_nombre")%></i></h2>
    <p>Número de Empleado: <i><%=rs.getInt("pro_numempleado")%></i></p>
    <p>Email: <i><%=rs.getString("pro_email")%></i></p>
    <p>Contraseña: <i><%=rs.getString("pro_contrasena")%></i></p>
    <p>Ya puedes <a href="../index.html">Iniciar Sesión</a></p><%
                }
            }catch(SQLException es){
                System.out.println("Error al registrar en la tabla");
                System.out.println(es.getMessage());
%>
    <h2>Error al Usuario Inexistente</h2>
    <p>Una Disculpa Vuelve a <a href="../olvidar_cont.html">Recordar Usuario</a></p>
    <p><a href="../index.html">Iniciar Sesión</a></p><%
            }
        }catch(Exception e){
        System.out.println("Error al conectar BD");
        System.out.println(e.getMessage());
%>
    <h1>No conecto</h1>
    <p>Una Disculpa Vuelve a <a href="../olvidar_cont.html">Recordar Usuario</a></p>
    <p><a href="../index.html">Iniciar Sesión</a></p><%
        }
%>
</body>
</html>