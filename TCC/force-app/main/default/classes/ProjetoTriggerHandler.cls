public with sharing class ProjetoTriggerHandler extends TriggerHandler {
     
    public override void afterInsert(){
      ProjetoTriggerHandlerHelper.insertRelatedPlanilhaInProjeto(Trigger.new);
    }
}