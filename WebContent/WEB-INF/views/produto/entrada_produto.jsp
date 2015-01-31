<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script language="javascript">
function verifica()
  {
        if (entradaProduto.quantidade.value=="") {
            alert("Por favor, Informe a quantidade de entrada do produto! Valor não pode estar vazio.");
            return false;}
        else{
        	alert("Entrada do produto efetuada com sucesso!");
        }
  }
</script>

<style type="text/css">
	<%@include file="/css/formularios.css"%>
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Entrada de Produtos</title>
</head>
<body>

	<c:import url="/WEB-INF/views/menu/menu.jsp" />

	<h1 class="textoPrincipalPaginas">Entrada de Produto</h1>
	
	<form action="entradaProduto" name="entradaProduto" method="post" id="contactForm">
	<fieldset>
	<legend>Entrada de Produto ${produto.nome}</legend>
	
		<input type="hidden" name="idProduto" value="${produto.idProduto}">
		
		<div>
			<label for="nome">Nome:</label>
			<input type="text" name="nome" value="${produto.nome}" class="input" disabled="disabled"/>
		</div>
		
		<div class="field">
			<label for="quantidade">Quantidade de Entrada:</label>
			<input type="text" id="quantidade" name="quantidade" class="input">
			<p class="hint">Informe a quantidade a ser dado entrada.</p>
		</div>
			
			</fieldset><br>
			
			<div>
				<input type="submit" onclick="verifica()" value="Atualizar Entrada de Produto" class="botao">
			</div>
				
	</form>
	<c:import url="/WEB-INF/views/menu/rodape.jsp" />
</body>
</html>