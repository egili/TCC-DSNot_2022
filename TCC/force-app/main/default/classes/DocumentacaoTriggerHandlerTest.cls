@isTest
private class DocumentacaoTriggerHandlerTest {
    
    @isTest
    static void afterInsertTest(){
        Test.startTest();
        Database.insert(TestDataFactory.makeDocumentacao());
        Test.stopTest();
    }
}