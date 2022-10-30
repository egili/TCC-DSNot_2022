public with sharing class FluxoCaixaLWCController {

    @AuraEnabled
    public static List<Receitas__c> getReceitas(Decimal mes){
        return [SELECT Id, ValorReceita__c, Mes__c FROM Receitas__c WHERE Mes__c =: mes];
    }
    
    @AuraEnabled
    public static List<Despesas__c> getDespesas(Decimal mes){
        return [SELECT Id, ValorDespesa__c, Mes__c FROM Despesas__c WHERE Mes__c =: mes];
    }
}