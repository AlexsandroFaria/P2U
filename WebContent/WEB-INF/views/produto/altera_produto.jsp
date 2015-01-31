<%@page import="java.util.*"%>
<%@page import="br.com.doisUnidos.modelo.*"%>
<%@page import="br.com.doisUnidos.modelo.dao.*"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script>
	function alerta(){
	alert("Produto alterado com sucesso!");
}
</script>

<style type="text/css">
	<%@include file="/css/formularios.css"%>
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alteração de Produto</title>
</head>
<body>

	<c:import url="/WEB-INF/views/menu/menu.jsp" />

	<h1 class="textoPrincipalPaginas">Alterar Produto</h1>

	<form action="alterarProduto" method="post" id="contactForm">
		
		<fieldset>
			<legend>Alteração do Produto ${produto.nome}</legend>
				<input type="hidden" name="idProduto" value="${produto.idProduto}" class="input">
			
			<div class="field">
				<label for="nome">Nome:</label>
				<input type="text" name="nome"	value="${produto.nome}" class="input">
				<p class="hint">Informe o nome a ser alterado</p>
			</div>
			
			<div class="field">
				<label for="fornecedor">Fornecedor:</label>
				<select	name="fornecedor" class="input">
					<option>Selecione o fornecedor...</option>
					<option>Não Possui Fornecedor</option>
					<%
						FornecedorDAO dao = new FornecedorDAO();
						List<Fornecedor> fornecedores = dao.getLista();
						for (Fornecedor fornecedor : fornecedores) {
					%>
					<option><%=fornecedor.getNome()%></option>
					<%
						}
					%>
			</select>
			<p class="hint">Informe o Fornecedor a ser alterado</p>
			</div>
			
			<div class="field">
				<label for="quantidade">Quantidade:</label>
				<input type="text" name="quantidade" value="${produto.quantidade}" class="input">
				<p class="hint">Informe a quantidade a ser alterada</p>
			</div>
			
			<div class="field">
				<label for="quantidadeDeEstoque">Mínimo em Estoque:</label>
				<input type="text" name="quantidadeDeEstoque" value="${produto.quantidadeDeEstoque}" class="input">
				<p class="hint">Informe a quantidade mínima em estoque a ser alterado</p>
			</div>
			
			<div class="field">
				<label for="valorDeCompra"> Valor de Compra:</label>
				<input type="text" name="valorDeCompra" value="${produto.valorDeCompra}" class="input">
				<p class="hint">Informe o Valor de compra a ser Alterado</p>
			</div>
			
			<div class="field">
				<label for="valorDeVenda">Valor de Venda:</label>
				<input type="text" name="valorDeVenda" value="${produto.valorDeVenda}" class="input">
				<p class="hint">Informe o Valor de Venda a ser alterado</p>
			</div>
			
		</fieldset>
		<br>
		
		<fieldset>
			<legend>Descrição do Produto ${produto.nome}</legend>
			
			<div class="field">
				<textarea name="descricao" id="descricao" class="inputArea"></textarea>
				<p class="hint">Informe uma breve descrição a ser alterada</p>
			</div>
		</fieldset><br>
		<input type="submit" onclick="alerta()" value="Alterar Produto" class="botao">

	</form>
	<c:import url="/WEB-INF/views/menu/rodape.jsp" />
</body>
</html>