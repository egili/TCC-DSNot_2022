public without sharing class Utils {

    public static String formataNumeroDocumentos(String docNumber){
        return formataNumeroDocumentos(docNumber, true);
    }

    public static String formataNumeroDocumentos(String docNumber, Boolean completaCasas){
        docNumber = docNumber.replaceAll('[^a-zA-Z0-9\\s+]', '');
        
        if(completaCasas) {
            docNumber = docNumber.leftPad(15, '0');
        }

        return docNumber;
    }

    public static String aplicarMascara(String mascara, String valor, boolean retornaVazio) {
		if (retornaVazio == true && (valor == null || valor.trim().equals(''))) {
			return '';
        }

		for(Integer i = 0; i < valor.length(); i++) {
			mascara = mascara.replaceFirst('#', valor.substring(i, i + 1));
		}

		return mascara.replaceAll('#', '');
	}

    public static String cnpjRaiz(String cnpj, Boolean semFormatacao, Boolean completaCasas) {
        String raiz = cnpj.substring(0, 8);
        
        if(semFormatacao) {
            raiz = raiz.replaceAll('[^a-zA-Z0-9\\s+]', '');

            if(completaCasas) {
                raiz = raiz.leftPad(9, '0');
            }
        }

        return raiz;
    }

}