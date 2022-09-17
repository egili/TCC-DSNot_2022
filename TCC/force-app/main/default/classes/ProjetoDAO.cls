public with sharing class ProjetoDAO {

    public static List<Projeto__c> getProjetos(String recordId){
        return [SELECT Id, Name, PeriodoProjeto__c FROM Projeto__c WHERE Id =: recordId];
    }
}