<%-- 
    Document   : borraralumno
    Created on : 4/04/2022, 04:21:12 PM
    Author     : Alumno
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
        password = "n0m3l0";
        driver = "com.mysql.jdbc.Driver";
        
        try{
            Class.forName(driver);
            con = DriverManager.getConnection(URL, userName, password);
            
            try{
                //necesitamos los parametros
                int id = Integer.parseInt(request.getParameter("id"));
                
                String q = "delete from alumnobatiz where boleta = "+id; 

                set = con.createStatement();
                
                int borrar = set.executeUpdate(q);
                
                %>
                 <h1>Alumno Eliminado</h1>
                <%
            
            }catch(SQLException es){
                System.out.println("Error al registrar en la tabla");
                System.out.println(es.getMessage());
                %>
                 <h1>Error al momento de eliminar de la tabla</h1>
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
        <br>
        <a href="consultaralumno.jsp" >Consultar Alumno</a>
        <br>
        <a href="registroalumno.jsp" >Registrar Nuevo Alumno</a>
    </body>
</html>
