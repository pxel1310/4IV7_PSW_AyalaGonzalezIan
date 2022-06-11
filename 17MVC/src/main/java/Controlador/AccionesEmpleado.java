/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

/**
 *
 * @author Alumno
 * CRUD
 */

import Modelo.Empleado;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
        
public class AccionesEmpleado {
    
    //registro
    public static int registrarEmpleado(Empleado e){
        int estatus = 0;
        
        try{
            //coneccion
            Connection con = Conexion.getConection();
            String q = "insert into empleado(nombre, password, email, pais)"
                    + "values(?, ?, ?, ?)";
            //Para darle formato a la query hay q usar PreparedStatment
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, e.getNombre());
            ps.setString(2, e.getPassword());
            ps.setString(3, e.getEmail());
            ps.setString(4, e.getPais());
            
            estatus = ps.executeUpdate(q);
            con.close();
            
            System.out.println("Registro exitoso de empleado");
            
        }catch(Exception ex){
            System.out.println("Error al registrar al empleado");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }
    
    public static Empleado buscarEmpleadoporID(int id){
        Empleado e = new Empleado();
        
        try{
            Connection con = Conexion.getConection();
            
            String q = "SELECT * FROM empleados where id=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            
           
            System.out.println("Se hayo al empleado");
        }catch(Exception ex){
            System.out.println("Error al consultar");
            System.out.println(ex.getMessage());
        }
        return e;
    }
    
    public static List<Empleado> getAllEmpleados(){
        List<Empleado> lista = new ArrayList<Empleado>();
        
        try{
            Connection con = Conexion.getConection();
            
            String q = "SELECT * FROM empleados";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Empleado e = new Empleado();
                
                e.setId(rs.getInt(1));
                e.setNombre(rs.getString(2));
                e.setPassword(rs.getString(3));
                e.setEmail(rs.getString(4));
                e.setPais(rs.getString(5));
                
                lista.add(e);

            }
            System.out.println("Se hayo al empleado");
        }catch(Exception ex){
            System.out.println("Error al consultar");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
    
    public static int EliminarEmpleado(int id){
        List<Empleado> lista = new ArrayList<Empleado>();
        
        try{
            Connection con = Conexion.getConection();
            
            String q = "SELECT * FROM empleados";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Empleado e = new Empleado();
                
                e.setId(rs.getInt(1));
                e.setNombre(rs.getString(2));
                e.setPassword(rs.getString(3));
                e.setEmail(rs.getString(4));
                e.setPais(rs.getString(5));
                
                lista.add(e);

            }
            System.out.println("Se hayo al empleado");
        }catch(Exception ex){
            System.out.println("Error al consultar");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
    
    
    public static int EliminarcEmpleado(int id){
        List<Empleado> lista = new ArrayList<Empleado>();
        
        try{
            Connection con = Conexion.getConection();
            
            String q = "SELECT * FROM empleados ''";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Empleado e = new Empleado();
                
                e.setId(rs.getInt(1));
                e.setNombre(rs.getString(2));
                e.setPassword(rs.getString(3));
                e.setEmail(rs.getString(4));
                e.setPais(rs.getString(5));
                
                lista.add(e);

            }
            System.out.println("Se hayo al empleado");
        }catch(Exception ex){
            System.out.println("Error al consultar");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
    
}
