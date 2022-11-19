@isTest
private class ProjetoSearchControllerTest {
    
    @testSetup
    static void makeData(){
        insert TestDataFactory.makeProjeto();
    }
    
    @isTest
    static void getProjetosTest(){
        
        String projName = [SELECT Name FROM Projeto__c LIMIT 1].Name;
        
        Test.startTest();
        List<Projeto__c> listProj = ProjetoSearchController.getProjetos(projName);
        Test.stopTest();
        
        Assert.areEqual(projName, listProj.get(0).Name);
    }
}