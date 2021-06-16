package br.com.sisvac.controller;


import java.text.ParseException;

import javax.inject.Inject;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Severity;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.sisvac.dao.PacienteDAO;
import br.com.sisvac.models.Paciente;

@Path("register")
@Controller
public class RegisterController {
	
	@Inject Result result;
	@Inject Validator validador;
	
	@Get("")
	public void register() {
		
	}
	
	@Post("salvapaciente")
	public void salvarPaciente(@Valid Paciente paciente) throws ParseException {
		validador.onErrorRedirectTo(this).register();
		paciente.calculaIdade();
		verificaPrioridade(paciente);
		verificaCategoria(paciente);
		paciente.gerarToken();
		PacienteDAO.salvarPaciente(paciente);
		validador.add(new SimpleMessage("paciente.token", "O token do paciente é: "+paciente.getToken(), Severity.SUCCESS));
		result.redirectTo(RegisterController.class).register();
	}
	
	public String verificaPrioridade(Paciente paciente) {
		if((paciente.getIdade() >= 65) | (paciente.getTipoDeficiencia() != null)) {
			paciente.setNivelPrioridade("Com Prioridade");
		}else {paciente.setNivelPrioridade("Sem Prioridade");}
		return null;
	}
	
	public String verificaCategoria(Paciente paciente) {
		if (paciente.getTipoDeficiencia() != null) {
			paciente.setCategoria("Deficiente");
		}else {
			if ((paciente.getIdade() >= 65) & (paciente.getTipoDeficiencia() == null)) {
				paciente.setCategoria("Idoso");
			}else {paciente.setCategoria("Adulto/Criança");}
		}
		return null;
	}

}
