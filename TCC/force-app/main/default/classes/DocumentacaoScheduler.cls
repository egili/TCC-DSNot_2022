global with sharing class DocumentacaoScheduler implements Schedulable {

    global void execute(SchedulableContext SC){
        List<Documentacao__c> listDoc = [SELECT Id, DataEmissao__c, DataVencimento__c FROM Documentacao__c];
        
        if(!listDoc.isEmpty()){
            DocumentacaoUtils.updateStatus(listDoc);
        }
    }
}