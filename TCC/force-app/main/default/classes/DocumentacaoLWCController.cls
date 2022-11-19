public with sharing class DocumentacaoLWCController {

    @AuraEnabled(cacheable=true)
    public static List<DocumentacaoVO> getDocumentacao(String recordId){
        List<Documentacao__c> docs = DocumentacaoDAO.get(recordId);
        List<DocumentacaoVO> docsToDisplay = new List<DocumentacaoVO>();
        
        String urlDomain = Url.getOrgDomainUrl().toExternalForm();
        
        for(Documentacao__c doc: docs){
            DocumentacaoVO docVO = new DocumentacaoVO(doc.DocumentacaoProjeto__c, doc.DocumentacaoProjeto__r.Name, urlDomain);
            docVO.idDocumentacao = doc.Id;
            docVO.nomeOSC = doc.nomeOSC__c;
            docVO.nomeDocumento = doc.Name;
            docVO.tipo = doc.TipoDocumentacao__c == 'Outro' ? doc.OutroTipoDocumentacao__c : doc.TipoDocumentacao__c;
            docVO.vencimento = doc.DataVencimento__c;
            docVO.status = doc.Status__c;
            
            /*docsToDisplay.add(new DocumentacaoVO(doc.Id, 
                                                 doc.nomeOSC__c,
                                                 doc.DocumentacaoProjeto__c,
                                                 doc.DocumentacaoProjeto__r.Name, 
                                                 urlDomain, 
                                                 doc.Name,
                                                 doc.TipoDocumentacao__c,
                                                 doc.DataVencimento__c, 
                                                 doc.Status__c));*/
            docsToDisplay.add(docVO);
        }
        system.debug('docsToDisplay ' + docsToDisplay);
        
        return docsToDisplay;
	}
    
    @AuraEnabled
    public static void insertDocumentacaoInAction(String descricao, Date dataEmissao, Date dataVencimento, String tipo, String descricaoOutroTipo, String projetoRelacionado){
        insert new Documentacao__c(Name = descricao, DataEmissao__c = dataEmissao, DataVencimento__c = dataVencimento, TipoDocumentacao__c = tipo, OutroTipoDocumentacao__c = descricaoOutroTipo, DocumentacaoProjeto__c = projetoRelacionado);
    }
    
    @AuraEnabled(cacheable=true)
    public static String getUserName(){
		return UserInfo.getName();
    }
}