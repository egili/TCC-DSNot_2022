public with sharing class DespesasTriggerHandlerHelper {
    
    public static void fillMonthField(List<Despesas__c> triggerNew){

        Integer mesReceita;
        
        List<Despesas__c> dList = [SELECT Id, Mes__c, DataDespesa__c FROM Despesas__c WHERE Id IN: triggerNew];
        List<Despesas__c> dToUpdate = new List<Despesas__c>();

        for(Despesas__c Despesa : dList){
            mesReceita = Despesa.DataDespesa__c.month();
            Despesa.Mes__c = mesReceita;
            system.debug('mes da Despesa ' + Despesa.mes__c);
            dToUpdate.add(Despesa);
        }
        update dToUpdate;
    }
}
