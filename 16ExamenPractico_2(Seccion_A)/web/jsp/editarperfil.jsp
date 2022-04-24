<%-- 
    Document   : editarperfil
    Created on : 23/04/2022, 01:49:59 AM
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
    <title>Registro de Nuevo Usuario</title>
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
                pro_email = request.getParameter("pro_email");
                
                String q = "SELECT * FROM profesores WHERE pro_email = '"+pro_email+"' LIMIT 1";
                
                set = con.createStatement();
                
                rs = set.executeQuery(q);
                
                while(rs.next()){
    %>
                <div class="text-center">
                    <form style="width: 23rem;" method="post" name="profesores" action="perfil.jsp">
                        <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Inicio de Sesión</h3>
                            <div class="form-outline mb-4">
                                <div>
                                    <label class="form-label">Número de Empleado</label>
                                    <input class="form-control form-control-lg" type="text" name="pro_numempleado" id="pro_numempleado" value="<%=rs.getInt("pro_numempleado")%>" />
                                </div>
                                <div>
                                    <label class="form-label">Nombre</label>
                                    <input class="form-control form-control-lg" type="text" name="pro_nombre" id="pro_nombre"  value="<%=rs.getString("pro_nombre")%>"/>
                                </div>
                                <div>
                                    <label class="form-label">Apellido Paterno</label>
                                    <input class="form-control form-control-lg" type="text" name="pro_appat" id="pro_appat" value="<%=rs.getString("pro_appat")%>" />
                                </div>
                                <div>
                                    <label class="form-label">Apellido Materno</label>
                                    <input class="form-control form-control-lg" type="text" name="pro_apmat" id="pro_apmat" value="<%=rs.getString("pro_apmat")%>"/>
                                </div>
                                <div>
                                    <label class="form-label">Sexo</label><%
                int cond = rs.getInt("sex_id");
                if (cond == 1){
            %>
                                    <select class="form-select" name="sex_id" id="sex_id">
                                        <option value="1" selected>Masculino</option>
                                        <option value="2">Femenino</option>
                                </select><%
               }else{
            %>
                                <select class="form-select" name="sex_id" id="sex_id">
                                    <option value="1">Masculino</option>
                                    <option value="2" selected>Femenino</option>
                                </select><%
               }
            %>
                            </div>
                            <div>
                                <label class="form-label">Fecha de Nacimiento</label>
                                <input class="form-control form-control-lg" type="date" name="pro_fnacimiento" id="pro_fnacimiento" value="<%=rs.getString("pro_fnacimiento")%>" />
                            </div>
                            <div>
                                <label class="form-label">Email</label>
                                <input class="form-control form-control-lg" type="email" name="pro_email" id="pro_email" value="<%=rs.getString("pro_email")%>" />
                            </div>
                            <div>
                                <label class="form-label">Contraseña</label>
                                <input class="form-control form-control-lg" type="text" name="pro_contrasena" id="pro_contrasena" value="<%=rs.getString("pro_contrasena")%>" />
                            </div>
                            <div class="pt-1 mb-4">
                                <label class="form-label"><input class="btn btn-outline-light btn-lg px-5" type="submit" value="Editar Perfil"></label>
                            </div>
                        </div>
                    </form>
                    <form action="inicioS.jsp" method="post" name="return">
                        <div style="visibility:hidden;">
                            <label><input value="<%=rs.getString("pro_email")%>" type="text" name="pro_email" id="pro_email" /></label>
                            <label><input value="<%=rs.getString("pro_contrasena")%>" type="text" name="pro_contrasena" id="pro_contrasena" /></label>
                        </div>
                        <div>
                            <label class="form-label"><input class="btn btn-outline-light btn-lg px-5" type="submit" value="Regresar a Inicio"></label>
                        </div>
            </div>
        </div>
    </section>

        <% 
                }
            }catch(SQLException es){
                System.out.println("Error al actualizar en la tabla");
                System.out.println(es.getMessage());
                %>
                 <h1>Error al consultar la tabla de la tabla</h1><%
                
            }
        }catch(Exception e){
        System.out.println("Error al conectar BD");
        System.out.println(e.getMessage());
        %>
        <h1>No conected T_T</h1><%
        
        }
         
        %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="js/validacionIndex.js"></script>
</body>

</html>
