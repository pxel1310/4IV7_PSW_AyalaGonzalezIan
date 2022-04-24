<%-- 
    Document   : editarreporte
    Created on : 23/04/2022, 01:50:31 AM
    Author     : pxel1310
--%>
<%@page contentType="text/html" language="java"
        import="java.sql.*, java.util.*, java.text.*" 
        pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
                    String rep_id;

                    rep_id = request.getParameter("rep_id");
                    
                    String q = "SELECT * FROM reportes WHERE rep_id = "+rep_id+" LIMIT 1";
                
                    set = con.createStatement();
                    rs = set.executeQuery(q);
                
                    while(rs.next()){
        %>
                        <div class="text-center" >
                            <h2 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Editar Reporte, Preferente para cambiar Status</h2>
                        <form style="width: 23rem;" method="post" name="profesores" action="reporte.jsp">
                            <div class="form-outline mb-4">
                                <label class="form-label">Asignatura</label>
                                <select class="form-select" name="lab_id" id="lab_id">
                                    <option value="1">POO</option>
                                    <option value="2">LAB. 1</option>
                                    <option value="3">ADMON. PROY.</option>
                                    <option value="4">PSW</option>
                                    <option value="5">LAB. 2</option>
                                    <option value="6">BD</option>
                                    <option value="7">TEC. PERSONALES</option>
                                </select>
                            </div>
                            <div  class="form-outline mb-4">
                                <label class="form-label">Etiqueta</label>
                                <select class="form-select" name="equ_etiqueta" id="equ_etiqueta">
                                    <option value="LBD1">LBD1</option>
                                    <option value="LBD2">LBD2</option>
                                    <option value="LDS1">LDS1</option>
                                    <option value="LDS2">LDS2</option>
                                    <option value="LNT1">LNT1</option>
                                </select>
                            </div>
                            <div class="form-outline mb-4">
                                <label class="form-label">Problema</label>
                                <input type="text" name="rep_problema" id="rep_problema" class="form-control form-control-lg" value="<%=rs.getString("rep_problema")%>"/>
                            </div>
                            <div class="form-outline mb-4">
                                <label class="form-label">Estado</label>
                                <select class="form-select" name="rep_estado" id="rep_estado">
                                    <option value="Funcional">Funcional</option>
                                    <option value="No Funcional">No Funcional</option>
                                </select>
                            </div>
                            <div class="form-outline mb-4">
                                <label class="form-label">Prioridad</label>
                                <select class="form-select" name="pri_id" id="pri_id">
                                    <option value="1">Alta</option>
                                    <option value="2">Media</option>
                                    <option value="3">Baja</option>
                                </select>
                            </div>
                            <div class="pt-1 mb-4">
                                <label><input class="btn btn-outline-light btn-lg px-5" type="submit" value="Editar Reporte"></label>
                            </div>
                            <div style="visibility:hidden;">
                                <label><input value="<%=rs.getString("pro_email")%>" type="text" name="pro_email" id="pro_email" /></label>
                            </div>
                            <div style="visibility:hidden;">
                                <label><input value="<%=rs.getString("pro_nombre")%>" type="text" name="pro_nombre" id="pro_nombre" /></label>
                            </div>
                            <div style="visibility:hidden;">
                                <label><input value="<%=rs.getString("pro_numempleado")%>" type="text" name="pro_numempleado" id="pro_numempleado" /></label>
                            </div>
                        </form>
                        <form action="inicioS.jsp" method="post" name="return">
                            <div style="visibility:hidden;">
                                <label><input value="<%=rs.getString("pro_email")%>" type="text" name="pro_email" id="pro_email" /></label>
                                <label><input value="<%=rs.getString("pro_contrasena")%>" type="text" name="pro_contrasena" id="pro_contrasena" /></label>
                            </div>
                            <div>
                                <label><input class="btn btn-outline-light btn-lg px-5" type="submit" value="Regresar a Inicio"></label>
                           </div>
                        </form>
                </div>
            </div>
        </section>
    <%
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
    <script src="js/validaciónNuevo.js"></script>
</body>

</html>