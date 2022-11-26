public with sharing class DocumentacaoTriggerHandler extends TriggerHandler {

    public override void beforeInsert(){
		DocumentacaoTriggerHandlerHelper.preventAdditionWhenProjIsFinished(Trigger.new);
    }
    
    public override void afterInsert(){
        DocumentacaoTriggerHandlerHelper.setDataVencimentoDocumentacao(Trigger.new);
    }
}