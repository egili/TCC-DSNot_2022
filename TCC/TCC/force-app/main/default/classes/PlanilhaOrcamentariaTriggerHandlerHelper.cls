public with sharing class PlanilhaOrcamentariaTriggerHandlerHelper {

    public static void preventAddMoreThanOne(Map<Id, PlanilhaOrcamentaria__c> mapTriggerNew){
        for(PlanilhaOrcamentaria__c plan : mapTriggerNew.values()){
            if(plan.PlanilhaOrcamentariaProjeto__c == null)
                plan.addError('bosta vaca');
        }
    }
    
    public static void preventDeletion(List<PlanilhaOrcamentaria__c> triggerOld){
        for(PlanilhaOrcamentaria__c planilha: triggerOld){
            planilha.addError('Uma Planilha Orçamentária não pode ser deletada');
        }
    }
}