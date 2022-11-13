public with sharing class DocumentacaoVO extends RelatedOverrideable {

    public DocumentacaoVO(){}
    
    public DocumentacaoVO(String idDocumentacaoProjeto,
                          String documentacaoProj,
                          String domain){
    	this.documentacaoProj = new RelatedSObject(idDocumentacaoProjeto, documentacaoProj, domain);
	}
    
    public DocumentacaoVO(String idDocumentacao, String nomeOSC, String idDocumentacaoProjeto, String documentacaoProj, String domain, String nomeDocumento, String tipo, Date vencimento, String status){
        this.idDocumentacao   = idDocumentacao;
        this.nomeOSC 		  = nomeOSC;
        this.documentacaoProj = new RelatedSObject(idDocumentacaoProjeto, documentacaoProj, domain);
        this.nomeDocumento    = nomeDocumento;
        this.tipo			  = tipo;
        this.vencimento 	  = vencimento;
        this.status 		  = status;
    }
    
    @AuraEnabled public String idDocumentacao 			{get; set;}
    @AuraEnabled public String nomeOSC 			        {get; set;}
    @AuraEnabled public RelatedSObject documentacaoProj {get; set;}
    @AuraEnabled public String nomeDocumento			{get; set;} 
    @AuraEnabled public String tipo						{get; set;}
    @AuraEnabled public Date vencimento    				{get; set;}
    @AuraEnabled public String status 					{get; set;}
}