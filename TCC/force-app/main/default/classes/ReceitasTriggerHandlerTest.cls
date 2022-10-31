@isTest
private class ReceitasTriggerHandlerTest {

    @isTest
    static void afterInsertTest(){
        insert TestDataFactory.makeReceita();
    }
}