public with sharing class ProjetoTriggerHandler extends TriggerHandler {
     
    public override void afterInsert(){
      ProjetoTriggerHandlerHelper.insertRelatedPlanilhaInProjeto(Trigger.new);
    }
    
    public override void beforeDelete(){
        //ProjetoTriggerHandlerHelper.deleteRelatedPlanilha((Map<Id, Projeto__c>) Trigger.oldMap);
    }
}