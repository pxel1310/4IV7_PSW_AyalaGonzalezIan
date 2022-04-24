<%-- 
    Document   : consultarusuario
    Created on : 23/04/2022, 04:02:36 AM
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
    <h2><i>REGISTRO DE REPORTES DE INMUEBLES CECYT 9</i></h2><%
        
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
                String pro_email, pro_contrasena;
                pro_email = request.getParameter("pro_email");
                
                String q = "SELECT profesores.pro_id, profesores.pro_numempleado, profesores.pro_nombre, "
                        + "profesores.pro_appat, profesores.pro_apmat, sexos.sex_nom, profesores.pro_fnacimiento, "
                        + "profesores.pro_email, profesores.pro_contrasena, pro_creatat "
                        + "FROM profesores "
                        + "INNER JOIN sexos ON sexos.sex_id = profesores.sex_id "
                        + "WHERE "
                        + "profesores.pro_email = '"+pro_email+"' LIMIT 1";
                
                set = con.createStatement();
                rs = set.executeQuery(q);
                
                 while(rs.next()){
%>
    <h2>Consulta Exitosa <i><%=rs.getString("pro_nombre")%> <%=rs.getString("pro_appat")%> <%=rs.getString("pro_apmat")%></i></h2>
    <p>ID Cuenta: <i><%=rs.getInt("pro_id")%></i></p>
    <p>Número de Empleado: <i><%=rs.getInt("pro_numempleado")%></i></p>
    <p>Email: <i><%=rs.getString("pro_email")%></i></p>
    <p>Contraseña: <i><%=rs.getString("pro_contrasena")%></i></p>
    <p>Sexo: <i><%=rs.getString("sex_nom")%></i></p>
    <p>Fecha de nacimiento: <i><%=rs.getString("pro_fnacimiento")%></i></p>
    <p>Fecha y Hora de Creación: <i><%=rs.getString("pro_creatat")%></i></p>
    <form action="inicioS.jsp" method="post" name="inicio">
    <div style="display:none;">
      <label><input value="<%=rs.getString("pro_email")%>" type="email" name="pro_email" id="pro_email"/></label>
    </div>
    <div style="display:none;">
      <label><input value="<%=rs.getString("pro_contrasena")%>" type="password" name="pro_contrasena" id="pro_contrasena" /></label>
    </div>
    <div>
      <label><input type="submit" value="Regresar al Inicio"></label>
    </div>
  </form><%
        
                }
            }catch(SQLException es){

                    System.out.println("Error al registrar en la tabla");
                    System.out.println(es.getMessage());%>
                    <h1>Error al consultar la tabla de la tabla</h1><%
            }

        }catch(Exception e){
                System.out.println("Error al conectar BD");
                System.out.println(e.getMessage());
%>
    <h1>No conected T_T</h1><%
        }
%>
</body>