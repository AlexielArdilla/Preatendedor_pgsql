package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PersonaDAO {
	
	public Persona getPersonaFromId(String tipo, int dni){
		
		Persona persona = new Persona();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = MiConexionASIU.getConnection();
			ps = con.prepareStatement(
					"select documento, tipo_de_usuario, nombres, apellidos from datos "+ 
							"where tipo_documento = ? AND documento = ?");
			
			ps.setString(1, tipo);
			ps.setInt(2, dni);
			
			rs = ps.executeQuery();

			while (rs.next()) {

				persona.setDNI(rs.getInt(1));
				persona.setTipo_usuario(rs.getString(2));
				persona.setNombres(rs.getString(3));
				persona.setApellidos(rs.getString(4));
				
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
						
		return persona;
		
	}
	
}
