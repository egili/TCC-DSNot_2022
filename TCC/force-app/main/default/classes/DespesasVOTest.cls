@isTest
private class DespesasVOTest {

    @isTest
    static void defaultConstructorTest(){
        Test.startTest();
        DespesasVO despVO = new DespesasVO();
        Test.stopTest();
        
        System.assert(despVO != null);
    }
    
    @isTest
    static void constructorOverloadTest(){
        Test.startTest();
        DespesasVO despVO = new DespesasVO('idDespesa', 'descricao', System.today(), 10.0, 'idPlanilha', 'despesaPlanilhaOrcamentaria', 'idProjeto', 'despesaProjeto', 'domain');
        Test.stopTest();
        
        System.assert(despVO != null);
    }
}