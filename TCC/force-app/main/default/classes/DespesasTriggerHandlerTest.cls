@isTest
private class DespesasTriggerHandlerTest {

    @isTest
    static void afterInsertTest(){
        insert TestDataFactory.makeDespesa();
    }
}