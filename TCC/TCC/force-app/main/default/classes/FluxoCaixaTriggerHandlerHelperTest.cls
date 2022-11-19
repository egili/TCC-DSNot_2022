@isTest
private class FluxoCaixaTriggerHandlerHelperTest {
    
    @isTest
    static void makeData(){
        insert new FluxoCaixa__c();
    }
    
    @isTest
    static void preventAddMoreThanOneTest(){
        List<FluxoCaixa__c> fluxoLista = [SELECT Id from FluxoCaixa__c];
        
        Test.startTest();
        FluxoCaixaTriggerHandlerHelper.preventAddMoreThanOne(fluxoLista);
        Test.stopTest();
    }
}