@isTest
private class ProjetoVOTest {

    @isTest
    static void constructorTest(){
        Test.startTest();
        ProjetoVO projVo = new ProjetoVO();
        projVO.nomeProjeto = 'nome do projeto';
        projVO.periodoProjeto = Date.today();
        projVO.acoesProjeto = 'acoes';
        projVO.atendidos = 'atendidos';
        projVO.valor = 10.0;
        Test.stopTest();
        
        System.assert(projVO != null);
    }
    
    @isTest
    static void constructorOverloadTest(){
		Test.startTest();
        ProjetoVO projVo = new ProjetoVO('id', 'nome', Date.today(), 'acoes', 'atendidos', 10.0);
        Test.stopTest();
        
        System.assert(projVO != null);
    }
}