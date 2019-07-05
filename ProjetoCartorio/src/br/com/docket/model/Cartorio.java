package br.com.docket.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "T_CARTORIO")
@SequenceGenerator(allocationSize = 1, sequenceName = "SQ_T_CARTORIO", name = "cartorio")
public class Cartorio {
	
	
	@Id
	@Column(name = "ID_CARTORIO")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "cartorio")
	private int id;
	
	
	@Column(name = "NM_CARTORIO", nullable = false, length = 50)
	private String nome;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public Cartorio(String nome) {
		super();
		this.nome = nome;
	}
	public Cartorio() {
		super();
	}
	
	
	
	
}
