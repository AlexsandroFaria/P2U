<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script language="javascript">
function verifica(){
        if (cadastrarFornecedor.nome.value=="") {
            alert("Por favor, Informe o nome do Fornecedor!");
            return false;}
            
        if (cadastrarFornecedor.contato.value=="") {
                alert("Por favor, Informe o contato do Fornecedor!");
                return false;}
        
        if (cadastrarFornecedor.telefone.value=="") {
            alert("Por favor, Informe o telefone do Fornecedor");
            return false;}
        
        else{
        	alert("Fornecedor cadastrado com sucesso!");
        }
  }
</script>

<script>
	function formatar(mascara, documento) {
		var i = documento.value.length;
		var saida = mascara.substring(0, 1);
		var texto = mascara.substring(i);

		if (texto.substring(0, 1) != saida) {
			documento.value += texto.substring(0, 1);
		}
	}
</script>

<style type="text/css">
	<%@include file="/css/formularios.css"%>
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Fornecedor</title>
</head>
<body>

	<c:import url="/WEB-INF/views/menu/menu.jsp" />
	<h1 class="textoPrincipalPaginas">Cadastro de Fornecedores</h1>


	<form action="cadastrarFornecedor" name="cadastrarFornecedor" method="post" id="contactForm">
		<fieldset>
			<legend>Informações do Fornecedor</legend>
			
		<div class="field">
			<label for="nome"> Nome:</label>
			<input type="text" name="nome" id="nome" class="input">
			<p class="hint">Insira o nome do Fornecedor</p>	
		</div>
		
		<div class="field">
			<label for="contato">Contato:</label>
			<input type="text" name="contato" id="contato" class="input">	
			<p class="hint">Insira o nome do contato do Fornecedor</p>
		</div>
			
		<div class="field">
			<label for="telefone"> Telefone:</label>
			<input type="text" name="telefone" id="telefone" maxlength="13" OnKeyPress="formatar('##-#####-####',this)" class="input">
			<p class="hint">Insira o Telefone</p>
		</div>
		
		<div class="field">
			 <label for="cnpj"> CNPJ:</label>
			 <input type="text" name="cnpj" maxlength="18" OnKeyPress="formatar('##.###.###/####-##',this)" class="input">
			 <p class="hint">Insira o CNPJ</p>
		</div>
		
		<div class="field">	
			 <label for="iEstadual"> Ins. Estadual</label>
			 <input type="text" maxlength="20" name="iEstadual" class="input">
			 <p class="hint">Insira a Inscrição Estadual</p>
		</div>	
			
		<div class="field">
			<label for="iMunicipal"> Insc. Municipal:</label>
			<input type="text" maxlength="20" name="iMunicipal" class="input">
			<p class="hint">Insira a Inscrição Municipal</p>
		</div>
		
		</fieldset>
		<br>
		<fieldset>
			<legend>Endereço do Fornecedor</legend>
			
		<div class="field">
			<label for="rua"> Rua/Av:</label>
			<input type="text" name="rua" class="input">
			<p class="hint">Insira o nome da rua</p>
		</div>	
		
		<div class="field">
			<label for="numero"> Número:</label>
			<input type="text" name="numero" class="input">
			<p class="hint">Insira o número</p>
		</div>
			
		<div class="field">
			<label for="complemento"> Complemento:</label>
			<input type="text" name="complemento" class="input">
			<p class="hint">Insira o complemento</p>
		</div>	
			
		<div class="field">
			 <label for="bairro"> Bairro:</label>
			 <input type="text" name="bairro" class="input">
			 <p class="hint">Insira o Bairro</p>
		</div>
			
		<div class="field">
			 <label for="cidade"> Cidade:</label>
			 <input type="text" name="cidade" class="input">
			 <p class="hint">Insira a Cidade</p>
		</div>
		
		<div class="field">
			 <label for="uf"> UF:</label>
			 <input type="text" name="uf" maxlength="2" class="input">
			 <p class="hint">Insira o UF</p>
		</div>
			
		<div class="field">
			 <label for="cep"> Cep:</label>
			 <input type="text" name="cep" maxlength="9" OnKeyPress="formatar('#####-###',this)" class="input">
			 <p class="hint">Insira o CEP</p>
		</div>
		</fieldset>
		<br> <input type="submit" onclick="verifica()" value="Cadastrar Fornecedor"
			class="botao">

	</form>


	<c:import url="/WEB-INF/views/menu/rodape.jsp" />
</body>
</html>