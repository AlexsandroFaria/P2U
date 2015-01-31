<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script language="JavaScript">  
  function confirmaExclusao() {  
    if (confirm("Deseja realmente excluir este Fornecedor?"))  
      return true;  
    else  
      return false;  
  }  
</script> 

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de Fornecedor</title>
</head>
<body>

	<c:import url="/WEB-INF/views/menu/menu.jsp" />

	<h1 class="textoPrincipalPaginas">Lista de Fornecedores</h1>

	<table align="center" border="1" class="listas">
		<thead>
			<tr>
				<th>Nome</th>
				<th>Contato</th>
				<th>Telefone</th>
				<th>CNPJ</th>
				<th>Inscrição Estadual</th>
				<th>Inscrição Municipal</th>
				<th>Rua</th>
				<th>Número</th>
				<th>Complemento</th>
				<th>Bairro</th>
				<th>Cidade</th>
				<th>UF</th>
				<th>CEP</th>
				<th>Remover</th>
				<th>Alterar</th>
			</tr>
		</thead>

		<c:forEach items="${fornecedores}" var="fornecedor">
			<tr>
				<td>${fornecedor.nome}</td>
				<td>${fornecedor.contato}</td>
				<td>${fornecedor.telefone}</td>
				<td>${fornecedor.cnpj}</td>
				<td>${fornecedor.iEstadual}</td>
				<td>${fornecedor.iMunicipal}</td>
				<td>${fornecedor.rua}</td>
				<td>${fornecedor.numero}</td>
				<td>${fornecedor.complemento}</td>
				<td>${fornecedor.bairro}</td>
				<td>${fornecedor.cidade}</td>
				<td>${fornecedor.uf}</td>
				<td>${fornecedor.cep}</td>
				<td><a href="removeFornecedor?idFornecedor=${fornecedor.idFornecedor}" onclick="return confirmaExclusao()">Remover</a>
				</td>
				<td><a href="formFornecedor?idFornecedor=${fornecedor.idFornecedor}">Alterar</a>
				</td>
			</tr>

		</c:forEach>

	</table>


	<c:import url="/WEB-INF/views/menu/rodape.jsp" />

</body>
</html>