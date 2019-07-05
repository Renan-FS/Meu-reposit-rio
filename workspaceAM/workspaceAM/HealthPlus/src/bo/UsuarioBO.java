package bo;

import java.util.ArrayList;
import java.util.List;

import beans.Clinica;
import beans.Usuario;
import dao.UsuarioDAO;

public class UsuarioBO {
	
	private Usuario u;
	private UsuarioDAO dao;
	private String resposta;
	private List<Usuario> lista;
	
	public UsuarioBO()throws Exception{
		u = new Usuario();
		dao = new UsuarioDAO();
		lista = new ArrayList<Usuario>();
	}

	public String verificaCampos(Usuario user) throws Exception{
		resposta = "OK";
	
		if (user.getNome() != null){
			if (user.getNome().length() > 60) {
				return "Nome Us�ario Invalido!";
			}
			
			user.setNome(user.getNome().toUpperCase());
		}
		
		if (user.getEmail() == null || user.getEmail() == "" || user.getEmail().length()>60) {
			return "Email Us�ario Inv�lido!";
		}
		
		if (user.getCrm() == null || user.getCrm() == "" || user.getCrm().length()>60) {
			return "CRM Us�ario Inv�lido!";
		}
		
		if (user.getSenha() ==  null || user.getSenha() == "" || user.getSenha().length() > 60) {
			return "Senha Us�ario Inv�lida!";
		}
		
		
		return resposta;
		
	}
	
	public String verificaExiste(Usuario user) throws Exception {
		resposta = "VERIFICADO";
		
		
		u = dao.consultarPorCodigo(user.getCodigo());
		if (u.getCodigo() > 0) {
			dao.fechar();
			return "Us�ario J� Existe!";
		}
		u = dao.ConsultarPorEmail(user.getEmail());
		
		if ( u.getEmail() != null) {
			dao.fechar();
			return "Email Us�ario J� Existe!";
		}
		
		u = dao.ConsultarPorCrm(user.getCrm());
		if (u.getCrm() != null) {
			dao.fechar();
			return "CRM Us�ario J� Existe!";
		}
		dao.fechar();		
		return resposta;
	}
	
	public String cadastrarUsuario(Usuario user)throws Exception{
		
		resposta = verificaCampos(user);
		
		if (resposta.equals("OK")) {
			resposta = verificaExiste(user);
		}		
		if (resposta.equals("VERIFICADO")) {
			resposta = dao.gravar(user);
			dao.fechar();
		}		
		return resposta;
	}

	public String atualizarUsuario(Usuario user) throws Exception{
		resposta = verificaCampos(user);
		
		u = dao.consultarPorCodigo(user.getCodigo());
		
		if (u.getCodigo() > 0) {
			if (u.getEmail().equals(user.getEmail()) && u.getCrm().equals(user.getCrm())) {
				resposta = dao.atualizaUsuario(user);
				dao.fechar();
			} else {
				dao.fechar();
				return "Email/CRM Us�ario Inv�lido!";
			}
		} else {
			dao.fechar();
			return "C�digo Us�ario Inv�lido!";
		}
		dao.fechar();
		return resposta;
	}

	public String desativarUsuario(Usuario user)throws Exception{
		
		u = dao.consultarPorCodigo(user.getCodigo());
		
		if (u.getCodigo() > 0 && u.getDelete().equals("N")) {
			resposta = dao.deletar(user);
		} else {
			resposta = "Erro ao Desativar Usu�rio!";
		}
		
		dao.fechar();
		return resposta;
	}
	
	public String ativarUsuario(Usuario user)throws Exception{
		u = dao.consultarPorCodigo(user.getCodigo());
		
		if (u.getCodigo() > 0 && u.getDelete().equals("Y")) {
			resposta = dao.ativar(user);
		} else {
			resposta = "Erro ao Ativar Usu�rio!";
		}
		
		dao.fechar();
		return resposta;
	}
	
	public List<Usuario> listarUsuarios() throws Exception{
		lista  = dao.listarUsuarios();
		return lista;
	}
	
	public Usuario detalhesUsuario(Usuario user)throws Exception{
		
		u = dao.listarClinicaUsuario(user);
		dao.fechar();
		return u;
	}
	
	public Usuario consultarUsuarioCodigo(int codigo)throws Exception{

		if (codigo > 0) {
			u = dao.consultarPorCodigo(codigo);
			dao.fechar();
			return u;
		}
		
		return u;
	}

	public Usuario consultarUsuarioCrm(String crm)throws Exception{
		if (crm == null || crm == "" || crm.length()>60)
			return u;
		
		u = dao.ConsultarPorCrm(crm);
		dao.fechar();
		return u;
	}
	
	public List<Usuario> consultarUsuarioNome(String nome)throws Exception{
		if (nome == null || nome == "" || nome.length() > 60)
			return lista;
		else 
			lista = dao.ConsultarPorNome(nome);
			dao.fechar();
			return lista;
	}
	
	public Usuario consultarUsuarioEmail(String email)throws Exception{
		if (email == null || email == "" || email.length()>60)
			return u;
		else
			u = dao.ConsultarPorEmail(email);
			return u;
	}
		
}
