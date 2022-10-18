public with sharing class ProjetoSearchController {
    public ProjetoSearchController() {}

    @AuraEnabled
    public static List<Projeto__c> getAccounts(String projName){
        List<Projeto__c> projList = new List<Projeto__c>();

        if(projName != ''){
            String projetoName = '%' + projName + '%';
            projList = [SELECT Id, Name FROM Projeto__c WHERE Name LIKE :projetoName];

            return projList;  
        }
        return projList;
    }
}
