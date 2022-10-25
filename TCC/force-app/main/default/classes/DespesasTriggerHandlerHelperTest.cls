@isTest
private class DespesasTriggerHandlerHelperTest {

    @testSetup
    static void makeData(){
        insert TestDataFactory.makeDespesa();
    }
    
    @isTest
    static void fillMonthFieldTest(){
        
        List<Despesas__c> listDesp = [SELECT Id, Mes__c, ValorDespesa__c FROM Despesas__c];
        
        Test.startTest();
        DespesasTriggerHandlerHelper.fillMonthField(listDesp);
        Test.stopTest();
    }
}