for(integer i = 0; i < 20; i++){
    insert new documentacao__c(TipoDocumentacao__c = 'Estatuto', DataEmissao__c = Date.newInstance(2022, Integer.valueof((Math.random() * 12)), Integer.valueof((Math.random() * 30))), name = 'doc ' + i);	
}