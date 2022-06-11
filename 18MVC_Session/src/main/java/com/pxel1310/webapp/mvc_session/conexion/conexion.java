package com.pxel1310.webapp.mvc_session.conexion;

import java.sql.*;

public class conexion {
    public static Connection getConnection() throws ClassNotFoundException{
        try{
            String url, user, pass;

            Class.forName("com.mysql.jdbc.Driver");

            url = "jdbc:mysql://localhost/maquinasbatiz";
            user = "root";
            pass = "n0m3l0";

            return DriverManager.getConnection(url, user, pass);
        }catch(SQLException eq){
            System.out.println("Error al conectar con la BD");
            System.out.println(eq.getMessage());
        }catch(Exception ex){
            System.out.println("Error al no encontrar la clases");
            System.out.println(ex.getMessage());
        }
        return null;
    }
}
