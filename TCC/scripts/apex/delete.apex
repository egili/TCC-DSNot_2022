List<Projeto__c> projDelete = [SELECT Id FROM Projeto__c];
delete projDelete;

List<Documentacao__c> docDelete = [SELECT Id FROM Documentacao__c];
delete docDelete;

List<Receitas__c> recDelete = [SELECT Id FROM Receitas__c];
delete recDelete;

List<Despesas__c> despDelete = [SELECT Id FROM Despesas__c];
delete despDelete;