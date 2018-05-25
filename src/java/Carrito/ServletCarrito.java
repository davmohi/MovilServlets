package Carrito;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author david
 */
@WebServlet(urlPatterns = {"/ServletCarrito"})
public class ServletCarrito extends HttpServlet {
    
    ServicioCarrito servicio=ServicioCarrito.getServicioCarrito();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            //String para guardar el JSON generaro por al libreria GSON
            String accion = request.getParameter("accion");
            int idUsuario;
            int idCarrito;
            int idArticulo;
            switch (accion) {
                case "allArticulos":
                    out.print(servicio.allArticulos());
                    break;
                case "articulosUsuario":
                    idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
                    out.print(servicio.articulosUsuario(idUsuario));
                    break;
                case "crearCarrito":
                    idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
                    out.print(servicio.crearCarrito(idUsuario));
                    break;
                case "agregarAlCarrito":
                    idCarrito = Integer.parseInt(request.getParameter("idCarrito"));
                    idArticulo = Integer.parseInt(request.getParameter("idArticulo"));
                    out.print(servicio.agregarAlCarrito(idCarrito,idArticulo));
                    break;
                default:
                    out.print("Error: No se indico la acción que se desea realizar");
                    break;
            }
        }
        catch (NumberFormatException e) {
            out.print("E~" + e.getMessage());
        } catch (Exception e) {
            out.print("E~" + e.getMessage());
        }
    }
    
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
