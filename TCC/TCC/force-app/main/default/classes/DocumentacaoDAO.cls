public with sharing class DocumentacaoDAO implements DAO {

    public static List<Documentacao__c> get(String recordId){
        return [SELECT Id, NomeOSC__c, DocumentacaoProjeto__r.Name, Name, TipoDocumentacao__c, OutroTipoDocumentacao__c, DataVencimento__c, Status__c FROM Documentacao__c WHERE Id =: recordId];
    }
}