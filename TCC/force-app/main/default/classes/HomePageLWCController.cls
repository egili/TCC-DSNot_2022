public with sharing class HomePageLWCController {

    @AuraEnabled(cacheable=true)
    public static Integer getNumberOfProjetos(){
        return [SELECT COUNT() FROM Projeto__c];
    }
    
    @AuraEnabled(cacheable=true)
    public static Integer getDocsToUpdate(){
        return [SELECT COUNT() FROM Documentacao__c WHERE Status__c != 'Atualizado'];
    }
}