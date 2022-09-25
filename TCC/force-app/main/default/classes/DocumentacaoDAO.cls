public with sharing class DocumentacaoDAO {

    public static List<Documentacao__c> getDocumentacoes(String recordId){
        return [SELECT Id, NomeOSC__c, DocumentacaoProjeto__c, Name, Tipo__c, Status__c, DataVencimento__c FROM Documentacao__c WHERE Id =: recordId];
    }
}