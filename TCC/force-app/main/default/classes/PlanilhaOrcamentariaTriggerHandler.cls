public with sharing class PlanilhaOrcamentariaTriggerHandler extends TriggerHandler {
    
    private List<PlanilhaOrcamentaria__c> triggerOld;
    private List<PlanilhaOrcamentaria__c> triggerNew;
    private Map<Id, PlanilhaOrcamentaria__c> mapTriggerNew;

    public PlanilhaOrcamentariaTriggerHandler(){
        triggerOld = Trigger.old;
        triggerNew = Trigger.new;
        mapTriggerNew = (Map<Id, PlanilhaOrcamentaria__c>) Trigger.newMap;
    }
    
    public override void beforeInsert(){
        PlanilhaOrcamentariaTriggerHandlerHelper.preventAddMoreThanOne(triggerNew);
    }
    
    public override void beforeDelete(){ 
        PlanilhaOrcamentariaTriggerHandlerHelper.preventDeletion(triggerOld);
    }
}