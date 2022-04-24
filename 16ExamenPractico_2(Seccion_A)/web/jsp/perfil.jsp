<%-- 
    Document   : reporte
    Created on : 23/04/2022, 06:18:13 PM
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
    <title>Perfil</title>
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
                
                pro_nombre = request.getParameter("equ_etiqueta");
                pro_appat = request.getParameter("rep_problema");
                pro_apmat = request.getParameter("rep_estado");
                pro_fnacimiento = request.getParameter("pro_email");
                pro_email = request.getParameter("pro_email");
                pro_contrasena = request.getParameter("pro_email");
                        
                pro_numempleado = Integer.parseInt(request.getParameter("pro_numempleado"));
                sex_id = Integer.parseInt(request.getParameter("lab_id"));
                
                String qz = "UPDATE profesores "
                        + "SET pro_numempleado="+pro_numempleado+", pro_nombre='"+pro_nombre+"', pro_appat='"+pro_appat+"', "
                        + "pro_apmat='"+pro_apmat+"', sex_id="+sex_id+", pro_fnacimiento='"+pro_fnacimiento+"' "
                        + "WHERE pro_email = '"+pro_email+"'";
                
                set = con.createStatement();
                
                int reg = set.executeUpdate(qz);
%>
    <h2>Registro de Reporte</h2>
    <form action="inicioS.jsp" method="post" name="inicio">
        <div>
            <label><input type="text" name="pro_email" id="pro_email" /></label>
        </div>
        <div>
            <label><input type="submit" value="Regresar a Inicio"></label>
        </div>
    </form><%
            }catch(SQLException es){

                System.out.println("Error al registrar en la tabla");
                System.out.println(es.getMessage());
%>
    <h2>Error al Reporte</h2>
    <form action="inicioS.jsp" method="post" name="inicio">
        <div>
          <label><input type="submit" value="Regresar a Inicio"></label>
        </div>
    </form><%
            }
        }catch(Exception e){
            
        System.out.println("Error al conectar BD");
        System.out.println(e.getMessage());
%>
    <h1>No conecto Error</h1>
    <form action="../index.html" method="post" name="inicio">
        <div>
            <label><input type="submit" value="Iniciar Sesion" ></label>
        </div>
    </form><%    
        }   
%>
</body>
</html>