@isTest
private class DocumentacaoDAOTest {

    @testSetup
    static void makeData(){
        Documentacao__c doc = TestDataFactory.makeDocumentacao();
        insert doc;
    }
    
    @isTest
    static void getDocumentacoesTest(){
        Id recordId = [SELECT Id FROM Documentacao__c LIMIT 1].Id;
        
        Test.startTest();
        List<Documentacao__c> ret = DocumentacaoDAO.get(recordId);
        Test.stopTest();
        
        System.assert(ret.size() > 0);
    }
}