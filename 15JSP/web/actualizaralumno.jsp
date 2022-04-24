<%-- 
    Document   : borraralumno
    Created on : 23/04/2022, 12:08:15 AM
    Author     : pxel1310
--%>


<%@page contentType="text/html" language="java"
        import="java.sql.*, java.util.*, java.text.*" 
        pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        //esa codigo java
        Connection con = null;
        Statement set = null;
        ResultSet rs = null;
        
        String userName, URL, password, driver;
        
        URL = "jdbc:mysql://localhost/alumnos";
        userName = "root";
        password = "99310675";
        driver = "com.mysql.cj.jdbc.Driver";
        
        try{
            Class.forName(driver);
            con = DriverManager.getConnection(URL, userName, password);
            
            try{
                //necesitamos los parametros
                String nom, appat, apmat, tel;
                int bol;
                
                nom = request.getParameter("nombre2");
                appat = request.getParameter("appat2");
                apmat = request.getParameter("apmat2");
                tel = request.getParameter("tel2");
                bol = Integer.parseInt(request.getParameter("boleta2"));
                
                set = con.createStatement();
                
                String q = "update alumnobatiz set nombre = '"+nom+"', "
                        + "appat = '"+appat+"', apmat = '"+apmat+"', "
                        + "telefono = '"+tel+"' where boleta = "+bol+" ";
                
                int registro = set.executeUpdate(q);
                
                %>
                 <h1>Actualizacion del Alumno Exitosa</h1>
                <%
            
            }catch(SQLException es){
                System.out.println("Error al actualizar en la tabla");
                System.out.println(es.getMessage());
                %>
                 <h1>Error en la actualizacionMVCT< de la tabla</h1>
                <%
                
            }
        }catch(Exception e){
        System.out.println("Error al conectar BD");
        System.out.println(e.getMessage());
        %>
        <h1>No conected T_T</h1>
        <%
        
        }
        
        
        
        
        
        %>
        
        <br>
        <a href="index.html" >Regresar a Principal</a>
    </body>
</html>