public with sharing class ProjetoTriggerHandler extends TriggerHandler {
    
    private Map<Id, Projeto__c> mapTriggerNew;

    public ProjetoTriggerHandler(){       
        mapTriggerNew = (Map<Id, Projeto__c>) Trigger.newMap;
    }
        
    public override void afterInsert(){
      ProjetoTriggerHandlerHelper.insertRelatedPlanilhaInProjeto(Trigger.new);
    }
}