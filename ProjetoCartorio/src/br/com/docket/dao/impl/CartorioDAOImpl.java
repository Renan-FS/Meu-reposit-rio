package br.com.docket.dao.impl;

import javax.persistence.EntityManager;

import br.com.docket.dao.CartorioDAO;
import br.com.docket.model.Cartorio;

public class CartorioDAOImpl extends GenericDAOImpl<Cartorio, Integer> implements CartorioDAO{

	public CartorioDAOImpl(EntityManager em) {
		super(em);
	}
	
}
