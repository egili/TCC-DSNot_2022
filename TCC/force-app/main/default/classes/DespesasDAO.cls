public with sharing class DespesasDAO implements DAO {

    public static List<Despesas__c> get(String recordId){
        return [SELECT Id, Name, DataDespesa__c, Descricao__c, DespesasPlanilhaOrcamentaria__r.Name, DespesasProjeto__r.Name, DespesasProjeto__c, DespesasPlanilhaOrcamentaria__c, ValorDespesa__c FROM Despesas__c WHERE Id =: recordId];
    }
}