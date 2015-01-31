package br.com.doisUnidos.modelo;

import org.hibernate.validator.constraints.NotEmpty;


public class Fornecedor{

	private long idFornecedor;
	@NotEmpty
	private String nome;
	@NotEmpty
	private String contato;
	@NotEmpty
	private String telefone;
	private String cnpj;
	private String iEstadual;
	private String iMunicipal;
	private String rua;
	private String numero;
	private String complemento;
	private String bairro;
	private String cidade;
	private String uf;
	private String cep;
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getContato() {
		return contato;
	}
	public void setContato(String contato) {
		this.contato = contato;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getCnpj(){
		return cnpj;
	}
	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}
	
	public String getiEstadual() {
		return iEstadual;
	}
	public void setiEstadual(String iEstadual) {
		this.iEstadual = iEstadual;
	}
	public String getiMunicipal() {
		return iMunicipal;
	}
	public void setiMunicipal(String iMunicipal) {
		this.iMunicipal = iMunicipal;
	}
	public String getRua() {
		return rua;
	}
	public void setRua(String rua) {
		this.rua = rua;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getComplemento() {
		return complemento;
	}
	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getUf() {
		return uf;
	}
	public void setUf(String uf) {
		this.uf = uf;
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public long getIdFornecedor() {
		return idFornecedor;
	}
	public void setIdFornecedor(long idFornecedor) {
		this.idFornecedor = idFornecedor;
	}

	
}
