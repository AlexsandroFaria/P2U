<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script language="javascript">
function verifica(){
        if (saidaProduto.quantidade.value=="") {
            alert("Por favor, Informe a quantidade de saída do produto! Valor não pode estar vazio.");
            return false;}
        else{
        	alert("Saída do produto efetuada com sucesso!");
        }
  }
</script>

<style type="text/css">
	<%@include file="/css/formularios.css"%>
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Saída de Produtos</title>
</head>

<body>
	<c:import url="/WEB-INF/views/menu/menu.jsp" />

	<h1 class="textoPrincipalPaginas">Saída de Produto</h1>
	
	<form action="saidaProduto" name="saidaProduto" method="post" id="contactForm">
	
		<fieldset>
		<legend>Saída do Produto ${produto.nome}</legend>
		
		<input type="hidden" name="idProduto" value="${produto.idProduto}">
		
		<div>
			<label for="nome">Nome:</label>
			<input type="text" name="nome" value="${produto.nome}" class="input" disabled="disabled"/>
		</div>
		
		<div class="field">
			<label for="quantidade">Quantidade de Saída :</label>
			<input type="text" name="quantidade" class="input">
			<p class="hint">Quantidade não pode ser nula. Informe a quantidade para dar baixa no estoque</p>
		</div>
	
		</fieldset><br>
		
		<div>
			<input type="submit" onclick="verifica()" value="Dar saída no Produto" class="botao">
		</div>
	</form>
	
	<c:import url="/WEB-INF/views/menu/rodape.jsp" />
</body>
</html>