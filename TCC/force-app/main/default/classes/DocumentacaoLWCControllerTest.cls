@isTest
private class DocumentacaoLWCControllerTest {

    @testSetup
    static void makeDate(){
        Documentacao__c doc = TestDataFactory.makeDocumentacao();
        insert doc;
    }
    
    @isTest
    static void getDocumentacaoTest(){
        
        Id recordId = [SELECT Id FROM Documentacao__c LIMIT 1].Id;
        
        Test.startTest();
        List<DocumentacaoVO> listDocVO = DocumentacaoLWCController.getDocumentacao(recordId);
        Test.stopTest();
        
        System.assert(listDocVO.size() > 0);
    }
}