global with sharing class DocumentacaoScheduler implements Schedulable {
    
    public static String scheduleDaily = '0 0 1 * * ?'; // roda todo dia uma da manhã

    global void execute(SchedulableContext SC){
        List<Documentacao__c> listDoc = [SELECT Id, DataEmissao__c, DataVencimento__c, Status__c FROM Documentacao__c];
        
        if(!listDoc.isEmpty())
            DocumentacaoUtils.updateStatus(listDoc);
    }
    
    /*global static String scheduleEveryDay(){
        return System.schedule('schedule for updating doc status', scheduleDaily, new DocumentacaoScheduler());
    }*/
}