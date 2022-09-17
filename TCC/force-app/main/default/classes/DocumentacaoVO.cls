public with sharing class DocumentacaoVO {

    public DocumentacaoVO(){}
    
    public DocumentacaoVO(String idDocumentacao, String nomeOSC, String unidadeExecutora, String documento, Date validade){
        this.idDocumentacao   = idDocumentacao;
        this.nomeOSC 		  = nomeOSC;
        this.unidadeExecutora = unidadeExecutora;
        this.documento        = documento;
        this.validade 		  = validade;
    }
    
    @AuraEnabled public String idDocumentacao 	{get; set;}
    @AuraEnabled public String nomeOSC 			{get; set;}
    @AuraEnabled public String unidadeExecutora {get; set;}
    @AuraEnabled public String documento 		{get; set;} //TODO: link para documentação
    @AuraEnabled public Date validade    		{get; set;}
}