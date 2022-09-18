public with sharing class PlanilhaOrcamentariaTriggerHandler extends TriggerHandler {
    
    public override void beforeInsert(){
       // PlanilhaOrcamentariaTriggerHandlerHelper.preventAddMoreThanOne(Trigger.new);
    }
    
    public override void afterInsert(){
       PlanilhaOrcamentariaTriggerHandlerHelper.preventAddMoreThanOne(Trigger.new);
    }
    
    public override void beforeDelete(){ 
        PlanilhaOrcamentariaTriggerHandlerHelper.preventDeletion(Trigger.old);
    }
}