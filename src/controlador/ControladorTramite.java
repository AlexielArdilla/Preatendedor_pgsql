package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Bitacora;
import modelo.BitacoraDAO;
import modelo.Tramite;
import modelo.TramiteDAO;
import modelo.Ventanilla;
import modelo.VentanillaDAO;

/**
 * Servlet implementation class ControladorTramite
 */
@WebServlet("/ControladorTramite")
public class ControladorTramite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorTramite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getSession(false)!= null&& request.getSession().getAttribute("tipeOfSession").equals("Preatendedor")){
		
		String id_tramite = request.getParameter("idTramite");
		TramiteDAO misTramites = new TramiteDAO(); 
		Tramite tramite = misTramites.getTramitebyId(Integer.parseInt(id_tramite));
		request.setAttribute("objTramite", tramite);
		
		//***aqui graba en la base la bitacora
		
		String tipo_persona = (String) request.getSession().getAttribute("tipoUser");
		String tipo = (String) request.getSession().getAttribute("tipoDocumento");
		String numero_doc = (String) request.getSession().getAttribute("numeroDocumento");
		
		BitacoraDAO miBitacoraDAO = new BitacoraDAO();
		Bitacora miBitacora = new Bitacora();
		miBitacora.setFecha(miBitacoraDAO.getFechaParaBitacora());
		miBitacora.setAccion("TRAMITE");
		miBitacora.setTipo_persona(tipo_persona);
		miBitacora.setTipo_documento(tipo);
		miBitacora.setNum_documento(numero_doc);
		miBitacora.setId_tramite(Integer.parseInt(id_tramite));
		miBitacoraDAO.agregarBitacora(miBitacora);
		
		//***********************************
		
		
		VentanillaDAO miVentanilla = new VentanillaDAO();
		Ventanilla ventanilla = miVentanilla.getVentanillaFromId(tramite.getId_ventanilla());
		String nombre_ventanilla = ventanilla.getNombre();
		String horario = ventanilla.getHorario();
		request.setAttribute("nombre_ventanilla", nombre_ventanilla);
		request.setAttribute("horario", horario);
		
		getServletContext().getRequestDispatcher("/WEB-INF/jsp/tramiteTemplate.jsp").forward(request, response);
		
		}else{
			
			response.sendRedirect("./index.html");
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
