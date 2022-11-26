@isTest
private class ReceitasLWCControllerTest {

    @testSetup
    static void makeData(){
        insert TestDataFactory.makeReceita();
    }

    @isTest
    static void getTest(){
        Id recordId = [SELECT Id FROM Receitas__c LIMIT 1].Id;

        Test.startTest();
        List<ReceitasVO> ret = ReceitasLWCController.getReceita(recordId);
        Test.stopTest();
        
        System.assert(ret.size() > 0);        
    }
}