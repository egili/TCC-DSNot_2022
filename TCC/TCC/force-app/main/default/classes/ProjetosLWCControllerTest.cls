@isTest
private class ProjetosLWCControllerTest {

    @testSetup
    static void makeData(){
        insert TestDataFactory.makeProjeto();
    }
    
    @isTest
    static void getTest(){
        Id recordId = [SELECT Id FROM Projeto__c LIMIT 1].Id;

        Test.startTest();
        List<ProjetoVO> ret = ProjetosLWCController.getDadosProjetos(recordId);
        Test.stopTest();
        
        System.assert(ret.size() > 0);   
    }
}