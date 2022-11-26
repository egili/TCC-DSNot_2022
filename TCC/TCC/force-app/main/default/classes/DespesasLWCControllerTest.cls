@isTest
private class DespesasLWCControllerTest {

    @testSetup
    static void makeData(){
        insert TestDataFactory.makeDespesa();
    }
    
    @isTest
    static void getTest(){
        Id recordId = [SELECT Id FROM Despesas__c LIMIT 1].Id;

        Test.startTest();
        List<DespesasVO> ret = DespesasLWCController.getDespesas(recordId);
        Test.stopTest();
        
        System.assert(ret.size() > 0);   
    }
}