public with sharing class FluxoCaixaDAO implements DAO {

    public static List<FluxoCaixa__c> get(String recordId){
        return [SELECT Id, Name FROM FluxoCaixa__c LIMIT 1];
    }
}