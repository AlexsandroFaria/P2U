package br.com.doisUnidos.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.doisUnidos.modelo.Fornecedor;
import br.com.doisUnidos.modelo.dao.FornecedorDAO;

@Controller
public class FornecedorController {

	@RequestMapping("chamaFornecedor")
	public String chamaFornecedor() {
		return "fornecedor/cadastro_fornecedor";
	}

	@RequestMapping("cadastrarFornecedor")
	public String cadastrarFornecedor(@Valid Fornecedor fornecedor, BindingResult result) {
		
		if(result.hasErrors()){
			return "fornecedor/cadastro_fornecedor";
		}
		FornecedorDAO dao = new FornecedorDAO();
		dao.cadastrarFornecedor(fornecedor);
		return "redirect:listaFornecedor";
	}

	@RequestMapping("listaFornecedor")
	public String listaDeFornecedor(Model model) {
		FornecedorDAO dao = new FornecedorDAO();
		model.addAttribute("fornecedores", dao.getLista());
		return "fornecedor/lista_fornecedor";
	}

	@RequestMapping("removeFornecedor")
	public String removeProduto(Fornecedor fornecedor) {
		
		FornecedorDAO dao = new FornecedorDAO();
		dao.removeFornecedor(fornecedor);
		return "redirect:listaFornecedor";
	}

	
	@RequestMapping("formFornecedor")
	public String alteraFornecedor(Long idFornecedor, Model model) {
		FornecedorDAO dao = new FornecedorDAO();
		model.addAttribute("fornecedor", dao.buscaPorId(idFornecedor));
		return "fornecedor/alterar_fornecedor";
	}

	// Altera o fornecedor selecionado.
	@RequestMapping("alterarFornecedor")
	public String alterarFornecedor(@Valid Fornecedor fornecedor, BindingResult result) {
		
		if(result.hasErrors()){
			return "fornecedor/alterar_fornecedor";
		}
		
		FornecedorDAO dao = new FornecedorDAO();
		dao.alteraFornecedor(fornecedor);
		return "redirect:listaFornecedor";
	}
	
	
}
