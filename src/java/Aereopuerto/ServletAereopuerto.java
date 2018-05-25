/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Aereopuerto;

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
@WebServlet(name = "ServletAereopuerto", urlPatterns = {"/ServletAereopuerto"})
public class ServletAereopuerto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    ServicioAereopuerto servicio=ServicioAereopuerto.getServicioAereopuerto();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            //String para guardar el JSON generaro por al libreria GSON
            String accion = request.getParameter("accion");
            switch (accion) {
                case "registrarUsuario":
                    int id = Integer.parseInt(request.getParameter("id"));
                    String nombre= request.getParameter("nombre");
                    String contra= request.getParameter("contra");
                    String ape= request.getParameter("ape");
                    String corr= request.getParameter("corr");
                    String naci= request.getParameter("naci");
                    String dir= request.getParameter("dir");
                    String tel= request.getParameter("tel");
                    String cel= request.getParameter("cel");
                    int rol = Integer.parseInt(request.getParameter("rol"));
                    out.print(servicio.registrarUsuario(id,nombre,contra,ape,corr,naci,dir,tel,cel,rol));
                    break;
                case "iniciarSesion":
                    String contr= request.getParameter("contra");
                    String cor= request.getParameter("mail");
                    out.print(servicio.iniciarSesion(cor,contr));
                    break;
                case "buscarVueloIda":
                    String dia= request.getParameter("dia");
                    String salida= request.getParameter("salida");
                    String destino= request.getParameter("destino");
                    int cant = Integer.parseInt(request.getParameter("cant"));
                    out.print(servicio.buscarVueloIda(dia,salida,destino,cant));
                    break;
                case "buscarVueloIdaVuelta":
                    String ida= request.getParameter("ida");
                    String vuelta= request.getParameter("vuelta");
                    String salid= request.getParameter("salida");
                    String destin= request.getParameter("destino");
                    int can = Integer.parseInt(request.getParameter("cant"));
                    out.print(servicio.buscarVueloIdaVuelta(ida,vuelta,salid,destin,can));
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
