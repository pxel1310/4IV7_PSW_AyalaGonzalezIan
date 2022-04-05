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
 * @author Alumno
 */
public class EliminarAlumno extends HttpServlet {

    private Connection con;
    private Statement set;
    private ResultSet rs;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<meta charset='UTF-8'>");
            out.println("<meta http-equiv='X-UA-Compatible' content='IE=edge'>");
            out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
            out.println("<link rel='stylesheet' href='css/Style.css'>");
            out.println("<link rel='shortcut icon' type='image/x-icon' href='img/shortcut.png' >");
            out.println("<title>Dar de Baja Alumno</title>");            
            out.println("</head>");
            out.println("<body>");
            
            try{
                int bol = Integer.parseInt(request.getParameter("eliminar"));
                String q1 = "SELECT COUNT(*) FROM alumnobatiz where boleta="+bol;
                
                set.executeQuery(q1);
                
                if ( q1 != null) {

                    String q = "delete from alumnobatiz where boleta ="+bol;
                
                    set.executeUpdate(q);
                
                    out.println("<h1>Alumno Eliminado de la BD, con boleta <i>"+bol+"</i></h1>");
                    out.println("<img src='img/ta_bien.png' alt='Ta bien'>");
                    out.println("<br>");
                    System.out.println("Se eliminno el registro");
                    
                } else {
                    System.out.println("Error xd jaja que wey");
                    System.out.println("No se pudo eliminar el registro");
                
                    out.println("<h1>No se pudo eliminar el Alumno</h1>");
                    out.println("<img src='img/ta_mal.png' alt='Ta mal'>");
                    out.println("<br>");
                }
            
            }catch(Exception e){
                System.out.println("No se pudo eliminar el registro");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
                out.println("<h1>No se pudo eliminar el Alumno</h1>");
                out.println("<img src='img/ta_mal.png' alt='Ta mal'>");
                out.println("<br>");
            }
            out.println("<a href='ConsultarAlumnos' >Consultar Alumnos</a>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    public void destroy(){
        try{
            con.close();
        }catch(Exception e){
            super.destroy();
        }
    }

}
