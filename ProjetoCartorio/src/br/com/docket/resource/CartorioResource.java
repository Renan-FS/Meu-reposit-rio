package br.com.docket.resource;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriBuilder;
import javax.ws.rs.core.UriInfo;

import br.com.docket.dao.CartorioDAO;
import br.com.docket.dao.impl.CartorioDAOImpl;
import br.com.docket.exception.CommitException;
import br.com.docket.model.Cartorio;
import br.com.docket.singleton.EntityManagerFactorySingleton;

public class CartorioResource {

	private CartorioDAO dao;
	
	public CartorioResource() {
		dao = new CartorioDAOImpl(EntityManagerFactorySingleton
				.getInstance().createEntityManager());
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	public Response cadastrar(Cartorio cartorio, @Context UriInfo uri) {
		try {
			dao.cadastrar(cartorio);
			dao.commit();
			UriBuilder url = uri.getAbsolutePathBuilder();
			url.path(String.valueOf(cartorio.getId()));
			return Response.created(url.build()).build();
		} catch (CommitException e) {
			e.printStackTrace();
			return Response.serverError().build();
		}
	}
	
	@PUT
	@Path("{id}")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response atualizar(Cartorio cartorio, @PathParam("id") int codigo) {
		try {
			dao.atualizar(cartorio);
			dao.commit();
			return Response.ok().build();
		} catch (CommitException e) {
			e.printStackTrace();
			return Response.serverError().build();
		}
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<Cartorio> listar(){
		return dao.listar();
	}
	
}
