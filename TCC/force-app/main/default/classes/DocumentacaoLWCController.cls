public with sharing class DocumentacaoLWCController {

    @AuraEnabled
    public static List<DocumentacaoVO> getDocumentacao(String recordId){
        
        List<Documentacao__c> docs = DocumentacaoDAO.getDocumentacoes(recordId);
        List<DocumentacaoVO> docsToDisplay = new List<DocumentacaoVO>();
        
        for(Documentacao__c doc: docs){
            docsToDisplay.add(new DocumentacaoVO(doc.Id, doc.nomeOSC__c, doc.DocumentacaoProjeto__c, doc.Name, doc.Tipo__c, doc.DataVencimento__c, doc.Status__c));
        }
        return docsToDisplay;
	}
}