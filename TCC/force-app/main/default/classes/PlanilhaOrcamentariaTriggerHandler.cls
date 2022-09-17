public with sharing class PlanilhaOrcamentariaTriggerHandler extends TriggerHandler {
    
    private Map<Id, PlanilhaOrcamentaria__c> mapTriggerNew;

    public PlanilhaOrcamentariaTriggerHandler(){
        mapTriggerNew = (Map<Id, PlanilhaOrcamentaria__c>) Trigger.newMap;
    }
    
    /*public override void beforeInsert(){
        PlanilhaOrcamentariaTriggerHandlerHelper.preventAddMoreThanOne(Trigger.new);
    }*/
    
    public override void beforeDelete(){ 
        PlanilhaOrcamentariaTriggerHandlerHelper.preventDeletion(Trigger.old);
    }
}