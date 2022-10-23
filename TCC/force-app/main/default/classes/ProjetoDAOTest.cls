@isTest
private class ProjetoDAOTest {
    
    @testSetup
    static void makeData(){
        insert TestDataFactory.makeProjeto();
    }
    
    @isTest
    static void getTest(){
        Id recordId = [SELECT Id FROM Projeto__c LIMIT 1].Id;

        Test.startTest();
        List<Projeto__c> ret = ProjetoDAO.get(recordId);
        Test.stopTest();
        
        System.assert(ret.size() > 0);   
    }
}