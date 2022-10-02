public with sharing class DocumentacaoVO {

    public DocumentacaoVO(){}
    
    public DocumentacaoVO(String idDocumentacao, String nomeOSC, String documentacaoProj, String nomeDocumento, String tipo, Date vencimento, String status){
        this.idDocumentacao   = idDocumentacao;
        this.nomeOSC 		  = nomeOSC;
        this.documentacaoProj = documentacaoProj;
        this.nomeDocumento    = nomeDocumento;
        this.tipo			  = tipo;
        this.vencimento 	  = vencimento;
        this.status 		  = status;
    }
    
    @AuraEnabled public String idDocumentacao 	{get; set;}
    @AuraEnabled public String nomeOSC 			{get; set;}
    @AuraEnabled public String documentacaoProj {get; set;}
    @AuraEnabled public String nomeDocumento	{get; set;} 
    @AuraEnabled public String tipo				{get; set;}
    @AuraEnabled public Date vencimento    		{get; set;}
    @AuraEnabled public String status 			{get; set;}
}