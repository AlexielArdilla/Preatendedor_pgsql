package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TpoTramiteDAO {
	
public List<TipoTamite> getTiposDeTramite(){
		
		List<TipoTamite> tiposTramites = new ArrayList<>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = MiConexion.getConnection();
			ps = con.prepareStatement(
					"select TIPO_TRAMITE.ID, TIPO_TRAMITE.TIPO from TIPO_TRAMITE");
			rs = ps.executeQuery();

			while (rs.next()) {

				TipoTamite tipo = new TipoTamite();
			
				tipo.setId(rs.getInt(1));
				tipo.setTipo(rs.getString(2));
			
				tiposTramites.add(tipo);
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
						
		return tiposTramites;
		
	}

public TipoTamite getTipoFromId(int id){
	
	TipoTamite tipo = new TipoTamite();
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try {
		con = MiConexion.getConnection();
		ps = con.prepareStatement(
				"select TIPO_TRAMITE.ID, TIPO_TRAMITE.TIPO from TIPO_TRAMITE where TIPO_TRAMITE.ID = "+ id);
		rs = ps.executeQuery();

		while (rs.next()) {

			tipo.setId(rs.getInt(1));
			tipo.setTipo(rs.getString(2));
		
			
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
					
	return tipo;
	
}

}
