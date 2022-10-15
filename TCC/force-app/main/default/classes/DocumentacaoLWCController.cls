public with sharing class DocumentacaoLWCController {

    @AuraEnabled
    public static List<DocumentacaoVO> getDocumentacao(String recordId){
        List<Documentacao__c> docs = DocumentacaoDAO.getDocumentacoes(recordId);
        List<DocumentacaoVO> docsToDisplay = new List<DocumentacaoVO>();
        
        String urlDomain = Url.getOrgDomainUrl().toExternalForm();
        
        for(Documentacao__c doc: docs){
            docsToDisplay.add(new DocumentacaoVO(doc.Id, doc.nomeOSC__c, doc.DocumentacaoProjeto__c, doc.DocumentacaoProjeto__r.Name, urlDomain, doc.Name, doc.Tipo__c, doc.DataVencimento__c, doc.Status__c));
        }
        system.debug('docsToDisplay ' + docsToDisplay);
        
        return docsToDisplay;
	}
    
    @AuraEnabled
    public static void insertDocumentacaoInAction(String descricao, Date dataEmissao, Date dataVencimento, String tipo, String descricaoOutroTipo, String projetoRelacionado){
        insert new Documentacao__c(Name = descricao, DataEmissao__c = dataEmissao, DataVencimento__c = dataVencimento, Tipo__c = tipo, OutroTipoDocumentacao__c = descricaoOutroTipo, DocumentacaoProjeto__c = projetoRelacionado);
    }
    
    @AuraEnabled
    public static String getUserName(){
		return UserInfo.getName();
    }
}