package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.FormularioContato;
import beans.Usuario;
import bo.FormularioContatoBO;
import bo.UsuarioBO;
import excecao.Excecao;

@WebServlet("/HealthServlet")
public class HealthServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String acao = request.getParameter("acao");
		String retorno = "";
		
		switch (acao){
		case "cadastrarFormularioContato":
			cadastrarFormularioContato(request);
			retorno = "contato.jsp";							
			break;
		case "cadastrarUsuario":
			cadastrarUsuario(request);
			retorno = "index.jsp";							
			break;
		case "loginUsuario":
			loginUsuario(request);
			retorno = "homecliente.jsp";							
			break;
		/*case "cadastrarClinica":
			cadastrarClinica(request);
			retorno = "cadastroclinica.jsp";							
			break;*/
		case "carregarUsuarios":
			listarUsuarios(request);
			retorno = "dashadmin.jsp";
			break;
		case "carregarUsuario":
			listarUsuario(request);
			retorno = "dashcliente.jsp";
			break;
		/*case "carregarClinica":
			listarClinica(request);
			retorno = "homecliente.jsp";
			break;
		case "carregarClinicaTop":
			listarClinica(request);
			retorno = "index.jsp";
			break;
		*/	
			
	}	
		request.getRequestDispatcher(retorno).forward(request, response);
}
	
	//cadastrar formulário de contato (FUNCIONANDO)
	private void cadastrarFormularioContato(HttpServletRequest request){
		try {
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String tipo_msg = request.getParameter("tipo_msg");
		String msgem = request.getParameter("msgem");
		
		FormularioContatoBO bo = new FormularioContatoBO();
		FormularioContato f = new FormularioContato(nome,email, msgem, tipo_msg);
		bo.cadastroFormularioContato(f);
		request.setAttribute("msg", "Formulário Enviado com Sucesso!");	
	} catch (Exception e){
		e.printStackTrace();
	}
}
	//cadastrar Usuario
		private void cadastrarUsuario(HttpServletRequest request){
			try {
			int codigo = Integer.parseInt(request.getParameter("codigo"));
			String nome = request.getParameter("nome");
			String crm = request.getParameter("crm");
			String email = request.getParameter("email");
			String senha = request.getParameter("senha");
			
			UsuarioBO bo = new UsuarioBO();
			Usuario user = new Usuario(codigo, nome, crm, email, senha);
			bo.cadastrarUsuario(user);
			request.setAttribute("msg", "Usuário Cadastrado com Sucesso!");	
		} catch (Exception e){
			e.printStackTrace();
		}
	}
		
		//Login Usuario (FUNCIONANDO)
		private void loginUsuario(HttpServletRequest request){
			try {
				String crm = "123";
				String senha = "456";
				String crmAdmin = "admin";
				String senhaAdmin = "admin";
				crm = request.getParameter("crm");
				senha = request.getParameter("senha");
				crmAdmin = request.getParameter("crmAdmin");
				senhaAdmin = request.getParameter("senhaAdmin");
				
				if(crm.equals(crm) && senha.equals(senha)) {						
					request.setAttribute("<script>document.location.href='homecliente.jsp';</script>", null);
				} 
				else if(crmAdmin.equals(crmAdmin) && senhaAdmin.equals(senhaAdmin)) {						
					request.setAttribute("<script>document.location.href='dashboard.jsp';</script>", null);
				} else { 
					request.setAttribute("<script>document.location.href='index.jsp';</script>", null);
				}
			} catch (Exception e){
				e.printStackTrace();
			}
		}
	/*
	//cadastrar Clínica
		private void cadastrarClinica(HttpServletRequest request){
			try {
			String nome = request.getParameter("nome");
			String email = request.getParameter("email");
			String cnpj = request.getParameter("cnpj");
			String site = request.getParameter("site");
			String horario = request.getParameter("horario");
			String delete = request.getParameter("status");
			int busca = Integer.parseInt(request.getParameter("buscas"));
			String telefone = request.getParameter("telefone");
			String usuario = request.getParameter("usuario");
			String endereco  = request.getParameter("endereco");

			ClinicaBO bo = new ClinicaBO();
			Clinica clinica = new Clinica(nome,email,cnpj,site,horario,delete,busca,telefone,usuario,endereco);
			bo.cadastrarClinica(clinica);
			request.setAttribute("msg", "Clínica Cadastrada com Sucesso!");	
		} catch (Exception e){
			System.out.println(Excecao.tratarExcecao(e));
		}
	}
	*/
	//carregar usuários (FUNCIONANDO)
	private void listarUsuarios(HttpServletRequest request){
		try {
			UsuarioBO usuarioBO = new UsuarioBO();
			List<Usuario> lista = usuarioBO.listarUsuarios();
			request.setAttribute("lista", lista);
		}catch(Exception e) {
			System.out.println(Excecao.tratarExcecao(e));
		}
	}
	
	//carregar usuário (FUNCIONANDO)
	private void listarUsuario(HttpServletRequest request){
		try {
			int codigo = Integer.parseInt(request.getParameter("codigo"));
			UsuarioBO usuarioBO = new UsuarioBO();
			request.setAttribute("usuario", usuarioBO.consultarUsuarioCodigo(codigo));
		}catch(Exception e) {
			System.out.println(Excecao.tratarExcecao(e));
		}
	}
	/*
	//carregar Clínica
	private void listarClinica(HttpServletRequest request){
		
		try{
		ClinicaBO clinicaBO = new ClinicaBO();
		List<Clinica> lista = clinicaBO.listarClinica();
		request.setAttribute("lista", lista);
		} catch (Exception e){
			System.out.println(Excecao.tratarExcecao(e));
		}
	}
	
	//carregar Clínica Mais Procurada
		private void listarClinicaTop(HttpServletRequest request){
			
			try{
			ClinicaBO clinicaBO = new ClinicaBO();
			List<Clinica> lista = clinicaBO.listarClinicaTop();
			request.setAttribute("lista", lista);
			} catch (Exception e){
				System.out.println(Excecao.tratarExcecao(e));
		}
	}
*/	
	
	
	
/*
	
	private void editar(HttpServletRequest request){
		ServicoBO servicoBO = new ServicoBO();
		if(request.getParameter("codigo") !=null){
			int codigo = Integer.parseInt(request.getParameter("codigo"));
			ClienteBO bo = new ClienteBO();
			
			Cliente cliente = bo.buscarPorCodigo(codigo);
			request.setAttribute("cliente", cliente);
		}
		List<Servico> servicos = servicoBO.buscaTodos();
		request.setAttribute("servicos", servicos);
	}
	
	private void buscar(HttpServletRequest request){
		int codigo = Integer.parseInt(request.getParameter("servico"));
		 ClienteBO bo = new ClienteBO();
		 ArrayList<Cliente> lista = bo.buscarPorServico(codigo);
		 request.setAttribute("lista", lista);
		 ServicoBO servicoBO = new ServicoBO();
		 List<Servico> servicos = servicoBO.buscaTodos();
		 request.setAttribute("servicos", servicos);
		 request.setAttribute("lista", lista);
	}

	private void remover(HttpServletRequest request){
		int codigo = Integer.parseInt(request.getParameter("codigo"));
		ClienteBO bo = new ClienteBO();
		try {
			bo.remover(codigo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("msg", "Cliente Removido com Sucesso!");
	}
	
	private void listar(HttpServletRequest request){
		ClienteBO bo = new ClienteBO();
		ServicoBO servicoBO = new ServicoBO();
		List<Servico> servicos = servicoBO.buscaTodos();
		request.setAttribute("servicos", servicos);
		request.setAttribute("lista", bo.buscarTodos());
	}*/
	
	
}
