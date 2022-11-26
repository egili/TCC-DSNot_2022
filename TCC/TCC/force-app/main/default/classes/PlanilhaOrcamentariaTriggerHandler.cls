public with sharing class PlanilhaOrcamentariaTriggerHandler extends TriggerHandler {

    public override void beforeInsert(){
        //PlanilhaOrcamentariaTriggerHandlerHelper.preventAddMoreThanOne((Map<Id, PlanilhaOrcamentaria__c>) Trigger.newMap);
    }
    
    public override void beforeDelete(){ 
        PlanilhaOrcamentariaTriggerHandlerHelper.preventDeletion(Trigger.old);
    }
}