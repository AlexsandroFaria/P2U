package br.com.doisUnidos.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.doisUnidos.connection.ConnectionFactory;
import br.com.doisUnidos.modelo.Usuario;

public class UsuarioDAO {

	private Connection connection;
	ResultSet rs;
	PreparedStatement stmt;
	
	public UsuarioDAO() {
		this.connection = new ConnectionFactory().getConnection();
	}
	
	public boolean existeUsuario(Usuario usuario){
		
		if(usuario==null){
			throw new IllegalArgumentException("Usuário não deve ser nulo");
		}
		
		try {
			stmt = this.connection.prepareStatement("select * from usuario where login = ? and senha = ?");
			stmt.setString(1, usuario.getLogin());
			stmt.setString(2, usuario.getSenha());
			rs = stmt.executeQuery();
			
			boolean encontrado = rs.next();
			
			return encontrado;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}finally{
			try {
				rs.close();
				stmt.close();
				connection.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
	}
	
	public void cadastraUsuario(Usuario usuario){
		String sql = "insert into usuario(nomecompleto, login, senha)values(?,?,?)";
		
		try {
			stmt = connection.prepareStatement(sql);
			
			stmt.setString(1, usuario.getNomeCompleto());
			stmt.setString(2, usuario.getLogin());
			stmt.setString(3, usuario.getSenha());
			
			stmt.execute();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}finally{
			try {
				stmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public List<Usuario> listaDeUsuarios() {
		try {

			List<Usuario> usuarios = new ArrayList<Usuario>();
			stmt = this.connection
					.prepareStatement("select * from usuario");

			rs = stmt.executeQuery();

			while (rs.next()) {
				usuarios.add(populaUsuario(rs));
			}

			return usuarios;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}finally{
			try {
				rs.close();
				stmt.close();
				connection.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
	}
	
	private Usuario populaUsuario(ResultSet rs) throws SQLException {

		Usuario usuario = new Usuario();

		usuario.setIdUsuario(rs.getLong("id_usuario"));
		usuario.setNomeCompleto(rs.getString("nomecompleto"));
		usuario.setLogin(rs.getString("login"));
		

		return usuario;
	}
	
	public void removeUsuario(Usuario usuario) {
		
		String sql = "delete from usuario where id_usuario = ?";

		try {

			stmt = connection.prepareStatement(sql);
			stmt.setLong(1, usuario.getIdUsuario());
			stmt.execute();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}finally{
			try {
				stmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
}
