public with sharing class PlanilhaOrcamentariaDAO implements DAO {

    public static List<PlanilhaOrcamentaria__c> get(String recordId){
        return [SELECT Id, Name, PlanilhaOrcamentariaProjeto__r.Name, Descricao__c FROM PlanilhaOrcamentaria__c WHERE Id =: recordId];
    }
}