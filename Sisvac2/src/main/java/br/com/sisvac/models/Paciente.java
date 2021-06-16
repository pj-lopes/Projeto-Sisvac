package br.com.sisvac.models;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;

import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;




@SuppressWarnings("deprecation")
@Entity
public class Paciente extends Model {
	@NotEmpty(message = "{paciente.nome.embraco}")
	@Column(name="nome_paciente") @Size(min = 2, max = 30, message = "{paciente.nome.size}")
	private String nome;
	
	@NotEmpty(message = "{paciente.email.embraco}")
	@Column(unique = true)
	private String email;
	
	@NotNull(message = "{paciente.dataNascimento.nula}")
	private String dataNascimento;
	
	@NotEmpty
	private String deficiencia;
	private String tipoDeficiencia;
	private String nivelPrioridade;
	private String categoria;
	private Integer token;
	private Integer idade;


	public String gerarToken() {
		Random tk = new Random();
		token = tk.nextInt(999999999)+1;
		return null;
	}
	
	public Integer calculaIdade() throws ParseException {
		DateTimeFormatter sdf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate dataNacimentoInput = LocalDate.parse(dataNascimento, sdf);
		LocalDate hoje = LocalDate.now();
		Period periodo = Period.between(dataNacimentoInput, hoje);
		setIdade(periodo.getYears());
		return idade;
	}
	
	public int getIdade() {
		return idade;
	}

	public void setIdade(int idade) {
		this.idade = idade;
	}

	public Integer getToken() {
		return token;
	}
	public void setToken(Integer token) {
		this.token = token;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDataNascimento() {
		return dataNascimento;
	}
	public void setDataNascimento(String dataNacimento) {
		this.dataNascimento = dataNacimento;
	}
	
	public String getDataNascimentoFormatada() {
		return new SimpleDateFormat("dd-MM-yyyy").format(getDataNascimento());
	}
	
	public String getDeficiencia() {
		return deficiencia;
	}
	public void setDeficiencia(String deficiencia) {
		this.deficiencia = deficiencia;
	}
	public String getTipoDeficiencia() {
		return tipoDeficiencia;
	}
	public void setTipoDeficiencia(String tipoDeficiencia) {
		this.tipoDeficiencia = tipoDeficiencia;
	}
	public String getNivelPrioridade() {
		return nivelPrioridade;
	}
	public void setNivelPrioridade(String nivelPrioridade) {
		this.nivelPrioridade = nivelPrioridade;
	}
	
	public void setSobrenome(String sobrenome) {
		this.nome += " "+sobrenome;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
}
