@isTest
private class FluxoCaixaLWCControllerTest {

    @testSetup
    static void makeData(){
        TriggerHandler.bypass('ReceitasTriggerHandler');
        insert TestDataFactory.makeReceita();
        TriggerHandler.clearBypass('ReceitasTriggerHandler');
        
        TriggerHandler.bypass('DespesasTriggerHandler');
        insert TestDataFactory.makeDespesa();
        TriggerHandler.clearBypass('DespesasTriggerHandler');
    }
    
    @isTest
    static void getTotalReceitasTest(){
        Decimal d = Decimal.valueOf(String.valueOf(System.today().month()));
        
        Test.startTest();
        Decimal ret = FluxoCaixaLWCController.getTotalReceitas(d);
        Test.stopTest();
        
        System.debug('totalReceitas: ' + ret);
    }
    
    @isTest
    static void getTotalDespesasTest(){
        Decimal d = Decimal.valueOf(String.valueOf(System.today().month()));
        
        Test.startTest();
        Decimal ret = FluxoCaixaLWCController.getTotalDespesas(d);
        Test.stopTest();
        
        System.debug('totalDespesas: ' + ret);
    }
    
    @isTest
    static void getSaldoAnualTest(){
        Test.startTest();
        Decimal ret = FluxoCaixaLWCController.getSaldoAnual();
        Test.stopTest();
        
        System.debug('saldoAnual: ' + ret);
    }
}