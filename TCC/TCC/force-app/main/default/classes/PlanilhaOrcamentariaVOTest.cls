@isTest
private class PlanilhaOrcamentariaVOTest {

    @isTest
    static void defaultConstructorTest(){
        Test.startTest();
		PlanilhaOrcamentariaVO planVO = new PlanilhaOrcamentariaVO(); 
    	Test.stopTest();
        
        System.assert(planVO != null);
    }
    
    @isTest
    static void constructorOverloadTest(){
        Test.startTest();
		PlanilhaOrcamentariaVO planVO = new PlanilhaOrcamentariaVO('idPlanilha', 'nomePlanilha', 'descricao', 'idProjeto', 'planilhaProjeto', 'domain'); 
    	Test.stopTest();
        
        System.assert(planVO != null);
    }    
}