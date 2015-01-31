<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script language="javascript">
function verifica()
  {
        if (login.login.value=="") {
            alert("Por favor, Informe Login e Senha!");
            return false;}
            
        if (login.senha.value=="") {
                alert("Por favor, Informe Login e Senha!");
                return false;}
  }
</script>

<style type="text/css">
	<%@include file="/css/formularios.css"%>
</style>

<title>Padaria Dois Unidos</title>
</head>
<body>

<div align="center">
<img src="imagens/logo2unidos.png" /> 
</div>
<br/> 
<form name="login" action="logar" method="post" id="contactForm">
	
	<fieldset>
		<legend>Login</legend>
		
		<div class="field">
			<label for="login">	Usuário:</label>
			<input type="text" name="login" id="usuario" class="input">
			<p class="hint">Insira Login do Usuário</p>
		</div>
		
		<div class="field">
			<label for="senha">	Senha:</label>
			<input type="password" name="senha" id="senha" class="input">
			<p class="hint">Insira a senha do Usuário</p>
		</div>
		
	</fieldset><br>
	<input type="submit" value="Entrar no Sistema" class="botao" onclick="verifica()">
	
</form>
<c:import url="/WEB-INF/views/menu/rodape.jsp" />
</body>
</html>