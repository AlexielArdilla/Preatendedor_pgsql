package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TipoDocumentoDAO {
	
public List<TipoDocumento> getTiposDocumento(){
		
		List<TipoDocumento> tiposDocumentos = new ArrayList<>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		TipoDocumento tipo;
		
		try {
			con = MiConexionASIU.getConnection();
			ps = con.prepareStatement(
					"select DISTINCT (tipo_documento) from datos;");
			rs = ps.executeQuery();
			
			while (rs.next()) {

				tipo = new TipoDocumento();
			
				tipo.setDescripcion(rs.getString(1));
			
				tiposDocumentos.add(tipo);
			}
			
		} catch (SQLException e) {		
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				con.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}										
		}
						
		return tiposDocumentos;
		
	}

}
