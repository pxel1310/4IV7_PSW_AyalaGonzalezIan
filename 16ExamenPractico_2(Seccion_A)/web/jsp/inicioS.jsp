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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Inicio en Registro de Reportes de Inmuebles CECyT 9</title>
</head>
<body>
    <section class="vh-100">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6 text-white">
                    <div class="px-5 ms-xl-4"><br>
                    <span class="h2 fw-bold mb-0">REGISTRO DE REPORTES DE INMUEBLES CECYT 9</span>
                </div><%

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
                int val;

                pro_email = request.getParameter("pro_email");
                pro_contrasena = request.getParameter("pro_contrasena");
                                        
                String q1 = "SELECT COUNT(pro_email) FROM profesores WHERE pro_email='"+pro_email+"' AND pro_contrasena='"+pro_contrasena+"'";
                                        
                set = con.createStatement();
                rs = set.executeQuery(q1);
                                        
                while(rs.next()){
                    val = rs.getInt("COUNT(pro_email)");
                    System.out.println(val);
                
                    if (val == 1 ) {
                        String q2 = "SELECT * FROM profesores WHERE pro_email = '" 
                                + pro_email +"' AND pro_contrasena = " +pro_contrasena +" LIMIT 1";
                    
                        set = con.createStatement();
                        rs = set.executeQuery(q2);
                    
                        while(rs.next()){
%>
    <div class="text-center">
        <br>
        <h2 class="mb-0">Consulta Exitosa <i><%=rs.getString("pro_nombre")%></i></h2>
        <p class="mb-0">Email: <i><%=rs.getString("pro_email")%></i></p>
        <p class="mb-0">Número de Empleado: <i><%=rs.getInt("pro_numempleado")%></i></p>
        <form action="editarperfil.jsp" method="post" name="editar">
            <div style="visibility:hidden;">
                <label><input value="<%=rs.getString("pro_email")%>" type="text" name="pro_email" id="pro_email" /></label>
            </div>
            <div class="pt-1 mb-4">
                <label><input class="btn btn-outline-light btn-lg px-5" type="submit" value="Editar Perfil"></label>
            </div>
        </form>
        <p class="mb-0"><a href="../index.html" class="text-white-50 fw-bold">Cerrar Sesión</a></p>
    </div>
    <br>
    <div>
        <table class="table table-striped table-hover" style="background-color: rgb(182, 147, 159); 
        color: azure; border-radius: 1rem; font-size: 75%;">
            <thead>
                <tr>
                    <th scope="col">ID Reporte</th>
                    <th scope="col">Lab.</th>
                    <th scope="col">Fecha y Hora Reporte</th>
                    <th scope="col">Etiqueta Equipo</th>
                    <th scope="col">CPU Serial</th>
                    <th scope="col">ID Teclado</th>
                    <th scope="col">ID Mouse</th>
                    <th scope="col">Marca</th>
                    <th scope="col">ID Monitor</th>
                    <th scope="col">Nom. Responsable</th>
                    <th scope="col">Asignatura</th>
                    <th scope="col">Reporte</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Prioridad Reporte</th>
                    <th scope="col">Estado Reporte</th>
                    <th scope="col">Tecnico</th>
                    <th scope="col">Editar</th>
                <tr>
            </thead>
            <tbody><%

                        }

                        String q = "SELECT reportes.rep_id,laboratorios.lab_nom,reportes.rep_fechahora ,reportes.equ_etiqueta,equipos.cpu_serial,equipos.tec_id,equipos.mou_id,marcas.mar_nom,equipos.mon_id," 
                                + "reportes.pro_nombre,asignaturas.asi_nom,reportes.rep_problema,reportes.rep_estado,prioridades.pri_nom,estados.est_nom,tecnicos.tecn_nombrec "
                                + "FROM equipos "
                                + "INNER JOIN reportes ON reportes.equ_etiqueta = equipos.equ_etiqueta "
                                + "INNER JOIN laboratorios ON laboratorios.lab_id = reportes.lab_id "
                                + "INNER JOIN marcas ON marcas.mar_id = equipos.mar_id "
                                + "INNER JOIN asignaturas ON asignaturas.asi_id = reportes.asi_id "
                                + "INNER JOIN prioridades ON prioridades.pri_id = reportes.pri_id "
                                + "INNER JOIN estados ON estados.est_id = reportes.est_id "
                                + "INNER JOIN tecnicos ON tecnicos.tecn_id = reportes.tecn_id ORDER BY reportes.rep_id";

                                set = con.createStatement();
                                rs = set.executeQuery(q);
                        while(rs.next()){
            %>
                <tr>
                    <td scope="row"><%=rs.getInt("rep_id")%></td>
                    <td><%=rs.getString("lab_nom")%></td>
                    <td><%=rs.getString("rep_fechahora")%></td>
                    <td><%=rs.getString("equ_etiqueta")%></td>
                    <td><%=rs.getString("cpu_serial")%></td>
                    <td><%=rs.getString("tec_id")%></td>
                    <td><%=rs.getString("mou_id")%></td>
                    <td><%=rs.getString("mar_nom")%></td>
                    <td><%=rs.getString("mon_id")%></td>
                    <td><%=rs.getString("pro_nombre")%></td>
                    <td><%=rs.getString("asi_nom")%></td>
                    <td><%=rs.getString("rep_problema")%></td>
                    <td><%=rs.getString("rep_estado")%></td>
                    <td><%=rs.getString("pri_nom")%></td>
                    <td><%=rs.getString("est_nom")%></td>
                    <td><%=rs.getString("tecn_nombrec")%></td>
                    <td><a class="text-white-50 fw-bold" href="editarreporte.jsp?rep_id=<%=rs.getInt("rep_id")%>" >Editar</a></td>
                </tr><%
                        }
                        String qnn = "SELECT pro_email FROM profesores WHERE pro_email='"+pro_email+"' AND pro_contrasena='"+pro_contrasena+"'";
                        
                        set = con.createStatement();
                        rs = set.executeQuery(qnn);
                        while(rs.next()){
            %>
            </tbody>
        </table>
    </div>
    <br>
    <form action="realizareporte.jsp" method="post" name="inicio">
        <div style="visibility:hidden;">
            <label><input value="<%=rs.getString("pro_email")%>" type="text" name="pro_email" id="pro_email" /></label>
        </div>
        <div>
          <label><input class="btn btn-outline-light btn-lg px-5" type="submit" value="Realizar Reporte"></label>
        </div>
    </form>
  </section><%
                        }
                    }else{

%>
    <h2>Sesion no realizada correctamente</h2>
    <p>Usuario no existente o contraseña invalida</p>
    <br><%
                    }
                }
            }catch(SQLException es){
                System.out.println("Error al registrar en la tabla");
                System.out.println(es.getMessage());
%>  
    <h1>Error al consultar la tabla de la tabla</h1><%
            }
        }catch(Exception e){
            System.out.println("Error al conectar BD");
            System.out.println(e.getMessage());

%>
    <h1>No conecto</h1><%
        }
%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="js/validacionIndex.js"></script>
</body>
</html>
