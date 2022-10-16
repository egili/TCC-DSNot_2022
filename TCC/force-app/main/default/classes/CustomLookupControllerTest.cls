@isTest
private class CustomLookupControllerTest {

    @isTest
    static void testOne(){
        Test.startTest();
        CustomLookupController.search('test', 'Owner.Name', 'Account', '', 'ASC');
        CustomLookupController.search('test', 'Owner.Name', 'Account', 'Name = \'Test\'', 'ASC');
        CustomLookupController.search('', 'Owner.Name', 'Account', '', 'ASC');
        Test.stopTest();
    }
}