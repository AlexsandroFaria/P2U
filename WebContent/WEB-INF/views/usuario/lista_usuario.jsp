<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script language="JavaScript">  
  function confirmaExclusao() {  
    if (confirm("Deseja realmente excluir este Usuário?"))  
      return true;  
    else  
      return false;  
  }  
</script> 

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de Usuários Cadastrados</title>
</head>
<body>

<jsp:useBean id="usuario" class="br.com.doisUnidos.modelo.Usuario" />
<c:import url="/WEB-INF/views/menu/menu.jsp" />

<table class="listas" border="1">
		<thead align="center">
			<tr>
				<th>Nome Completo</th>
				<th>Login</th>
				<th>Senha</th>
				<td>Remover</td>
			</tr>
		</thead>
		<c:forEach items="${usuarios}" var="usuario">
			<tr>
				<td>${usuario.nomeCompleto}</td>
				<td>${usuario.login}</td>
				<td>*****</td>
				<td><a href="removeUsuario?idUsuario=${usuario.idUsuario}" onclick="return confirmaExclusao()">Remover</a>
				</td>
			</tr>
		</c:forEach>
</table>

<c:import url="/WEB-INF/views/menu/rodape.jsp" />

</body>
</html>