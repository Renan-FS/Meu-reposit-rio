package beans;

import java.util.List;

public class Usuario {
	private int codigo;
	private String nome;
	private String crm;
	private String email;
	private String senha;
	private String delete;
	private List<Clinica> lista;
	
	
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getCrm() {
		return crm;
	}
	
	public void setCrm(String crm) {
		this.crm = crm;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getDelete() {
		return delete;
	}
	public void setDelete(String delete) {
		this.delete = delete;
	}
	
	public Usuario(int codigo, String nome, String crm, String email, List<Clinica> lista) {
		super();
		this.codigo = codigo;
		this.nome = nome;
		this.crm = crm;
		this.email = email;
		this.lista = lista;
	}
	
	public List<Clinica> getLista() {
		return lista;
	}
	public void setLista(List<Clinica> lista) {
		this.lista = lista;
	}
	public Usuario(int codigo, String nome, String crm, String email, String delete) {
		this.codigo = codigo;
		this.nome = nome;
		this.crm = crm;
		this.email = email;
		this.delete = delete;
	}
	
	public Usuario(int codigo, String nome, String crm, String email) {
		this.codigo = codigo;
		this.nome = nome;
		this.crm = crm;
		this.email = email;
	}
	
	public Usuario() {
		super();
	}
	
	
	public void setAll(int codigo, String nome, String crm, String email) {
		setCodigo(codigo);
		setNome(nome);
		setCrm(crm);
		setEmail(email);
	} 
	
	public String getAll() {
		return "Código: " + codigo + "\n"  +
				"Nome: " + nome + "\n" + 
				"CRM: " + crm + "\n" +
				"Email: " + email ;	
	}
	
	
}
