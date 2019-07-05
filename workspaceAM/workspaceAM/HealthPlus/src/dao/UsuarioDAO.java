package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import beans.Clinica;
import beans.Endereco;
import beans.Usuario;
import conexao.Conexao;

public class UsuarioDAO {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	
	public UsuarioDAO() throws Exception{
		con = Conexao.conectar();
	}
	
	//gravação de novo usuario
	public String  gravar(Usuario us) throws Exception{
		stmt = con.prepareStatement("INSERT INTO USUARIO VALUES(sq_usuario.nextval, ?, 'cliente', 'N', ?, ?, ?)");
		stmt.setString(1, us.getNome());
		stmt.setString(2, us.getCrm());
		stmt.setString(3, us.getEmail());
		stmt.setString(4, us.getSenha());
		stmt.executeUpdate();
		return "Cadastrado com Sucesso!";
		
	}
	
	//metodo que consulta tudo em nossa base
	public List<Usuario> listarUsuarios() throws Exception{
		List<Usuario> lista = new ArrayList<Usuario>();
		stmt = con.prepareStatement("SELECT * FROM USUARIO");
		rs = stmt.executeQuery();
		
		while(rs.next()) {
			lista.add(new  Usuario(
						rs.getInt("cod_usuario"),
						rs.getString("nome_usuario"),
						rs.getString("crm_usuario"),
						rs.getString("email_usuario"),
						rs.getString("delete_usuario")
					));
		}
			return lista;
	}
	
	//metodo de consultar por codigo
	public Usuario consultarPorCodigo(int codigo)throws Exception{
			stmt = con.prepareStatement("SELECT * FROM USUARIO WHERE cod_usuario = ?");
			stmt.setInt(1, codigo);
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				return new Usuario(
						rs.getInt("cod_usuario"),
						rs.getString("nome_usuario"),
						rs.getString("crm_usuario"),
						rs.getString("email_usuario"));
			}
			else {
				return new Usuario();
			}
		}
	
	//metodo que consulta por nome
	public List<Usuario> ConsultarPorNome(String nome) throws Exception{
		List<Usuario> lista =  new ArrayList<Usuario>();
		stmt = con.prepareStatement("SELECT * FROM USUARIO WHERE nome_usuario LIKE ?");
		stmt.setString(1, "%" + nome + "%");
		rs = stmt.executeQuery();
		
		while(rs.next()) {
			lista.add(new  Usuario(
					rs.getInt("cod_usuario"),
					rs.getString("nome_usuario"),
					rs.getString("crm_usuario"),
					rs.getString("email_usuario")
					));
		}
			return lista;
	}
	
	//metodo que consulta por crm
	public Usuario ConsultarPorCrm(String crm) throws Exception{
		stmt = con.prepareStatement("SELECT * FROM USUARIO WHERE crm_usuario = ?");
		stmt.setString(1, crm);
		rs = stmt.executeQuery();
		
		if(rs.next()) {
			return new  Usuario(
					rs.getInt("cod_usuario"),
					rs.getString("nome_usuario"),
					rs.getString("crm_usuario"),
					rs.getString("email_usuario")
					);
		}else {
			return new Usuario();
		}
	}
	
	// metodo para listar as clinicas do usuario
	public Usuario listarClinicaUsuario(Usuario user)throws Exception{
		List<Clinica> lista = new ArrayList<Clinica>();
		Clinica cli = new Clinica();
		Usuario u = new Usuario();
		stmt = con.prepareStatement("select * from usuario join clinica on(usuario.cod_usuario = clinica.cod_usuario) where clinica.cod_usuario = ?");
		stmt.setInt(1, user.getCodigo());
		rs = stmt.executeQuery();
		if (rs.next()) {
			
			u.setNome(rs.getString("nome_usuario"));
			u.setCrm(rs.getString("crm_usuario"));
			u.setEmail(rs.getString("email_usuario"));
			if (rs.getInt("cod_clinica")>0) {
				cli.setNome(rs.getString("nome_clinica"));
				cli.setEmail(rs.getString("email_clinica"));
				cli.setCnpj(rs.getString("cnpj_clinica"));
				cli.setTelefone(rs.getString("telefone_clinica"));
				cli.setEndereco(new Endereco(rs.getInt("cod_endereco")));
			}
			lista.add(cli);
			
		}
		
		while(rs.next()) {
			cli.setNome(rs.getString("nome_clinica"));
			cli.setEmail(rs.getString("email_clinica"));
			cli.setCnpj(rs.getString("cnpj_clinica"));
			cli.setTelefone(rs.getString("telefone_clinica"));
			cli.setEndereco(new Endereco(
					rs.getInt("cod_endereco"),
					rs.getString("logradouro_endereco"),
					rs.getString("numero_endereco"),
					rs.getString("bairro_endereco"),
					rs.getString("cidade_endereco"),
					rs.getString("estado_endereco"),
					rs.getString("cep_endereco")));
			lista.add(cli);
		}
		u.setLista(lista);
		return u;
	}

	public Usuario dadosUser(Usuario user)throws Exception{
		
		stmt = con.prepareStatement("SELECT * FROM USUARIO WHERE cod_usuario = ?");
		stmt.setInt(1, user.getCodigo());
		rs = stmt.executeQuery();
		if (rs.next())
			return new Usuario(rs.getInt("cod_usuario"), rs.getString("nome_usuario"), rs.getString("crm_usuario"), rs.getString("email_usuario"));
		
		return new Usuario();
		
	}
	
	
	//metodo que  consulta por email
	public Usuario ConsultarPorEmail(String email) throws Exception{
		stmt = con.prepareStatement("SELECT * FROM USUARIO WHERE email_usuario LIKE ?");
		stmt.setString(1, "%" + email + "%");
		rs = stmt.executeQuery();
		
		if(rs.next()) {
			return new  Usuario(
					rs.getInt("cod_usuario"),
					rs.getString("nome_usuario"),
					rs.getString("crm_usuario"),
					rs.getString("email_usuario")	
					);
		}
			return new Usuario();
	}
	
	//metodo que atualiza o Usuario
	public String atualizaUsuario(Usuario us)throws Exception{
		stmt = con.prepareStatement("UPDATE USUARIO SET nome_usuario = ?, senha_usuario = ? WHERE cod_usuario = ?");
		stmt.setString(1, us.getNome());
		stmt.setString(2, us.getSenha());
		stmt.setInt(3, us.getCodigo());
		stmt.executeUpdate();
		return "Usuario Atualizado!";
	}
	
	//metodo que deleta usuario dando update
	public String deletar(Usuario user)throws Exception{
		stmt = con.prepareStatement("UPDATE USUARIO SET delete_usuario = 'Y' WHERE cod_usuario= ?");
		stmt.setInt(1, user.getCodigo());
		stmt.executeUpdate();
		return "Atualizado com Sucesso!";
	}

	//metodo que ativa usuario dando update
	public String ativar(Usuario user)throws Exception{
		stmt = con.prepareStatement("UPDATE USUARIO SET delete_usuario = 'N' WHERE cod_usuario= ?");
		stmt.setInt(1, user.getCodigo());
		stmt.executeUpdate();
		return "Atualizado com Sucesso!";
	}
	
	//metodo que delete usuario atraves do cod_usuario
	public int apagar(int numero) throws Exception{
		stmt = con.prepareStatement("DELETE FROM USUARIO WHERE cod_usuario = ?");
		stmt.setInt(1, numero);
		return stmt.executeUpdate();
	}
	
	// metodo para fechar conexão com o banco
	public void fechar() throws Exception{
		con.close();
	}
}
