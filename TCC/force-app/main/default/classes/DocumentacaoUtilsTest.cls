@isTest
private class DocumentacaoUtilsTest {
    
    @testSetup
    static void makeData(){
        
       Date currentDate = System.today();
        
       Documentacao__c docVencida = TestDataFactory.makeDocumentacao();
       insert docVencida;
        
       Documentacao__c docEmDia = TestDataFactory.makeDocumentacao();
       insert docEmDia;
        
       Documentacao__c docAVencer = TestDataFactory.makeDocumentacao();
       insert docAVencer;
        
       docVencida.DataVencimento__c = currentDate - 1;
       update docVencida;
        
       docEmDia.DataVencimento__c = currentDate + 1;
       update docEmDia;
    }
    
    @isTest
    static void updateStatusTest(){
        
        List<Documentacao__c> listDoc = [SELECT Id, DataVencimento__c, Status__c FROM Documentacao__c];
        
        Test.startTest();
        DocumentacaoUtils.updateStatus(listDoc);
        Test.stopTest();
    }
}