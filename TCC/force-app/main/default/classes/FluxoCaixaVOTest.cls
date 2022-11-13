@isTest
private class FluxoCaixaVOTest {
    
    @isTest
    static void defaultConstructorTest(){
        FluxoCaixaVO fVO = new FluxoCaixaVO();
        
        Assert.isNotNull(fVO);
    }
    
    @isTest
    static void constructorOverloadTest(){
		FluxoCaixaVO fVO = new FluxoCaixaVO('idFluxoCaixa', 'fluxoCaixa', 'domain');

		Assert.isNotNull(fVO);
    }
}