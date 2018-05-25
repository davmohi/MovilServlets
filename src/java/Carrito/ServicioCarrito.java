package Carrito;

/*
 * Serviciocontacto.java
 *
 * Created on 27 de abril de 2007, 10:41 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */



import Coneccion.Servicio;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.CallableStatement;
import org.json.JSONArray;
import org.json.JSONObject;
import Coneccion.Servicio;
/**
 *
 * @author Estudiante
 */
public class ServicioCarrito extends Servicio{
     
     private static final String agregarAlCarrito = "{call agregarAlCarrito(?,?)}";
     private static final String allArticulos = "{call allArticulos()}";
     private static final String articulosUsuario = "{call articulosUsuario(?)}";
     private static final String crearCarrito = "{call crearCarrito(?)}"; 
     
     public static JSONArray convertToJSON(ResultSet resultSet)
            throws Exception {
        JSONArray jsonArray = new JSONArray();
        while (resultSet.next()) {
            JSONObject obj = new JSONObject();
            int total_rows = resultSet.getMetaData().getColumnCount();
            for (int i = 0; i < total_rows; i++) {
                obj.put(resultSet.getMetaData().getColumnLabel(i + 1)
                        .toLowerCase(), resultSet.getObject(i + 1));
            }
            jsonArray.put(obj);
        }
        return jsonArray;
    }
     
     private static ServicioCarrito singleton;
     
     
     public static ServicioCarrito getServicioCarrito(){
         
         if(singleton==null)
             singleton=new ServicioCarrito("Carrito","root","root");
         return singleton;
     }
    /**
     * Creates a new instance of Servicioproducto
     */
    private ServicioCarrito(String base,String usuario,String contraseña) {
        super(base,usuario,contraseña);
    }   
    
    public JSONArray allArticulos() throws SQLException, ClassNotFoundException, Exception{
        JSONArray js=null;
        conectar();
        ResultSet rs = null;
        CallableStatement pstmt=null;  
        try {            
            pstmt = conexion.prepareCall(allArticulos); 
            pstmt.execute();
            rs = (ResultSet)pstmt.getResultSet(); 
            js=convertToJSON(rs);
        } catch (SQLException e) {
          e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                desconectar();
            } catch (SQLException e) {
            }
        }
        return js;
 }
 public JSONArray articulosUsuario(int idUsuario) throws SQLException, ClassNotFoundException, Exception{
        JSONArray js=null;
        conectar();
        ResultSet rs = null;
        CallableStatement pstmt=null;  
        try {            
            pstmt = conexion.prepareCall(articulosUsuario);  
            pstmt.setInt(1,idUsuario);
            pstmt.execute();
            rs = (ResultSet)pstmt.getResultSet(); 
            js=convertToJSON(rs);
        } catch (SQLException e) {
          e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                desconectar();
            } catch (SQLException e) {
            }
        }
        return js;
 }
 public JSONArray crearCarrito(int idUsuario) throws SQLException, ClassNotFoundException, Exception{
        JSONArray js=null;
        conectar();
        ResultSet rs = null;
        CallableStatement pstmt=null;  
        try {            
            pstmt = conexion.prepareCall(crearCarrito);  
            pstmt.setInt(1,idUsuario);
            pstmt.execute();
            rs = (ResultSet)pstmt.getResultSet(); 
            js=convertToJSON(rs);
        } catch (SQLException e) {
          e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                desconectar();
            } catch (SQLException e) {
            }
        }
        return js;
 }
 public boolean agregarAlCarrito(int idCarrito,int idArticulo) throws SQLException, ClassNotFoundException, Exception{
     
        conectar();
        ResultSet rs = null;
        CallableStatement pstmt=null;  
        try {            
            pstmt = conexion.prepareCall(agregarAlCarrito);  
            pstmt.setInt(1,idCarrito);
            pstmt.setInt(2,idArticulo);
            pstmt.execute();
        } catch (SQLException e) {
          e.printStackTrace();
          return false;
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                desconectar();
            } catch (SQLException e) {
                return false;
            }
        }
        return true;
 }
  
}
