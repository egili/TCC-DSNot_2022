public with sharing class ProjetoDAO implements DAO {

    public static List<Projeto__c> get(String recordId){
        return [SELECT Id, Name, Descricao__c, Atendidos__c, DataInicioProjeto__c, DataTerminoProjeto__c, PeriodoProjeto__c, StatusProjeto__c FROM Projeto__c WHERE Id =: recordId];
    }
}