@isTest
private class RelatedOverrideableTest {

    @isTest
    static void defaultConstructorTest(){
        Test.startTest();
        RelatedOverrideable r = new RelatedOverrideable();
        Test.stopTest();
        
        System.assert(r != null);
    }
    
    @isTest
    static void relatedSObjectTest(){
        Test.startTest();
        RelatedOverrideable.RelatedSObject rs = new RelatedOverrideable.RelatedSObject('id', 'name', 'domain'); 
        Test.stopTest();
        
        System.assert(rs != null);
    }
}