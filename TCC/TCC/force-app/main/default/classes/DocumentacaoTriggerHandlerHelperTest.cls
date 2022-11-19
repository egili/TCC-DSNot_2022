@isTest
private class DocumentacaoTriggerHandlerHelperTest {

    @testSetup
    static void makeData(){
        
        List<Documentacao__c> docList = new List<Documentacao__c>();
        
        insert TestDataFactory.makeDocumentacao();
        
        Documentacao__c doc = new Documentacao__c();
        doc.TipoDocumentacao__c = 'Cartão do CNPJ';
        doc.DataEmissao__c = System.today();
        doc.DataVencimento__c = System.today() + 30;
        insert doc;
        
        Documentacao__c doc2 = new Documentacao__c();
        doc2.TipoDocumentacao__c = 'Ata de Eleição';
        doc2.DataEmissao__c = System.today();
        doc.DataVencimento__c = System.today() + 30;
        insert doc2;
        
        Documentacao__c doc3 = new Documentacao__c();
        doc3.TipoDocumentacao__c = 'Regimento Interno';
        doc3.DataEmissao__c = System.today();
        doc.DataVencimento__c = System.today() + 30;
        insert doc3;
        
        Documentacao__c doc4= new Documentacao__c();
        doc4.TipoDocumentacao__c = 'CRCE';
        doc4.DataEmissao__c = System.today();
        doc.DataVencimento__c = System.today() + 30;
        insert doc4;
        
        Documentacao__c doc5 = new Documentacao__c();
        doc5.TipoDocumentacao__c = 'CRC';
        doc5.DataEmissao__c = System.today();
        doc.DataVencimento__c = System.today() + 30;
        insert doc5;
        
        Documentacao__c doc6 = new Documentacao__c();
        doc6.TipoDocumentacao__c = 'CND Federal';
        doc6.DataEmissao__c = System.today();
        doc.DataVencimento__c = System.today() + 30;
        insert doc6;
        
        Documentacao__c doc7 = new Documentacao__c();
        doc7.TipoDocumentacao__c = 'CND Estadual';
        doc7.DataEmissao__c = System.today();
        doc.DataVencimento__c = System.today() + 30;
        insert doc7;
        
        Documentacao__c doc8 = new Documentacao__c();
        doc8.TipoDocumentacao__c = 'CND Municipal';
        doc8.DataEmissao__c = System.today();
        doc.DataVencimento__c = System.today() + 30;
        insert doc8;
        
        Documentacao__c doc9 = new Documentacao__c();
        doc9.TipoDocumentacao__c = 'outro';
        doc9.DataEmissao__c = System.today();
        doc.DataVencimento__c = System.today() + 30;
        insert doc9;
    }
    
    @isTest
    static void setDataVencimentoDocumentacaoTest(){
        List<Documentacao__c> docList = [SELECT Id, DataEmissao__c, DataVencimento__c, TipoDocumentacao__c FROM Documentacao__c];
        
        Test.startTest();
        DocumentacaoTriggerHandlerHelper.setDataVencimentoDocumentacao(docList);
        Test.stopTest();
    }
}