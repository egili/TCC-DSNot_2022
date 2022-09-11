public with sharing class PlanilhaOrcamentariaTriggerHandlerHelper {

    public static void preventAddMoreThanOne(Map<Id, PlanilhaOrcamentaria__c> mapTriggerNew){
        
        Set<Id> idsPlanilha = mapTriggerNew.keySet();
        
        system.debug('idsPlanilha:: ' + idsPlanilha);
       
        List<PlanilhaOrcamentaria__c> planilhas = [SELECT Id, PlanilhaOrcamentariaProjeto__c FROM PlanilhaOrcamentaria__c WHERE Id IN : idsPlanilha AND PlanilhaOrcamentariaProjeto__c != null];
        
        system.debug('planilhas:: ' + planilhas);
        
        for(PlanilhaOrcamentaria__c planilha: mapTriggerNew.values()){
            //if(idsPlanilha.size() != 1)
            	planilha.addError('Um Projeto não pode ter mais de uma Planilha Orçamentária');
        }
    }
    
    public static void preventDeletion(List<PlanilhaOrcamentaria__c> triggerOld){
        for(PlanilhaOrcamentaria__c planilha: triggerOld){
            planilha.addError('Uma Planilha Orçamentária não pode ser deletada');
        }
    }
}