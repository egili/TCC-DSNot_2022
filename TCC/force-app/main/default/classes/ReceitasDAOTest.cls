@isTest
private class ReceitasDAOTest {
    
    @testSetup
    static void makeData(){
        insert TestDataFactory.makeReceita();
    }

    @isTest
    static void getTest(){
        Id recordId = [SELECT Id FROM Receitas__c LIMIT 1].Id;

        Test.startTest();
        List<Receitas__c> ret = ReceitasDAO.get(recordId);
        Test.stopTest();
        
        System.assert(ret.size() > 0);        
    }
}