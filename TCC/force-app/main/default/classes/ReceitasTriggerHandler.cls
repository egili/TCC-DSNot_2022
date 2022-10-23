public with sharing class ReceitasTriggerHandler extends TriggerHandler {

    public override void afterInsert(){
        ReceitasTriggerHandlerHelper.fillMonthField(Trigger.new);
    }
}