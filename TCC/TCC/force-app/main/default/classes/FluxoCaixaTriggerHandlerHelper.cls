public with sharing class FluxoCaixaTriggerHandlerHelper {

    public static void preventAddMoreThanOne(List<FluxoCaixa__c> triggerNew){
		Id fc = [SELECT Id FROM FluxoCaixa__c].Id;
        
        for(FluxoCaixa__c f : triggerNew){
            if(fc != null)
                f.addError('Já existe Fluxo de Caixa criado');
        }
    }
    
    public static void preventDeletion(List<FluxoCaixa__c> triggerOld){
        for(FluxoCaixa__c f : triggerOld){
            f.addError('O Fluxo de Caixa não pode ser deletado');
        }
    }
}