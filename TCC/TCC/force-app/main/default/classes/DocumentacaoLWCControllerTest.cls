@isTest
private class DocumentacaoLWCControllerTest {

    @testSetup
    static void makeDate(){
        insert TestDataFactory.makeDocumentacao();
        
        insert TestDataFactory.makeProjeto();
        
        User u = new User(
        ProfileId = [SELECT Id FROM Profile WHERE Name = 'System Administrator'].Id,
        LastName = 'uLast',
        Email = 'user123@amamama.com',
        Username = 'user120@amamama.com',
        CompanyName = 'TEST',
        Title = 'Tittle',
        Alias = 'uAlias',
        TimeZoneSidKey = 'America/Los_Angeles',
        EmailEncodingKey = 'UTF-8',
        LanguageLocaleKey = 'en_US',
        LocaleSidKey = 'en_US');
        insert u;
    }
    
    @isTest
    static void getDocumentacaoTest(){
        
        Id recordId = [SELECT Id FROM Documentacao__c LIMIT 1].Id;
        
        Test.startTest();
        List<DocumentacaoVO> listDocVO = DocumentacaoLWCController.getDocumentacao(recordId);
        Test.stopTest();
        
        System.assert(listDocVO.size() > 0);
    }
    
    @isTest
    static void insertDocumentacaoInActionTest(){
        
        Id idProj = [SELECT Id FROM Projeto__c LIMIT 1].Id;
        
        Test.startTest();
        DocumentacaoLWCController.insertDocumentacaoInAction('descricao', System.today(), System.today() + 30, 'Estatuto', 'descricaoOutroTipo', IdProj);
        Test.stopTest();
    }
    
    @isTest
    static void getUserNameTest(){
        
        User u = [SELECT Id FROM User LIMIT 1];
        
        Test.startTest();
        System.runAs(u){
            String ret = DocumentacaoLWCController.getUserName();
        }
        Test.stopTest();        
    }
}