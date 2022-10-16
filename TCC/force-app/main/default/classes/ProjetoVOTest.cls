@isTest
private class ProjetoVOTest {

    @isTest
    static void constructorTest(){
        Test.startTest();
        ProjetoVO projVo = new ProjetoVO();
        Test.stopTest();
        
        System.assert(projVO != null);
    }
    
    @isTest
    static void constructorOverloadTest(){
		Test.startTest();
        ProjetoVO projVo = new ProjetoVO('id', 'nome', 'descricao', 10.0, System.today(), System.today(), System.today(), 'status');
        Test.stopTest();
        
        System.assert(projVO != null);
    }
}