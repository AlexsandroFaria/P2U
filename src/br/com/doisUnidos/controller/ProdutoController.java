package br.com.doisUnidos.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.doisUnidos.modelo.Produto;
import br.com.doisUnidos.modelo.dao.ProdutoDAO;

@Controller
public class ProdutoController {

	@RequestMapping("novoProduto")
	public String novo() {
		return "produto/cadastro_produto";
	}

	@RequestMapping("cadastroDeProduto")
	public String cadastroProduto(@Valid Produto produto, BindingResult result) {
		
		if(result.hasErrors()){
			return "produto/cadastro_produto";
		}
		
		ProdutoDAO dao = new ProdutoDAO();
		dao.adicionarProduto(produto);
		return "redirect:listaProduto";
	}

	@RequestMapping("listaProduto")
	public String listaDeProdutos(Model model) {
		ProdutoDAO dao = new ProdutoDAO();
		model.addAttribute("produtos", dao.listaDeProdutos());
		return "produto/lista_produto";
	}

	@RequestMapping("removeProduto")
	public String removeProduto(Produto produto) {
		ProdutoDAO dao = new ProdutoDAO();
		dao.removeProduto(produto);
		return "redirect:listaProduto";
	}

	// Abre a página de atualização de produtos passando o ID a ser atualizado
	@RequestMapping("entradaDeProduto")
	public String entradaDeProduto(Long idProduto, Model model) {
		
		ProdutoDAO dao = new ProdutoDAO();
		model.addAttribute("produto", dao.buscaPorId(idProduto));
		return "produto/entrada_produto";
	}

	// Atualiza o produto selecionado
	@RequestMapping("entradaProduto")
	public String entradaProduto(@Valid Produto produto, BindingResult result) {
		
		if(result.hasFieldErrors("quantidade")){
			return "produto/entrada_produto";
		}
		
		ProdutoDAO dao = new ProdutoDAO();
		dao.entradaProduto(produto);
		return "redirect:listaProduto";
	}

	// Abre página de alteração de produto passando ID
	@RequestMapping("alteraProduto")
	public String alteraProduto(Long idProduto,	Model model) {
		ProdutoDAO dao = new ProdutoDAO();
		model.addAttribute("produto", dao.buscaPorId(idProduto));
		return "produto/altera_produto";
	}

	// Altera o produto selecionado.
	@RequestMapping("alterarProduto")
	public String alterarProduto(@Valid Produto produto, BindingResult result) {
		
		if(result.hasErrors()){
			return "produto/altera_produto";
		}
		
		ProdutoDAO dao = new ProdutoDAO();
		dao.alteraProduto(produto);
		return "redirect:listaProduto";
	}

	@RequestMapping("saidaDeProduto")
	public String saidaDeProduto(Long idProduto, Model model) {
		ProdutoDAO dao = new ProdutoDAO();
		model.addAttribute("produto", dao.buscaPorId(idProduto));
		return "produto/saida_produto";
	}

	// Atualiza o produto selecionado
	@RequestMapping("saidaProduto")
	public String saidaProduto(@Valid Produto produto, BindingResult result) {
		
		if(result.hasFieldErrors("quantidade")){
			return "produto/saida_produto";
		}
		
		ProdutoDAO dao = new ProdutoDAO();
		dao.saidaProduto(produto);	
		return "redirect:listaProduto";
		}
	
	@RequestMapping("regra")
	public String regra(){
			return "redirect:saida_produto";
	}
}
