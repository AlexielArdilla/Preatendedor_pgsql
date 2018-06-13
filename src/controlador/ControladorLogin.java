package controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.TipoDocumento;
import modelo.TipoDocumentoDAO;

/**
 * Servlet implementation class ControladorLogin
 */
@WebServlet("/ControladorLogin")
public class ControladorLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		///NO agregar validador de sesion!!!
		
		TipoDocumentoDAO miTipoDocumentoDAO = new TipoDocumentoDAO(); 
		List<TipoDocumento> datos = miTipoDocumentoDAO.getTiposDocumento();
		request.setAttribute("datos", datos);
		getServletContext().getRequestDispatcher("/WEB-INF/jsp/identificacion.jsp").forward(request, response);
		
	}

}
