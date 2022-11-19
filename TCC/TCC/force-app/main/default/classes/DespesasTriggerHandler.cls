public with sharing class DespesasTriggerHandler extends TriggerHandler {

    public override void beforeInsert(){
    	DespesasTriggerHandlerHelper.insertInFluxoCaixa(Trigger.new);
    }
    
    public override void afterInsert(){
        DespesasTriggerHandlerHelper.fillMonthField(Trigger.new);
    }
}