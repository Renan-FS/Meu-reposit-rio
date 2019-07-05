package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import beans.PlanoSaude;
import conexao.Conexao;

public class PlanoSaudeDAO {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	
	
	public PlanoSaudeDAO() throws Exception{
		con = Conexao.conectar();
	}
	
	public String gravar(PlanoSaude plan) throws Exception{
		stmt = con.prepareStatement("INSERT INTO PLANO_SAUDE VALUES(sq_plano_saude.nextval, ?, ?)");
		stmt.setString(1, plan.getNome());
		stmt.setString(2, plan.getModalidade());
		stmt.executeUpdate();
		return "Cadastrado com Sucesso!";
	}

	//metodo que consulta tudo 
	public List<PlanoSaude> ConsultaTudo()throws Exception{
		List<PlanoSaude> lista = new ArrayList<PlanoSaude>();
		stmt = con.prepareStatement("SELECT * FROM PLANO_SAUDE");
		rs = stmt.executeQuery();
		
		while(rs.next()) {
			lista.add(new PlanoSaude(
					rs.getInt("cod_plano"),
					rs.getString("nome_plano"),
					rs.getString("modalidade_plano")
					));
		}
		return lista;
	}
	
	//metodo de consultar por codigo
	public PlanoSaude consultarPorCodigo(int codigo)throws Exception{
			stmt = con.prepareStatement("SELECT * FROM PLANO_SAUDE WHERE cod_plano = ?");
			stmt.setInt(1, codigo);
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				return new PlanoSaude(
						rs.getInt("cod_plano"),
						rs.getString("nome_plano"),
						rs.getString("modalidade_plano")
						);
			}
			else {
				return new PlanoSaude();
			}
		}
		
	
	//metodo que consulta nome
	public List<PlanoSaude> consultarPorNome(String nome) throws Exception{
		List<PlanoSaude> lista = new ArrayList<PlanoSaude>();
		stmt = con.prepareStatement("SELECT * FROM PLANO_SAUDE WHERE nome_plano LIKE ?");
		stmt.setString(1, "%" + nome + "%");
		rs = stmt.executeQuery();
		
		while(rs.next()) {
			lista.add(new PlanoSaude(
					rs.getInt("cod_plano"),
					rs.getString("nome_plano"),
					rs.getString("modalidade_plano")
					));
		}
		return lista;
	}
	
	//metodo que consulta modalidade
	public List<PlanoSaude> ConsultarPorModalidade(String modalidade) throws Exception{
		List<PlanoSaude> lista = new ArrayList<PlanoSaude>();
		stmt = con.prepareStatement("SELECT * FROM PLANO_SAUDE WHERE modalidade_plano LIKE ?");
		stmt.setString(1, "%" + modalidade + "%");
		rs = stmt.executeQuery();
		
		while(rs.next()) {
			lista.add(new PlanoSaude(
					rs.getInt("cod_plano"),
					rs.getString("nome_plano"),
					rs.getString("modalidade_plano")
					));
		}
		return lista;
	}
	
	//metodo que atualiza o PlanoSaude
	public String atualizaPlanoSaude(PlanoSaude plan)throws Exception{
		stmt = con.prepareStatement("UPDATE PLANO_SAUDE SET nome_plano = ?, modalidade_plano = ? WHERE cod_plano = ?");
		stmt.setString(1, plan.getNome());
		stmt.setString(2, plan.getModalidade());
		stmt.setInt(3, plan.getCodigo());
		stmt.executeUpdate();
		return "Plano Saude Atualizado!";
	}
	
	
	//metodo que delete usuario atraves do cod_plano
	public int apagar(int numero) throws Exception{
		stmt = con.prepareStatement("DELETE FROM PLANO_SAUDE WHERE cod_plano = ?");
		stmt.setInt(1, numero);
		return stmt.executeUpdate();
	}
	
	// metodo para fechar conex�o com o banco
		public void fechar() throws Exception{
			con.close();
		}

}
