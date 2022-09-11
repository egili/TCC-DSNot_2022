public with sharing class ProjetoTriggerHandler extends TriggerHandler {
    
    private List<Projeto__c> triggerNew;
    
    private Map<Id, Projeto__c> mapTriggerNew;

    public ProjetoTriggerHandler(){
        triggerNew = Trigger.new;
        
        mapTriggerNew = (Map<Id, Projeto__c>) Trigger.newMap;
    }
        
    public override void afterInsert(){
      ProjetoTriggerHandlerHelper.insertRelatedPlanilhaInProjeto(triggerNew);
    }
}