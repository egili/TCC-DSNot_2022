@isTest
private class PlanilhaOrcamentariaLWCControllerTest {
    
    @testSetup
    static void makeData(){
        insert TestDataFactory.makePlanilhaOrcamentaria();
    }
    
    @isTest
    static void getDocumentacoesTest(){
        Id recordId = [SELECT Id FROM PlanilhaOrcamentaria__c LIMIT 1].Id;
        
        Test.startTest();
        List<PlanilhaOrcamentariaVO> ret = PlanilhaOrcamentariaLWCController.getPlanilha(recordId);
        Test.stopTest();
        
        System.assert(ret.size() > 0);
    }
}