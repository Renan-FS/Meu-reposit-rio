package excecao;

public class Excecao extends Exception {
	
	// ADICIONAR MAIS M�TODOS  DE ERROS COM BASE NAS EXCEPTION DOS TESTES
	public static String tratarExcecao(Exception ex) {
		if(ex.getClass().getName().equals("java.lang.NumberFormatException")) {
			return("Numero Inv�lido!");
		}else if(ex.getClass().getName().equals("java.sql.Exception")) {
			return("Falha ao conectar no Banco!");
		}
		else {
			return("DEU RUIM!!");
		}	
	}
}
