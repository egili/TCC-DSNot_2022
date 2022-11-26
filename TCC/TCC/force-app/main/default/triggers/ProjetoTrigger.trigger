trigger ProjetoTrigger on Projeto__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
	new ProjetoTriggerHandler().run();
}