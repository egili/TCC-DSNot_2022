public with sharing class ReceitasTriggerHandler extends TriggerHandler {

    public override void beforeInsert(){
    	ReceitasTriggerHandlerHelper.insertInFluxoCaixa(Trigger.new);
        ReceitasTriggerHandlerHelper.preventAdditionWhenProjIsFinished(Trigger.new);
    }
    
    public override void afterInsert(){
        ReceitasTriggerHandlerHelper.fillMonthField(Trigger.new);
    }
}