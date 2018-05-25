package Aereopuerto;

/*
 * Serviciocontacto.java
 *
 * Created on 27 de abril de 2007, 10:41 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */



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
public class ServicioAereopuerto extends Servicio{
     
     private static final String registrarUsuario = "{call registrarUsuario(?,?,?,?,?,?,?,?,?,?)}";
     private static final String iniciarSesion = "{call iniciarSesion(?,?)}";
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
     
     private static ServicioAereopuerto singleton;
     
     
     public static ServicioAereopuerto getServicioAereopuerto(){
         
         if(singleton==null)
             singleton=new ServicioAereopuerto("aereolinea","root","root");
         return singleton;
     }
    /**
     * Creates a new instance of ServicioAereopuerto
     */
    private ServicioAereopuerto(String base,String usuario,String contraseña) {
        super(base,usuario,contraseña);
    }   
    public JSONArray registrarUsuario(int id,String nombre,String contra,String ape,String corr,String naci,String dir,String tel,String cel,int rol) throws SQLException, ClassNotFoundException, Exception{
        JSONArray js=new JSONArray();
        conectar();
        ResultSet rs = null;
        CallableStatement pstmt=null;  
        try {            
            pstmt = conexion.prepareCall(registrarUsuario); 
            pstmt.setInt(1,id);
            pstmt.setString(2,nombre);
            pstmt.setString(3,contra);
            pstmt.setString(4,ape);
            pstmt.setString(5,corr);
            pstmt.setString(6,naci);
            pstmt.setString(7,dir);
            pstmt.setString(8,tel);
            pstmt.setString(9,cel);
            pstmt.setInt(10,rol);
            pstmt.execute();
            rs = (ResultSet)pstmt.getResultSet(); 
            js=convertToJSON(rs);
        } catch (SQLException e) {
            String er;
            er=e.getMessage();
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
  public JSONArray iniciarSesion(String mail,String contra) throws SQLException, ClassNotFoundException, Exception{
        JSONArray js=new JSONArray();
        conectar();
        ResultSet rs = null;
        CallableStatement pstmt=null;  
        try {            
            pstmt = conexion.prepareCall(iniciarSesion); 
            pstmt.setString(1,mail);
            pstmt.setString(2,contra);
            pstmt.execute();
            rs = (ResultSet)pstmt.getResultSet(); 
            js=convertToJSON(rs);
        } catch (SQLException e) {
            String er;
            er=e.getMessage();
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
}
