package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Bitacora;
import modelo.BitacoraDAO;

/**
 * Servlet implementation class ControladorDeOtros
 */
@WebServlet("/ControladorDeFAQ")
public class ControladorDeFAQ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorDeFAQ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		BitacoraDAO miBitacoraDAO = new BitacoraDAO();
		Bitacora miBitacora = new Bitacora();
		miBitacora.setFecha(miBitacoraDAO.getFechaParaBitacora());
		miBitacora.setAccion("TRAMITE");
		miBitacora.setTipo_persona("OTRO");
		miBitacora.setTipo_documento("NO APLICA");
		miBitacora.setNum_documento("NO INGRESO");
		miBitacora.setId_tramite(0);
		miBitacoraDAO.agregarBitacora(miBitacora);
		

		response.sendRedirect("./faq.html");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
