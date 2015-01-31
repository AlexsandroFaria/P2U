<%@page import="java.util.*"%>
<%@page import="br.com.doisUnidos.modelo.*"%>
<%@page import="br.com.doisUnidos.modelo.dao.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script language="javascript">
function verifica()
  {
        if (cadastroDeProduto.nome.value=="") {
            alert("Por favor, Informe o nome do produto!");
            return false;}
            
        if (cadastroDeProduto.quantidade.value=="") {
                alert("Por favor, Informe a quantidade inicial em estoque do produto!");
                return false;}
        
        if (cadastroDeProduto.quantidadeDeEstoque.value=="") {
            alert("Por favor, Informe a quantidade mínima do produto em estoque");
            return false;}
        else{
        	alert("Produto cadastrado com sucesso!");
        }
        
  }
</script>

<style type="text/css">
	<%@include file="/css/formularios.css"%>
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Produto</title>
</head>
<body>

<c:import url="/WEB-INF/views/menu/menu.jsp" />

	<h1 class="textoPrincipalPaginas">Tela de Cadastro de Produtos</h1>
	
	<form name="cadastroDeProduto" action="cadastroDeProduto" method="post" id="contactForm">
		<fieldset>
			<legend>Informações dos Produtos</legend>
			
			<div class="field">
				<label for="nome">Nome:</label>
				<input type="text" name="nome" id="nome" class="input">
				<p class="hint">Insira o nome do Produto</p>
			</div>
			
			<div class="field">
				<label for="fornecedor">Fornecedor:</label>
				<select name="fornecedor" id="fornecedor" class="input">
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
			<p class="hint">Selecione um Fornecedor</p>
			</div>
			
			<div class="field">
				<label for="quantidade">Quantidade:</label>
					
					<input type="text" name="quantidade" id="quantidade" class="input">
					<p class="hint">Insira a quantidade em estoque atual: O valor não pode ser nulo.</p>
			</div>
			
			<div class="field">
					<label for="quantidadeDeEstoque">Mínimo em Estoque:</label>
					<input type="text" id="quantidadeDeEstoque" name="quantidadeDeEstoque" class="input"> 
					<p class="hint">Quantidade Mínima que deve possuir o estoque: Caso não possua informar campo com 0</p>
			</div>
		
			<div class="field">
				<label for="valorDeVenda">Valor de Compra:</label>
				<input type="text" name="valorDeVenda" class="input">
				<p class="hint">Informe o valor de Compra</p>
			</div>
				
			<div class="field">		
				<label for="valorDeCompra">Valor de Venda:</label>
				<input type="text" name="valorDeCompra" class="input">
				<p class="hint">Informe o Valor de Venda</p>
			</div>
			
		</fieldset><br>
		
		<fieldset>
			<legend>Descrição do Produto</legend>
			
			<div class="field">
				<textarea name="descricao" id="descricao" class="inputArea"></textarea>
				<p class="hint">Informe uma breve descrição</p>
			</div>
				
				</fieldset>
					<br>
					
					<input type="submit" onclick="verifica()" value="Cadastrar Produto" class="botao" />
		
		</form>

	<c:import url="/WEB-INF/views/menu/rodape.jsp" />

</body>
</html>