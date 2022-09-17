@isTest
private class DocumentacaoVOTest {

    @isTest
     static void constructorTest(){
        Test.startTest();
        DocumentacaoVO docVO = new DocumentacaoVO();
		docVO.idDocumentacao = 'id';
		docVO.Documento = 'documento';
        docVO.nomeOsc = 'nome';
        docVO.UnidadeExecutora = 'unidade';
        docVO.Validade = Date.today();
        Test.stopTest();
        
        System.assert(docVO != null);
    }
    
    @isTest
    static void constructorOverloadTest(){
        Test.startTest();
        DocumentacaoVO docVO = new DocumentacaoVO('id', 'documento', 'nome', 'unidade', Date.today());
        Test.stopTest();
        
        System.assert(docVO != null);
    }
}