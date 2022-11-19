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
}