public with sharing class DocumentacaoTriggerHandler extends TriggerHandler {

    public override void afterInsert(){
        DocumentacaoTriggerHandlerHelper.setDataVencimentoDocumentacao(Trigger.new);
    }
}