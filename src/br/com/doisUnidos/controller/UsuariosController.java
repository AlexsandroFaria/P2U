package br.com.doisUnidos.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.doisUnidos.modelo.Usuario;
import br.com.doisUnidos.modelo.dao.UsuarioDAO;

@Controller
public class UsuariosController {

	@RequestMapping("cadastrarUsuario")
	public String telaUsuario(){
		return "usuario/cadastro_usuario";
	}
	
	@RequestMapping("cadastroUsuario")
	public String cadastraUsuario(@Valid Usuario usuario, BindingResult result){
		
		if(result.hasFieldErrors()){
			return "usuario/cadastro_usuario";
		}
		
		UsuarioDAO dao = new UsuarioDAO();
		dao.cadastraUsuario(usuario);
		return "redirect:listaUsuario";
	}
	
	
	@RequestMapping("listaUsuario")
	public String listaDeUsuarios(Model model) {
		UsuarioDAO dao = new UsuarioDAO();
		model.addAttribute("usuarios", dao.listaDeUsuarios());
		return "usuario/lista_usuario";
	}
	
	@RequestMapping("removeUsuario")
	public String removeProduto(Usuario usuario) {
		
		UsuarioDAO dao = new UsuarioDAO();
		dao.removeUsuario(usuario);
		return "redirect:listaUsuario";
	}
}
	
