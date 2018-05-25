package Coneccion;

/*
 * Servicio.java
 *
 * Created on 25 de abril de 2007, 03:45 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Servicio{
    String base,usuario,contraseña;
    protected Connection conexion= null;
    
    
    public Servicio(String base,String usuario,String contraseña) {
        this.base=base;
        this.usuario=usuario;
        this.contraseña=contraseña;
    }
    
    public void conectar() throws SQLException,ClassNotFoundException 
    {
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+base,usuario,contraseña );
    }
    
    protected void desconectar() throws SQLException{
        if(!conexion.isClosed())
        {
            conexion.close();
        }
    }

    private Connection getJdbcMydbsource() throws NamingException {
        Context c = new InitialContext();
        try {
            return ((DataSource) c.lookup("jdbc/Mydbsource")).getConnection();
        } catch (NamingException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
}