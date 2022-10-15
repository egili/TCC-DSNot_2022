public with sharing class DocumentacaoVO {

    public DocumentacaoVO(){}
    
    public DocumentacaoVO(String idDocumentacao, String nomeOSC, Id idDocumentacaoProjeto, String documentacaoProj, String domain, String nomeDocumento, String tipo, Date vencimento, String status){
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
    
    public class RelatedSObject{
        
        @AuraEnabled public Id idSObject	   {get; set;}
        @AuraEnabled public String nameSObject {get; set;}
        @AuraEnabled public String urlSObject  {get; set;}
        
        public RelatedSObject(Id idSObject, String nameSObject, String domain){
            this.idSObject = idSObject;
            this.nameSObject = nameSObject;
            this.urlSObject = domain + '/' + idSObject;
        }
    }
}