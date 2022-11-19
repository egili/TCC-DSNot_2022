@isTest
private class ReceitasVOTest {

    @isTest
    static void defaultConstuctorTest(){
        Test.startTest();
        ReceitasVO rVO = new ReceitasVO();
        Test.stopTest();
        
        System.assert(rVO != null);
    } 
    
    @isTest
    static void constructorOverloadTest(){
        Test.startTest();
        ReceitasVO rVO = new ReceitasVO('idReceita', System.today(), 'fonte', 'descricao', 10.0, 'idProjeto', 'receitaProjeto', 'idPlanilha', 'receitaPlanilha', 'domain');
        Test.stopTest();
        
        System.assert(rVo != null);
    }
}