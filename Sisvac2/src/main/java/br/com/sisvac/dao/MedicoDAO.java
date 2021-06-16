package br.com.sisvac.dao;


import javax.faces.bean.SessionScoped;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.sisvac.models.Medico;


@SessionScoped
public interface MedicoDAO extends JpaRepository<Medico, Integer> {
	
	public Medico findByCrmAndSenha(Integer crm, String senha);
	
}
