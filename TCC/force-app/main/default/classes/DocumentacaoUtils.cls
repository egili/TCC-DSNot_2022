public with sharing class DocumentacaoUtils {

    public static void updateStatus(List<Documentacao__c> listDoc){
        
        List<Documentacao__c> listDocUpdate = new List<Documentacao__c>();
        
        for(Documentacao__c doc : listDoc){
            
            Date dataVencimento = doc.DataVencimento__c;
            Integer diaVencimento = dataVencimento.day();
            Integer mesVencimento = dataVencimento.month();
            Integer anoVencimento = dataVencimento.year();
            
            Date dataAtual = System.today();
            Integer diaAtual = dataAtual.day();
            Integer mesAtual = dataAtual.month();
            Integer anoAtual = dataAtual.year();
            
            if(anoAtual < anoVencimento){
                doc.Status__c = 'Atualizado';    
                listDocUpdate.add(doc);
            }else if(anoAtual > anoVencimento){
                doc.Status__c = 'Desatualizado';    
                listDocUpdate.add(doc);
            }else if(dataAtual < dataVencimento && dataAtual.addDays(7) == dataVencimento){
                doc.Status__c = 'Próximo ao Vencimento';    
                listDocUpdate.add(doc);
            }else if(dataAtual < dataVencimento){
                doc.Status__c = 'Atualizado';    
                listDocUpdate.add(doc);
            }else if(dataAtual >= dataVencimento){
				doc.Status__c = 'Desatualizado';    
                listDocUpdate.add(doc);
            }
        }
        update listDocUpdate;
    }
}