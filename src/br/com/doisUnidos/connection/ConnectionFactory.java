package br.com.doisUnidos.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Criação
 * 
 * @author Alexsandro Luiz de Faria
 * */

public class ConnectionFactory {

	/**
	 * Classe ConnectionS
	 * 
	 * @return DriverManager.getConnection
	 * @
	 * */
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection("jdbc:mysql://localhost:3306/doisunidosbd","root", "alex");
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} catch (ClassNotFoundException c) {
			throw new RuntimeException(c);
		}
	}
}
