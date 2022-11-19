public with sharing class PlanilhaOrcamentariaTriggerHandlerHelper {

    public static void preventAddMoreThanOne(List<PlanilhaOrcamentaria__c> triggerNew){
        
        Set<Id> idsPlanilhas = new Set<Id>();
        List<Projeto__c> projList = new List<Projeto__c>();
        
        for(PlanilhaOrcamentaria__c plan: triggerNew){
            idsPlanilhas.add(plan.Id);
            projList.add(new Projeto__c());
        }
        
        system.debug('planilhas :: ' + idsPLanilhas);
        system.debug('projetos :: ' + projList);
        
        /*for(PlanilhaOrcamentaria__c planilha: triggerNew){
            if(counter != 1)
	          	planilha.addError('Um Projeto não pode ter mais de uma Planilha Orçamentária');
        }*/
        
        // verificar se ja existe planilha adicionada no projeto, caso tenha, deletar a nova 
    }
    
    
    // daqui pra baixo ja funciona
    public static void preventDeletion(List<PlanilhaOrcamentaria__c> triggerOld){
        for(PlanilhaOrcamentaria__c planilha: triggerOld){
            planilha.addError('Uma Planilha Orçamentária não pode ser deletada');
        }
    }
}