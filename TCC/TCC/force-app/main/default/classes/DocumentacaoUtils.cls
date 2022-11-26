public with sharing class DocumentacaoUtils {

    public static void updateStatus(Map<Id, Documentacao__c> mapDoc){
        
        List<Documentacao__c> listDocUpdate = new List<Documentacao__c>();
        
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
        update listDocUpdate;
    }
}