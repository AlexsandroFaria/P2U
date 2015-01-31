<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script language="javascript">
	function confirmaSenha() {
		if(document.cadastroUsuario.senha.value != document.cadastroUsuario.confirmarSenha.value) {
			alert("Senhas não conferem, Favor redigitar a senha corretamente!");}
	}
</script>

<style type="text/css">
	<%@include file="/css/formularios.css"%>
	<%@include file="/css/estilo_padrao.css"%>
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Usuários</title>
</head>
<body>

<c:import url="/WEB-INF/views/menu/menu.jsp" />

<h1 class="textoPrincipalPaginas">Cadastro de Usuários</h1>

<form action="cadastroUsuario" name="cadastroUsuario" method="post" id="contactForm">

	<fieldset>
		<legend>Informação de Usuários</legend>
			
			<div class="field">
				<label for="nome">Nome Completo:</label>
				<input type="text" name="nomeCompleto" id="nomeCompleto" class="input">
				<p class="hint">Infome o nome completo.</p>
			</div>
			
			<div class="field">
				<label for="login">Login:</label>
				<input type="text" name="login" id="login" class="input">
				<p class="hint">Informe o Login do Usuário.</p>
			</div>
		
			<div class="field">
				<label for="senha">Senha:</label>
				<input type="password" name="senha" id="senha" class="input">
				<p class="hint">Informe a Senha do Usuário.</p>
			</div>
			
			<div class="field">
				<label for="confirmarSenha">Confirmar Senha:</label>
				<input type="password" name="confirmarSenha" id="confirmarSenha" class="input">
				<p class="hint">Redigite a Senha do Usuário.</p>
			</div>
		
	</fieldset><br/>
	
	<input type="submit" onclick="confirmaSenha()" value="Cadastrar Usuário" class="botao">
	
</form><br/>

<table align="center" class="formatacaoLinksMenu">
<tr>
	<td><a href="listaUsuario" class="linkMenu">Listar Usuários Cadastrados</a></td>
</tr>
</table>

<c:import url="/WEB-INF/views/menu/rodape.jsp" />

</body>
</html>