public with sharing class ReceitasTriggerHandlerHelper {
    
    public static void fillMonthField(List<Receitas__c> triggerNew){

        Integer mesReceita;
        
        List<Receitas__c> rList = [SELECT Id, Mes__c, DataReceita__c FROM Receitas__c WHERE Id IN: triggerNew];
        List<Receitas__c> rToUpdate = new List<Receitas__c>();

        for(Receitas__c receita : rList){
            mesReceita = receita.DataReceita__c.month();
            receita.Mes__c = mesReceita;
            system.debug('mes da receita ' + receita.mes__c);
            rToUpdate.add(receita);
        }
        update rToUpdate;
    }
}
