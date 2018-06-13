package controlador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Bitacora;
import modelo.BitacoraDAO;
import modelo.Persona;
import modelo.PersonaDAO;

/**
 * Servlet implementation class ControladorDNI
 */
@WebServlet("/ControladorDNI")
public class ControladorDNI extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorDNI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			
		String tipo =request.getParameter("tipoDocumento");
		String numero_doc = request.getParameter("numeroDocumento");
		
		try {
		
			int num_cast = Integer.parseInt(numero_doc);
		
		} catch (NumberFormatException e1) {
			
			e1.printStackTrace();
			
			response.sendRedirect("./noBBDD.html");
		}
		
		PersonaDAO miPersonaDAO = new PersonaDAO();
		Persona elUsuario;
		
		BitacoraDAO miBitacoraDAO = new BitacoraDAO();
		Bitacora miBitacora = new Bitacora();
		miBitacora.setFecha(miBitacoraDAO.getFechaParaBitacora());
		miBitacora.setAccion("LOGIN");
		//miBitacora.setTipo_persona(tipo_persona);
		miBitacora.setTipo_documento(tipo);
		miBitacora.setNum_documento(numero_doc);
		miBitacora.setId_tramite(0);
		
		
		try {
			elUsuario = miPersonaDAO.getPersonaFromId(tipo, Integer.parseInt(numero_doc));
			String nombre_apel = ""+elUsuario.getNombres()+", "+elUsuario.getApellidos();
			request.getSession().setAttribute("usuario", nombre_apel);
			request.getSession().setAttribute("tipoDocumento", tipo);
			request.getSession().setAttribute("numeroDocumento", numero_doc);
			request.getSession().setAttribute("tipeOfSession", "Preatendedor");
			
			if(elUsuario.getTipo_usuario().equals("alumno")){
				
				request.getSession().setAttribute("tipoUser", "alumno");
				miBitacora.setTipo_persona("alumno");
				miBitacoraDAO.agregarBitacora(miBitacora);
				
				HttpSession session = request.getSession();
				   session.setMaxInactiveInterval(20*60);
				request.getSession().setAttribute("volver","ControladorAlumno");
				response.sendRedirect("./ControladorAlumno");
				
			}else if(elUsuario.getTipo_usuario().equals("docente")){
				
				request.getSession().setAttribute("tipoUser", "docente");
				miBitacora.setTipo_persona("docente");
				miBitacoraDAO.agregarBitacora(miBitacora);
				
				HttpSession session = request.getSession();
				   session.setMaxInactiveInterval(20*60);
				request.getSession().setAttribute("volver","ControladorDocente");
				response.sendRedirect("./ControladorDocente");
				
			}else if(elUsuario.getTipo_usuario().equals("NO-DOCENTE")){//lo dejo por las dudas!!!
				
				request.getSession().setAttribute("tipoUser", "no-docente");//****guion medio en vez de bajo!!!
				miBitacora.setTipo_persona("no-docente");
				miBitacoraDAO.agregarBitacora(miBitacora);
				
				HttpSession session = request.getSession();
				   session.setMaxInactiveInterval(20*60);
				request.getSession().setAttribute("volver", "Controlador");
				response.sendRedirect("./Controlador");
				
			}else{
				
				miBitacora.setTipo_persona("otro");
				miBitacoraDAO.agregarBitacora(miBitacora);
				
				response.sendRedirect("./noBBDD.html");
				
			}
			
		} catch (NullPointerException e) {
			
			response.sendRedirect("./noBBDD.html");
			e.printStackTrace();
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
