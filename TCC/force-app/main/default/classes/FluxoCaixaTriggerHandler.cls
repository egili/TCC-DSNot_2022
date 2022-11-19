public with sharing class FluxoCaixaTriggerHandler extends TriggerHandler {

    public override void beforeInsert(){
        FluxoCaixaTriggerHandlerHelper.preventAddMoreThanOne((List<FluxoCaixa__c>) Trigger.new);
    }
    
    public override void beforeDelete(){
        FluxoCaixaTriggerHandlerHelper.preventDeletion((List<FluxoCaixa__c>) Trigger.old);
	}
}