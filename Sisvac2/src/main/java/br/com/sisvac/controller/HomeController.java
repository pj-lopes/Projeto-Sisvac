package br.com.sisvac.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.sisvac.dao.PacienteDAO;

import br.com.sisvac.models.Paciente;


@Path("home")
@Controller
public class HomeController {
	@Inject Result result;
	
	public HomeController() {	
	}
	
	@Get("")
	public void home() {
		
	}
	
	@Path("listar")
	public List<Paciente> listagem() {
		return PacienteDAO.listar();
	}
	
	@Delete
	public void vacinar(Paciente paciente) {
		PacienteDAO.remover(paciente);
		result.include("mensagem", "Paciente foi vacinado!");
		result.redirectTo(this).listagem();
	}
	
	@Path("sair")
	public void sair(HttpSession session) {
		session.invalidate();
		result.redirectTo(IndexController.class).index();
	}
	
}
