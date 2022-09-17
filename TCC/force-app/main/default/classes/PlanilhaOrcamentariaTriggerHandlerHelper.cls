public with sharing class PlanilhaOrcamentariaTriggerHandlerHelper {

    public static void preventAddMoreThanOne(List<PlanilhaOrcamentaria__c> triggerNew){
        
        Set<Id> idsPlanilhas = new Set<Id>();
        Projeto__c proj = new Projeto__c();
        
        for(PlanilhaOrcamentaria__c plan: triggerNew){
            idsPlanilhas.add(plan.Id);
        }
       
        //List<PlanilhaOrcamentaria__c> planilhas = [SELECT Id, PlanilhaOrcamentariaProjeto__c FROM PlanilhaOrcamentaria__c WHERE Id IN : idsPlanilha AND PlanilhaOrcamentariaProjeto__c != null];
        
        Integer counter = [SELECT COUNT() FROM PlanilhaOrcamentaria__c WHERE PlanilhaOrcamentariaProjeto__c != null];
        
        //system.debug('planilhas:: ' + planilhas);
        
        for(PlanilhaOrcamentaria__c planilha: triggerNew){
            if(counter != 1)
            	planilha.addError('Um Projeto não pode ter mais de uma Planilha Orçamentária');
        }
        
        // verificar se ja existe planilha adicionada no projeto, caso tenha, deletar a nova 
    }
    
    
    // daqui pra baixo ja funciona
    public static void preventDeletion(List<PlanilhaOrcamentaria__c> triggerOld){
        for(PlanilhaOrcamentaria__c planilha: triggerOld){
            planilha.addError('Uma Planilha Orçamentária não pode ser deletada');
        }
    }
}