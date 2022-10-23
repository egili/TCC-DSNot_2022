public with sharing class DespesasTriggerHandler extends TriggerHandler {

    public override void afterInsert(){
        DespesasTriggerHandlerHelper.fillMonthField(Trigger.new);
    }
}