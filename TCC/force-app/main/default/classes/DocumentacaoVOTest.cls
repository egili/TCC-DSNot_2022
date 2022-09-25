@isTest
private class DocumentacaoVOTest {

    @isTest
     static void constructorTest(){
        Test.startTest();
        DocumentacaoVO docVO = new DocumentacaoVO();
        Test.stopTest();
        
        System.assert(docVO != null);
    }
    
    @isTest
    static void constructorOverloadTest(){
        Test.startTest();
        DocumentacaoVO docVO = new DocumentacaoVO('id', 'nomeosc', 'docproj', 'documento', 'tipo', Date.today(), 'status');
        Test.stopTest();
        
        System.assert(docVO != null);
    }
}