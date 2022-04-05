/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author pxel1310
 */
public class ModificarAlumno extends HttpServlet {
    private Connection con;
    private Statement set;
    private ResultSet rs;
    
    public void init(ServletConfig cfg) throws ServletException{
        //aqui es donde se define como se conecta a la BD
        String URL = "jdbc:mysql:3306//localhost/alumnos";
                    //tipo de conector:manejadorbd:puerto//IP/nombrebd
        String userName = "root";
        String password = "99310675";
        
        try{
            //lo primero es conectarnos
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            URL = "jdbc:mysql://localhost/alumnos";
            
            con = DriverManager.getConnection(URL, userName, password);
            set = con.createStatement();
            
            System.out.println("Se conecto a la BD *w* ");
        }catch(Exception e){
            
            System.out.println("No se conecto, solo juguito contigo");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        
        }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String nomM, patM, matM, bolM, telM;
            nomM = request.getParameter("nombre-p");
            patM = request.getParameter("appat-p");
            matM = request.getParameter("apmat-p");
            bolM =  request.getParameter("boleta-p");
            telM = request.getParameter("tel-p");
            
            System.out.println(nomM+", "+patM+", "+matM+", "+bolM+", "+telM);
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<meta charset='UTF-8'>");
            out.println("<meta http-equiv='X-UA-Compatible' content='IE=edge'>");
            out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
            out.println("<link rel='stylesheet' href='css/Style.css'>");
            out.println("<link rel='shortcut icon' type='image/x-icon' href='img/shortcut.png' >");
            out.println("<title>Lista de Alumnos de Batiz</title>");            
            out.println("</head>");
            out.println("<body>");
            
            try{
                int bol = Integer.parseInt(request.getParameter("modificar"));
                
                String q1 = "SELECT COUNT(*) FROM alumnobatiz where boleta="+bol;
                
                set.executeQuery(q1);
                
                if ( q1 != null) {
                    out.println("<h1>Consulta de Alumnos de Batiz</h1><hr><br>");
                    out.println("<table>"
                                + "<tr>"
                                    + "<th>Boleta</th>"
                                    + "<th>Nombre del Alumno</th>"
                                    + "<th>Apellido Paterno del Alumno</th>"
                                    + "<th>Apellido Materno del Alumno</th>"
                                    + "<th>Telefono</th>"
                                + "</tr>");
                
                    String q = "select * from alumnobatiz where boleta="+bol;
                    
                    System.out.println("La boleta ingresada es: "+bol);
                    int boleta;
                    String nombre, apellidopaterno, apellidomaterno, tel;
                    
                    set = con.createStatement();
                    rs = set.executeQuery(q);
                    
                    while(rs.next()){
                        boleta = rs.getInt("boleta");
                        nombre = rs.getString("nombre");
                        apellidopaterno = rs.getString("appat");
                        apellidomaterno = rs.getString("apmat");
                        tel = rs.getString("telefono");
                    
                        out.println("<tr>"
                                    + "<td>"+boleta+"</td>"
                                    + "<td>"+nombre+"</td>"
                                    + "<td>"+apellidopaterno+"</td>"
                                    + "<td>"+apellidomaterno+"</td>"
                                    + "<td>"+tel+"</td>"
                                + "</tr>");
                    }
                
                    //hay que cerrar conexiones
                    rs.close();
                    set.close();
                
                    out.println("</table><br>");
                    out.println("<div class='modificar'>");
                    out.println("<form method='post' name='modificar-f1' action='ConfirmarAlumno' id='registro-f'>");
                    out.println("<legend><i>Modificar</i> atributos seleccionados del alumno "+
                            "con boleta: <i>"+bol+"</i></legend>");
                
                    if (nomM == null && patM == null && matM == null && bolM == null && telM == null) {
                        out.println("<label>Ningun Valor Sera Modificado</label>");
                    }else {
                        out.println("<label> Boleta Original <br><input type='text' name='boletaO' " +
                                " readonly='readonly' value='"+bol+"'</label>");
                        if (nomM != null) {
                            out.println("<label> Nombre <br><input type='text' name='nombreM' id='nombreM'" 
                            + "onkeypress='return validar_nombre(event)'"
                            + "placeholder='Ingresa el Nombre del Alumno' /></label>");
                        }
                        if (patM != null) {
                            out.println("<label> Apellido Paterno <br><input type='text' name='appatM' id='appatM'" 
                            + "onkeypress='return validar_appat(event)'"
                            + "placeholder='Ingresa el Apellido Paterno del Alumno' /></label>");
                        }
                        if (matM != null) {
                            out.println("<label> Apellido Materno <br><input type='text' name='appmatM' id='apmat-mod'" 
                            + "onkeypress='return validar_apmat(event)'"
                            + "placeholder='Ingresa el Apellido Materno del Alumno' /></label>");
                        }
                        if (bolM != null) {
                            out.println("<label> Boleta <br><input type='text' name='boletaM' id='boletaM'" 
                            + "onkeypress='return validar_boleta(event)'"
                            + "placeholder='Ingresa la boleta Alumno' /></label>");
                        }
                        if (telM != null) {
                            out.println("<label> Telefono <br><input type='text' name='telM' id='telM'" 
                            + "onkeypress='return validar_tel(event)'"
                            + "placeholder='Ingresa el Telefono del Alumno' /></label>");
                        }
                        out.println("<input type='submit' value='Modificar Alumno' name='enviar' id='enviar' onclick='' />");
                        out.println("<input type='reset' value='Borrar Datos'>");
                        out.println("</form>");
                        out.println("</div>");
                        out.println("<br>");
                        }
                }else{
                    System.out.println("Error al conectar a la tabla");

                    out.println("<h1>No se pudo consultar el Alumno</h1>");
                    out.println("<img src='img/ta_mal.png' alt='Ta mal'>");
                    out.println("<br>");
                }
            }catch(Exception e){
                
                System.out.println("Error al conectar a la tabla");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
                out.println("<h1>No se pudo consultar el Alumno</h1>");
                out.println("<img src='img/ta_mal.png' alt='Ta mal'>");
                out.println("<br>");
            }
            
            out.println("<a href='index.html' >Pagina principal</a>");
            out.println("<script src='js/validarFormulario.js'></script>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
    public void destroy(){
        try{
            con.close();
        }catch(Exception e){
            super.destroy();
        }
    }

}

