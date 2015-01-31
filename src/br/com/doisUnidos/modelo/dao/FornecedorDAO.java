package br.com.doisUnidos.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.doisUnidos.connection.ConnectionFactory;
import br.com.doisUnidos.modelo.Fornecedor;

public class FornecedorDAO {

	private Connection connection;
	PreparedStatement stmt;
	ResultSet rs;
	
	public FornecedorDAO() {
		this.connection = new ConnectionFactory().getConnection();
	}
	
	public void cadastrarFornecedor(Fornecedor fornecedor){
		String sql =  "insert into fornecedor" + "(nome, contato, telefone, cnpj, iEstadual, iMunicipal, rua, numero, complemento, bairro, cidade, uf, cep)"
	+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			
			stmt = connection.prepareStatement(sql);
			
			stmt.setString(1, fornecedor.getNome());
			stmt.setString(2, fornecedor.getContato());
			stmt.setString(3, fornecedor.getTelefone());
			stmt.setString(4, fornecedor.getCnpj());
			stmt.setString(5, fornecedor.getiEstadual());
			stmt.setString(6, fornecedor.getiMunicipal());
			stmt.setString(7, fornecedor.getRua());
			stmt.setString(8, fornecedor.getNumero());
			stmt.setString(9, fornecedor.getComplemento());
			stmt.setString(10, fornecedor.getBairro());
			stmt.setString(11, fornecedor.getCidade());
			stmt.setString(12, fornecedor.getUf());
			stmt.setString(13, fornecedor.getCep());
			
			stmt.execute();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}finally{
			try {
				stmt.close();
				connection.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
	}

	public List<Fornecedor> getLista() {
		
		try {
			
			List<Fornecedor>fornecedores = new ArrayList<Fornecedor>();
			stmt = this.connection.prepareStatement("select * from fornecedor");
			
			rs = stmt.executeQuery();
			
			while(rs.next()){
				fornecedores.add(populaFornecedor(rs));
			}
			
			return fornecedores;
			
		} catch (Exception e) {
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

	private Fornecedor populaFornecedor(ResultSet rs) throws SQLException {
		
		Fornecedor fornecedor = new Fornecedor();
		
		fornecedor.setIdFornecedor(rs.getLong("id_fornecedor"));
		fornecedor.setNome(rs.getString("nome"));
		fornecedor.setContato(rs.getString("contato"));
		fornecedor.setTelefone(rs.getString("telefone"));
		fornecedor.setCnpj(rs.getString("cnpj"));
		fornecedor.setiEstadual(rs.getString("iEstadual"));
		fornecedor.setiMunicipal(rs.getString("iMunicipal"));
		fornecedor.setRua(rs.getString("rua"));
		fornecedor.setNumero(rs.getString("numero"));
		fornecedor.setComplemento(rs.getString("complemento"));
		fornecedor.setBairro(rs.getString("bairro"));
		fornecedor.setCidade(rs.getString("cidade"));
		fornecedor.setUf(rs.getString("uf"));
		fornecedor.setCep(rs.getString("cep"));
		
		return fornecedor;
	}
	
	public void removeFornecedor(Fornecedor fornecedor){
		String sql = "delete from fornecedor where id_fornecedor = ?";
		
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setLong(1, fornecedor.getIdFornecedor());
			stmt.execute();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}finally{
			try {
				stmt.close();
				connection.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public Fornecedor buscaPorId(Long idFornecedor) {

		if (idFornecedor == null) {
			throw new IllegalStateException("Id do fornecedor não deve ser nulo");
		}

		try {
			stmt = this.connection.prepareStatement("select * from fornecedor where id_fornecedor = ?");
			
			stmt.setLong(1, idFornecedor);

			rs = stmt.executeQuery();
			if (rs.next()) {
				return populaFornecedor(rs);
			}

			return null;

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
	
	public void alteraFornecedor(Fornecedor fornecedor){
		
		String sql = "update fornecedor set nome=?, contato=?, telefone=?, cnpj=?, iEstadual=?, iMunicipal=?,"
		+ "rua=?, numero=?, complemento=?, bairro=?, cidade=?, uf=?, cep=? where id_fornecedor=?";
		
		try {
			stmt = connection.prepareStatement(sql);
			
			stmt.setString(1, fornecedor.getNome());
			stmt.setString(2, fornecedor.getContato());
			stmt.setString(3, fornecedor.getTelefone());
			stmt.setString(4, fornecedor.getCnpj());
			stmt.setString(5, fornecedor.getiEstadual());
			stmt.setString(6, fornecedor.getiMunicipal());
			stmt.setString(7, fornecedor.getRua());
			stmt.setString(8, fornecedor.getNumero());
			stmt.setString(9, fornecedor.getComplemento());
			stmt.setString(10, fornecedor.getBairro());
			stmt.setString(11, fornecedor.getCidade());
			stmt.setString(12, fornecedor.getUf());
			stmt.setString(13, fornecedor.getCep());
			stmt.setLong(14, fornecedor.getIdFornecedor());
			stmt.execute();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}finally{
			try {
				stmt.close();
				connection.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
	}
}
