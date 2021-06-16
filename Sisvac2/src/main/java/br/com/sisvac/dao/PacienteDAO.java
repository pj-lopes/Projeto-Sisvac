package br.com.sisvac.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.sisvac.models.Paciente;
import br.com.sisvac.util.JPAUtil;



public class PacienteDAO {
	
	public static void salvarPaciente(Paciente paciente) {
		EntityManager em = JPAUtil.criarEntityManager();
		em.getTransaction().begin();
		em.persist(paciente);
		em.getTransaction().commit();
		em.close();
	}
	
	public static void editarPaciente(Paciente paciente) {
		EntityManager em = JPAUtil.criarEntityManager();
		em.getTransaction().begin();
		em.merge(paciente);
		em.getTransaction().commit();
		em.close();
	}
	
	public static Paciente acharToken(Integer token) {
		EntityManager em = JPAUtil.criarEntityManager();
		em.getTransaction().begin();
		Paciente p = em.find(Paciente.class, token);
		em.getTransaction().commit();
		em.close();
		return p;
	}
	
	public static void remover(Paciente paciente) {
		EntityManager em = JPAUtil.criarEntityManager();
		em.getTransaction().begin();
		paciente = em.find(Paciente.class, paciente.getId());
		em.remove(paciente);
		em.getTransaction().commit();
		em.close();
	}
	
	@SuppressWarnings("unchecked")
	public static List<Paciente> listar(){
		EntityManager em = JPAUtil.criarEntityManager();
		Query query = em.createQuery("select p from Paciente p");
		List<Paciente> pacientes = query.getResultList();
		return pacientes;
	}

}
