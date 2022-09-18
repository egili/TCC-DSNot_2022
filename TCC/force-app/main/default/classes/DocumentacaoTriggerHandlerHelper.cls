public with sharing class DocumentacaoTriggerHandlerHelper {

     public void setDataVencimentoDocumentacao(List<Documentacao__c> triggerNew, Map<Id, Documentacao__c> mapTriggerNew){
        
         Set<Id> ids = mapTriggerNew.keySet();
         
         List<Documentacao__c> docs = mapTriggerNew.values();
    }
}