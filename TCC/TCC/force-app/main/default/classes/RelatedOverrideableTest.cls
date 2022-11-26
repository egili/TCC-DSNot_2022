@isTest
private class RelatedOverrideableTest {

    @isTest
    static void defaultConstructorTest(){
        Test.startTest();
        RelatedOverrideable r = new RelatedOverrideable();
        Test.stopTest();
        
        Assert.isTrue(r != null);
    }
    
    @isTest
    static void relatedSObjectTest(){
        Test.startTest();
        RelatedOverrideable.RelatedSObject rs = new RelatedOverrideable.RelatedSObject('id', 'name', 'domain'); 
        Test.stopTest();
        
        Assert.isTrue(rs != null);
    }
}