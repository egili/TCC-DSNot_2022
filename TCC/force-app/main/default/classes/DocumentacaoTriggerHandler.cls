public with sharing class DocumentacaoTriggerHandler extends TriggerHandler {

    public override void beforeInsert(){
        DocumentacaoTriggerHandlerHelper.setDataVencimentoDocumentacao(Trigger.new);
    }
}