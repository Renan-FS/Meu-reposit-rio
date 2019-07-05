package bo;

import java.util.ArrayList;
import java.util.List;

import beans.Endereco;
import dao.EnderecoDAO;

public class EnderecoBO {
	private Endereco e;
	private EnderecoDAO dao;
	private String resposta;
	private List<Endereco> lista;
	
	public EnderecoBO()throws Exception{
		e = new Endereco();
		dao = new EnderecoDAO();
		lista = new ArrayList<Endereco>();
	}
	
	public String verificaCampos(Endereco end) throws Exception{
		resposta = "OK";
	
		if (end.getLogradouro() == null || end.getLogradouro() == "" || end.getLogradouro().length()> 150)
			return "Logradouro Endereço Inválido!";
		if(end.getNumero() == null || end.getNumero() == "" || end.getNumero().length()>10)
			return "Número Endereço Invalido!";
		if(end.getBairro() == null || end.getBairro() == "" || end.getBairro().length()>40)
			return "Bairro Endereço Invalido!";
		if(end.getCidade() == null || end.getCidade() == "" || end.getCidade().length()>50)
			return "Cidade Endereço Invalido!";
		if(end.getEstado() == null || end.getEstado() == "" || end.getEstado().length() != 2)
			return "Estado Endereço Invalido!";
		if(end.getCep() == null || end.getCep() == "" || end.getCep().length()>10)
			return "Cep Endereço Invalido!";
		
		return resposta;
		
	}
	
	public String cadastrarEndereco(Endereco end)throws Exception{
		
		resposta = verificaCampos(end);
		if (resposta.equals("OK")) {
			resposta = dao.gravar(end);
			dao.fechar();
			return resposta;
		} else {
			return "Erro ao Cadastrar Endereço!";
		}
			
			
	}

	public String atualizarEndereco(Endereco end)throws Exception{
		if (end.getCodigo() > 0) {
			e = dao.consultarPorCodigo(end.getCodigo());
			if (e.getCodigo()>0) {
				resposta = dao.atualizaEndereco(end);
				dao.fechar();
				return resposta;
				
			} else {
				return "Código Endereço Inválido!";
			}
		}else {
			return "Código Endereço Inválido!";
		}
		
	}
	
	public Endereco consultarEnderecoCodigo(int codigo)throws Exception{
		if (codigo > 0) {
			e = dao.consultarPorCodigo(codigo);
			dao.fechar();
			return e;
		}
			
		return e;
	}

	public List<Endereco> consultarEnderecoLogradouro(String log)throws Exception{
		if (log == null || log == "" || log.length()>150)
			return lista;
		
		lista = dao.consultarPorLogradouro(log);
		dao.fechar();			
		return lista;
	}
	
	public List<Endereco> consultarEnderecoBairro(String bairro)throws Exception{
		
		if (bairro == null || bairro == "" || bairro.length()>40)
			return lista;
		
		lista = dao.consultarPorBairro(bairro);
		dao.fechar();
		return lista;
	}
	
	public List<Endereco> consultarEnderecoCep(String cep)throws Exception{
		
		if (cep == null || cep == "" || cep.length()>10) 
			return lista;
		
		lista = dao.consultarPorCep(cep);
		dao.fechar();
		return lista;
	}

	public List<Endereco> consultarEnderecoEstado(String estado)throws Exception{
		
		if (estado == null || estado == "" || estado.length() != 2)
			return lista;
		
		lista = dao.consultarPorEstado(estado);
		dao.fechar();
		return lista;
	}

	public List<Endereco> consultarEnderecoCidade(String cidade)throws Exception{
		
		if (cidade == null || cidade == "" || cidade.length()>50)
			return lista;
		
		lista = dao.consultarPorCidade(cidade);
		dao.fechar();
		return lista;
	}
}
