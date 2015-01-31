<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listagem de Produtos</title>

<script language="JavaScript">  
  function confirmaExclusao() {  
    if (confirm("Deseja realmente excluir este Produto?"))  
      return true;  
    else  
      return false;  
  }  
</script>  

</head>
<body>

	<jsp:useBean id="produto" class="br.com.doisUnidos.modelo.Produto" />
	<c:import url="/WEB-INF/views/menu/menu.jsp" />

	<h1 class="textoPrincipalPaginas">Lista de Produtos</h1>

	<table class="listas" border="1">
		<thead align="center">
			<tr>
				<th>Nome</th>
				<th>Fornecedor</th>
				<th>Quantidade</th>
				<th>Quantidade Mínima</th>
				<th>Valor de Compra R$</th>
				<th>Valor de Venda R$</th>
				<th>Descrição</th>
				<th>Data de Atualização</th>
				<th>Remover</th>
				<th>Entrada de Produtos</th>
				<th>Saída de Produtos</th>
				<th>Alterar</th>
				<th>OBS</th>
			</tr>
		</thead>

		<c:forEach items="${produtos}" var="produto">

			<c:if test="${produto.quantidade <= produto.quantidadeDeEstoque}">
				<tr class="itemQuantidadeBaixa">
					<td>${produto.nome}</td>
					<td>${produto.fornecedor}</td>
					<td>${produto.quantidade}</td>
					<td>${produto.quantidadeDeEstoque}</td>
					<td>R$ ${produto.valorDeCompra}</td>
					<td>R$ ${produto.valorDeVenda}</td>
					<td>${produto.descricao}</td>
					<td><fmt:formatDate value="${produto.dataDeAtualizacao}"
							pattern="dd/MM/yyyy" /></td>
					<td class=""><a href="removeProduto?idProduto=${produto.idProduto}" onclick="return confirmaExclusao()" >Remover</a></td>
					<td><a href="entradaDeProduto?idProduto=${produto.idProduto}">Entrada de
							Produtos</a></td>
					<td><a href="saidaDeProduto?idProduto=${produto.idProduto}">Saída de
							Produtos</a></td>
					<td><a href="alteraProduto?idProduto=${produto.idProduto}">Alterar</a>
					<td><c:choose>
							<c:when
								test="${produto.quantidade <= produto.quantidadeDeEstoque}">
								<p>Efetuar Novo Pedido</p>
							</c:when>
						</c:choose></td>
				</tr>

			</c:if>
		</c:forEach>

		<c:forEach items="${produtos}" var="produto">
			<c:if test="${produto.quantidade > produto.quantidadeDeEstoque}">
				<tr>
					<td>${produto.nome}</td>
					<td>${produto.fornecedor}</td>
					<td>${produto.quantidade}</td>
					<td>${produto.quantidadeDeEstoque}</td>
					<td>R$ ${produto.valorDeCompra}</td>
					<td>R$ ${produto.valorDeVenda}</td>
					<td>${produto.descricao}</td>
					<td><fmt:formatDate value="${produto.dataDeAtualizacao}"
							pattern="dd/MM/yyyy" /></td>
					<td class=""><a href="removeProduto?idProduto=${produto.idProduto}" onclick="return confirmaExclusao()">Remover</a></td>
					<td><a href="entradaDeProduto?idProduto=${produto.idProduto}">Entrada de
							Produtos</a></td>
					<td><a href="saidaDeProduto?idProduto=${produto.idProduto}">Saída de
							Produtos</a></td>
					<td><a href="alteraProduto?idProduto=${produto.idProduto}">Alterar</a>
					<td><c:choose>
							<c:when
								test="${produto.quantidade >= produto.quantidadeDeEstoque}">
								<p>Estoque ok</p>
							</c:when>
						</c:choose></td>
				</tr>
			</c:if>
		</c:forEach>

	</table>
	<br>
	
	
	<c:import url="/WEB-INF/views/menu/rodape.jsp" />
</body>
</html>