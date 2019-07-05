package teste;

import java.util.List;

import beans.Clinica;
import beans.Usuario;
import bo.UsuarioBO;

public class Teste {

	public static void main(String[] args){
		try {
		UsuarioBO bo = new UsuarioBO();
		Usuario u = new Usuario();
		u.setCodigo(2);
		u = bo.detalhesUsuario(u);
		System.out.println(u.getAll());
		List<Clinica> lista = u.getLista();
		
		System.out.println(u.getAll());
		lista = u.getLista();
		
		for(Clinica c: lista) {
			System.out.println(c.getNome());
		}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
		// TODO Auto-generated method stub

}
