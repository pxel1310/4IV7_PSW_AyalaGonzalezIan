/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.*;
/**
 *
 * @author Alumno
 */
public class Conexion {
    
    public static Connection getConection(){
        String url = "jdbc:mysql://localhost/empresa";
        String username = "root";
        String password = "99310675";
        Connection con = null;
        
        try{
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url,username,password);
            System.out.println("Se conecto a la bd");
        }catch(Exception e){
            System.out.println("No se conecto a la BD");
            System.out.println(e.getMessage());
            
        }
        return con;
    }
}
