@isTest
private class ReceitasTriggerHandlerHelperTest {
    
    @testSetup
    static void makeData(){
        insert TestDataFactory.makeDespesa();
    }
    
    @isTest
    static void fillMonthFieldTest(){
        
        List<Receitas__c> listReceitas = [SELECT Id, Mes__c, DataReceita__c FROM Receitas__c];
        
        Test.startTest();
        ReceitasTriggerHandlerHelper.fillMonthField(listReceitas);
        Test.stopTest();
    }
}