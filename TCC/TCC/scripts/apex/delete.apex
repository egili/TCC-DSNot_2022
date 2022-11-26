List<Receitas__c> r = [SELECT Id FROM Receitas__c];
delete r;

List<Despesas__c> d = [SELECT Id FROM Despesas__c];
delete d;

List<Projeto__c> p = [SELECT Id FROM Projeto__c];
delete p;

List<Documentacao__c> o = [SELECT Id FROM Documentacao__c];
delete o;

List<PlanilhaOrcamentaria__c> po = [SELECT Id FROM PlanilhaOrcamentaria__c];
delete po;