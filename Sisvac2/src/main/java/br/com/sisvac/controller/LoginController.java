package br.com.sisvac.controller;



import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.annotation.SessionScope;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.sisvac.dao.MedicoDAO;
import br.com.sisvac.models.Medico;

@Path("login")
@Controller
public class LoginController {
	
	@Inject MedicoDAO medicoDAO;
	@Inject Result result;
	
	@Get("")
	public void login() {
		
	}
	
	@Post("autenticalogin") @SessionScope
	public void efetuaLogin(Integer crm, String senha, HttpSession session) {
		Medico medicoLogado = this.medicoDAO.findByCrmAndSenha(crm, senha);
		if (medicoLogado == null) {
			result.redirectTo(LoginController.class).login();
		}else {
			session.setAttribute("medicoLogado", medicoLogado);
			result.include("medicoLogado", medicoLogado);
			result.redirectTo(HomeController.class).home();
		}
	}
	
	@Path("sair")
	public void sair(HttpSession session) {
		session.invalidate();
		result.redirectTo(IndexController.class).index();
	}
	
	@Get("/acessoNegado")
	public String acessoNegado() {
		return "acesso_negado";
	}
}
