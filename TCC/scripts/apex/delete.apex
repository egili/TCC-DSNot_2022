List<Projeto__c> projDelete = [SELECT Id FROM Projeto__c];
delete projDelete;

List<Documentacao__c> docDelete = [select id from Documentacao__c];
delete docDelete;
