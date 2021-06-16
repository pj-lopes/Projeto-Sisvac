package br.com.sisvac.models;

import javax.persistence.Column;
import javax.persistence.Entity;

import org.hibernate.validator.constraints.br.CPF;

@Entity
public class Medico extends Model {
	@Column(name="nome_medico")
	private String nomeMedico;
	
	@Column(unique = true, length = 8)
	private Integer crm;
	
	@CPF @Column(length = 11)
	private String cpf;
	
	@Column(length = 10)
	private String senha;
	
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getNomeMedico() {
		return nomeMedico;
	}
	public void setNomeMedico(String nomeMedico) {
		this.nomeMedico = nomeMedico;
	}
	public Integer getCrm() {
		return crm;
	}
	public void setCrm(Integer crm) {
		this.crm = crm;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}


}
