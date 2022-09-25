@isTest
private class DocumentacaoSchedulerTest {
    
    public static String scheduleDaily = '0 0 1 * * ?'; 

	@isTest
    static void executeTest(){
        
        Date currentDate = System.today();

        Documentacao__c doc = TestDataFactory.makeDocumentacao();
        insert doc;
        
        doc.DataVencimento__c = currentDate + 1;
        update doc;
        
        Test.startTest();
        String jobId = System.schedule('schedule for updating doc status', scheduleDaily, new DocumentacaoScheduler());
        Test.stopTest();
        
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
    }
}