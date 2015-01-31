<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script>
	function alerta(){
		alert("Fornecedor alterado com sucesso!");
}
</script>

<script>
	function formatar(mascara, documento){
		var i = documento.value.length;
		var saida = mascara.substring(0,1);
		var texto = mascara.substring(i);
		
		if(texto.substring(0,1) != saida){
			documento.value += texto.substring(0,1);
		}
	}
</script>

<style type="text/css">
	<%@include file="/css/formularios.css"%>
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alteração de Fornecedor</title>
</head>
<body>
<c:import url="/WEB-INF/views/menu/menu.jsp" />

<h1 align="center">Alteração de Fornecedor - ${fornecedor.nome}</h1>

<h4 align="center" ><form:errors path="fornecedor.contato" cssStyle="color:red"/> </h4>
<h4 align="center" ><form:errors path="fornecedor.nome" cssStyle="color:red"/> </h4>
<h4 align="center" ><form:errors path="fornecedor.numero" cssStyle="color:red"/> </h4>

<form action="alterarFornecedor" method="post" id="contactForm">

	<fieldset>
	<legend>Informações do Fornecedor</legend>
		<input type="hidden" name="idFornecedor" value="${fornecedor.idFornecedor}" class="input">
	
	<div>
		<label for="nome">Nome:</label>
		<input type="text" name="nome" value="${fornecedor.nome}" class="input">
	</div>
	
	<div>
		<label for="contato">Contato:</label>
		<input type="text" name="contato" value="${fornecedor.contato}" class="input">
	</div>
	
	<div>
		<label for="telefone">Telefone:</label>
		<input type="text" name="telefone" value="${fornecedor.telefone}" OnKeyPress="formatar('##-####-####',this)" class="input">
	</div>
	
	<div>
		<label for="cnpj">CNPJ:</label>
		<input type="text" name="cnpj" value="${fornecedor.cnpj}" OnKeyPress="formatar('##.###.###/####-##',this)" class="input">
	</div>
	
	<div>
		<label for="iEstadual">Ins. Estadual</label>
		<input type="text" name="iEstadual" value="${fornecedor.iEstadual}" class="input">
	</div>
	
	<div>
		<label for="iMunicipal">Insc. Municipal:</label>
		<input type="text" name="iMunicipal" value="${fornecedor.iMunicipal}" class="input">
	</div>
	</fieldset>
	<br>
	
	<fieldset>
	<legend>Endereço</legend>
		
	<div>	
		<label for="rua">Rua/Av:</label>
		<input type="text" name="rua" value="${fornecedor.rua}" class="input">
	</div>
	
	<div>
		<label for="numero">Número:</label>
		<input type="text" name="numero" value="${fornecedor.numero}" class="input">
	</div>
	
	<div>
		<label for="complemento">Complemento:</label>
		<input type="text" name="complemento" value="${fornecedor.complemento}" class="input">
	</div>
	
	<div>
		<label for="bairro">Bairro:</label>
		<input type="text" name="bairro" value="${fornecedor.bairro}" class="input">
	</div>
	
	<div>
		<label for="cidade">Cidade:</label>
		<input type="text" name="cidade" value="${fornecedor.cidade}" class="input">
	</div>
	
	<div>
		<label for="uf">UF:</label>
		<input type="text" name="uf" value="${fornecedor.uf}" class="input">
	</div>
	
	<div>
		<label for="cep">Cep:</label>
		<input type="text" name="cep" value="${fornecedor.cep}" OnKeyPress="formatar('#####-###',this)" class="input">
	</div>
	</fieldset>
	<br>
		<input type="submit" onclick="alerta()" value="Alterar Fornecedor" class="botao">
</form>


<c:import url="/WEB-INF/views/menu/rodape.jsp" />
</body>
</html>