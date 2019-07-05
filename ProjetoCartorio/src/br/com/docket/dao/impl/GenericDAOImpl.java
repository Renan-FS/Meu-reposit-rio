package br.com.docket.dao.impl;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.persistence.EntityManager;

import br.com.docket.dao.GenericDAO;
import br.com.docket.exception.CommitException;
import br.com.docket.exception.IdNotFoundException;

public abstract class GenericDAOImpl<T, K> implements GenericDAO<T, K>{

	private EntityManager em;
	
	private Class<T> clazz;
	
	@SuppressWarnings("unchecked")
	public GenericDAOImpl(EntityManager em) {
		this.em = em;
		clazz = (Class<T>)((ParameterizedType)getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	}
	
	public void cadastrar(T entidade) {
		em.persist(entidade);
	}
	
	public void atualizar(T entidade) {
		em.merge(entidade);
	}
	
	public void remover(K chave) throws IdNotFoundException {
		T entidade = buscar(chave);
		if (entidade == null){
			throw new IdNotFoundException("Cartório não encontrado");
		}
		em.remove(entidade);
	}
	
	public T buscar(K chave) {
		return em.find(clazz, chave);
	}
	
	public void commit() throws CommitException{
		try {
			em.getTransaction().begin();
			em.getTransaction().commit();
		}catch (Exception e) {
			if(em.getTransaction().isActive()) {
				em.getTransaction().rollback();
			}
			e.printStackTrace();
			throw new CommitException("Erro ao gravar");
		}
	}
	
	public List<T> listar(){
		return em.createQuery("from " +	clazz.getName(),clazz).getResultList();
	}
	
	
	
}
