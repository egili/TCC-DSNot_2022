global with sharing class DocumentacaoScheduler implements Schedulable {
    
    public static String scheduleDaily = '0 0 1 * * ?'; // roda todo dia uma da manhã

    global void execute(SchedulableContext SC){
        Map<Id, Documentacao__c> mapDoc = new Map<Id, Documentacao__c>([SELECT Id, DataEmissao__c, DataVencimento__c, Status__c FROM Documentacao__c]);
        List<Documentacao__c> listDocUpdate = new List<Documentacao__c>();

        if(!mapDoc.isEmpty()){
			for(Documentacao__c doc : mapDoc.values()){            
                Date dataAtual = System.today();
                if(dataAtual < doc.DataVencimento__c && dataAtual.addDays(7) == doc.DataVencimento__c){
                    doc.Status__c = 'Próximo ao Vencimento';    
                    listDocUpdate.add(doc);
                }
                else if(dataAtual < doc.DataVencimento__c){
                    doc.Status__c = 'Atualizado';    
                    listDocUpdate.add(doc);
                }
                else if(dataAtual >= doc.DataVencimento__c){
                    doc.Status__c = 'Desatualizado';    
                    listDocUpdate.add(doc);
                } 
            }
        }
        update listDocUpdate;       
    }
}