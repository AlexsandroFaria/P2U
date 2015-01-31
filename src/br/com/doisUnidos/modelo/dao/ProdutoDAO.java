package br.com.doisUnidos.modelo.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.doisUnidos.connection.ConnectionFactory;
import br.com.doisUnidos.modelo.Produto;

public class ProdutoDAO {

	private Connection connection;
	PreparedStatement stmt;
	ResultSet rs;
	
	public ProdutoDAO() {
		this.connection = new ConnectionFactory().getConnection();
	}

	public void adicionarProduto(Produto produto) {

		String sql = "insert into produto "
				+ "(nome, fornecedor, quantidade, quantidadeDeEstoque, valorDeCompra, valorDeVenda, descricao, datadeatualizacao)"
				+ "values (?,?,?,?,?,?,?,?)";

		try {
			stmt = connection.prepareStatement(sql);

			stmt.setString(1, produto.getNome());
			stmt.setString(2, produto.getFornecedor());
			stmt.setInt(3, produto.getQuantidade());
			stmt.setInt(4, produto.getQuantidadeDeEstoque());
			stmt.setString(5, produto.getValorDeCompra());
			stmt.setString(6, produto.getValorDeVenda());
			stmt.setString(7, produto.getDescricao());
			stmt.setDate(8, new Date(Calendar.getInstance().getTimeInMillis()));

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

	public List<Produto> listaDeProdutos() {
		try {

			List<Produto> produtos = new ArrayList<Produto>();
			stmt = this.connection
					.prepareStatement("select * from produto");

			rs = stmt.executeQuery();

			while (rs.next()) {
				produtos.add(populaProduto(rs));
			}

			return produtos;

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

	private Produto populaProduto(ResultSet rs) throws SQLException {

		Produto produto = new Produto();

		produto.setIdProduto(rs.getLong("id_produto"));
		produto.setNome(rs.getString("nome"));
		produto.setFornecedor(rs.getString("fornecedor"));
		produto.setQuantidade(rs.getInt("quantidade"));
		produto.setQuantidadeDeEstoque(rs.getInt("quantidadeDeEstoque"));
		produto.setValorDeCompra(rs.getString("valorDeCompra"));
		produto.setValorDeVenda(rs.getString("valorDeVenda"));
		produto.setDescricao(rs.getString("descricao"));
		produto.setDataDeAtualizacao(rs.getDate("datadeatualizacao"));

		return produto;
	}

	public void removeProduto(Produto produto) {
		
		String sql = "delete from produto where id_produto = ?";

		try {

			stmt = connection.prepareStatement(sql);
			stmt.setLong(1, produto.getIdProduto());
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

	public Produto buscaPorId(Long idProduto) {

		if (idProduto == null) {
			throw new IllegalStateException("Id do produto não deve ser nulo");
		}

		try {
			stmt = this.connection.prepareStatement("select * from produto where id_produto = ?");
			
			stmt.setLong(1, idProduto);

			rs = stmt.executeQuery();
			if (rs.next()) {
				return populaProduto(rs);
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

	public void entradaProduto(Produto produto) {

		String sql = "update produto set quantidade = quantidade + ?, dataDeAtualizacao = ? where id_produto = ?";

		try {

			stmt = connection.prepareStatement(sql);

			stmt.setInt(1, produto.getQuantidade());
			stmt.setDate(2, new Date(Calendar.getInstance().getTimeInMillis()));
			stmt.setLong(3, produto.getIdProduto());
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

	public void alteraProduto(Produto produto) {

		String sql = "update produto set nome = ?,"
				+  "fornecedor = ?, quantidade = ?, quantidadeDeEstoque = ?, valorDeCompra = ?, valorDeVenda = ?, descricao = ?, dataDeAtualizacao = ? where id_produto = ?";

		try {

			stmt = connection.prepareStatement(sql);

			stmt.setString(1, produto.getNome());
			stmt.setString(2, produto.getFornecedor());
			stmt.setInt(3, produto.getQuantidade());
			stmt.setInt(4, produto.getQuantidadeDeEstoque());
			stmt.setString(5, produto.getValorDeCompra());
			stmt.setString(6, produto.getValorDeVenda());
			stmt.setString(7, produto.getDescricao());
			stmt.setDate(8, new Date(Calendar.getInstance().getTimeInMillis()));
			stmt.setLong(9, produto.getIdProduto());
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

	public void saidaProduto(Produto produto) {

		String sql = "update produto set quantidade = quantidade - ?, dataDeAtualizacao = ? where id_produto = ?";
		
		try {

			stmt = connection.prepareStatement(sql);

			stmt.setInt(1, produto.getQuantidade());
			stmt.setDate(2, new Date(Calendar.getInstance().getTimeInMillis()));
			stmt.setLong(3, produto.getIdProduto());
			
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
