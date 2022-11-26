public with sharing class ReceitasDAO implements DAO{

    public static List<Receitas__c> get(String recordId){
        return [SELECT Id, Name, DataReceita__c, Fonte__c, ReceitaPlanilhaOrcamentaria__c, ReceitaPlanilhaOrcamentaria__r.Name, ReceitasProjeto__c, ReceitasProjeto__r.Name, ValorReceita__c FROM Receitas__c WHERE Id =: recordId];
    }
    
    public static List<Receitas__c> getAllByMonth(Decimal mes){
        return [SELECT Id, ValorReceita__c, Mes__c FROM Receitas__c WHERE Mes__c =: mes];
    }
    
    public static List<Receitas__c> getAll(){
        return [SELECT Id, ValorReceita__c FROM Receitas__c];
    }
}