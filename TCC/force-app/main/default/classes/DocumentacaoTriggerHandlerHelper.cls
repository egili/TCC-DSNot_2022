public with sharing class DocumentacaoTriggerHandlerHelper {

    public static void setDataVencimentoDocumentacao(List<Documentacao__c> triggerNew){
        
        //List<Documentacao__c> listUpdate = new List<Documentacao__c>();
        
        Documentacao__c triggerNewDoc = triggerNew.get(0);
        Documentacao__c docUpdate = [SELECT Id FROM Documentacao__c WHERE Id =: triggerNewDoc.Id LIMIT 1];
        
        for(Documentacao__c doc: triggerNew){
            
            Date dataEmissao = doc.DataEmissao__c;
            
            switch on doc.Tipo__c {
                
                when 'Cartão do CNPJ'{
                    doc.DataVencimento__c = dataEmissao.addDays(30);
                    //listUpdate.add(doc);
                }
                when 'Ata de Eleição'{
                    doc.DataVencimento__c = dataEmissao.addDays(40);
                    //listUpdate.add(doc);
                }
                when 'Estatuto'{
                    doc.DataVencimento__c = dataEmissao.addDays(180);
                    //listUpdate.add(doc);
                }
                when 'Regimento Interno'{
                    doc.DataVencimento__c = dataEmissao.addDays(180);
                    //listUpdate.add(doc);
                }
                when 'CRCE'{
                    doc.DataVencimento__c = dataEmissao.addDays(180);
                // listUpdate.add(doc);
                }
                when 'CRC'{
                    doc.DataVencimento__c = dataEmissao.addDays(60);
                    //listUpdate.add(doc);
                }
                when 'CND Federal'{
                    doc.DataVencimento__c = dataEmissao.addDays(80);
                    //listUpdate.add(doc);
                }
                when 'CND Estadual'{
                    doc.DataVencimento__c = dataEmissao.addDays(100);
                    //listUpdate.add(doc);
                }
                when 'CND Municipal'{
                    doc.DataVencimento__c = dataEmissao.addDays(180);
                    //listUpdate.add(doc);
                }
            }
        }
        
         //update listUpdate;
    }
}