package br.com.doisUnidos.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.doisUnidos.modelo.Usuario;
import br.com.doisUnidos.modelo.dao.UsuarioDAO;

@Controller
public class LoginController {

	@RequestMapping("loginForm")
	public String login(){
		return "login/login";
	}
	
	@RequestMapping("logar")
	public String efetuaLogin(Usuario usuario, HttpSession session){
		if(new UsuarioDAO().existeUsuario(usuario)){
			session.setAttribute("usuarioLogado", usuario);
			return "redirect:listaProduto";
		}
		return "redirect:loginForm";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:loginForm";
	}
	
}
