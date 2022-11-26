public with sharing class DocumentacaoTriggerHandlerHelper {

    public static void setDataVencimentoDocumentacao(List<Documentacao__c> triggerNew){
        
        Documentacao__c triggerNewDoc = triggerNew.get(0);
        Documentacao__c docUpdate = [SELECT Id, DataEmissao__c, DataVencimento__c, TipoDocumentacao__c FROM Documentacao__c WHERE Id =: triggerNewDoc.Id LIMIT 1];
            
            Date dataEmissao = docUpdate.DataEmissao__c;
            
            switch on docUpdate.TipoDocumentacao__c {
                
                when 'Cartão do CNPJ'{
                    docUpdate.DataVencimento__c = dataEmissao.addDays(30);
                }
                when 'Ata de Eleição'{
                    docUpdate.DataVencimento__c = dataEmissao.addDays(40);
                }
                when 'Estatuto'{
                    docUpdate.DataVencimento__c = dataEmissao.addDays(180);
                }
                when 'Regimento Interno'{
                    docUpdate.DataVencimento__c = dataEmissao.addDays(180);
                }
                when 'CRCE'{
                    docUpdate.DataVencimento__c = dataEmissao.addDays(180);
                }
                when 'CRC'{
                    docUpdate.DataVencimento__c = dataEmissao.addDays(60);
                }
                when 'CND Federal'{
                    docUpdate.DataVencimento__c = dataEmissao.addDays(80);
                }
                when 'CND Estadual'{
                    docUpdate.DataVencimento__c = dataEmissao.addDays(100);
                }
                when 'CND Municipal'{
                    docUpdate.DataVencimento__c = dataEmissao.addDays(180);
                }
            }
        update docUpdate;
    }
    
    public static void preventAdditionWhenProjIsFinished(List<Documentacao__c> triggerNew){
    	Set<Id> idSet = new Set<Id>();

        if(triggerNew != null){
            for(Documentacao__c doc : triggerNew){
                if(doc.DocumentacaoProjeto__c != null)
                    idSet.add(doc.DocumentacaoProjeto__c);
          	}
    	}
        
        List<Projeto__c> projList = [SELECT Id, StatusProjeto__c FROM Projeto__c WHERE Id IN: idSet];
        Map<Id, String> idVsStatus = new map<Id, String>();
        
        for(Projeto__c proj : projList){
            if(!idVsStatus.containsKey(proj.Id))
                idVsStatus.put(proj.Id, proj.StatusProjeto__c);
        }
        
        for(Documentacao__c doc : triggerNew){
            if(idVsStatus.get(doc.DocumentacaoProjeto__c) == 'Finalizado' || idVsStatus.get(doc.DocumentacaoProjeto__c) == 'Cancelado')
                doc.addError('Não é possível adicionar uma Documentação com o Projeto no status atual');
        }
    }
}