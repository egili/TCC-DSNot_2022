public with sharing class DocumentacaoDAO {

    public static List<Documentacao__c> getDocumentacoes(String recordId){
        return [SELECT Id, NomeOSC__c, DocumentacaoProjeto__r.Name, Name, Tipo__c, DataVencimento__c, Status__c FROM Documentacao__c WHERE Id =: recordId];
    }
}