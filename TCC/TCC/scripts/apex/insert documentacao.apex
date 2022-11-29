for(integer i = 0; i < 20; i++){
    insert new documentacao__c(TipoDocumentacao__c = 'Estatuto', DataEmissao__c = Date.newInstance(2022, Integer.valueof((Math.random() * 12)), Integer.valueof((Math.random() * 30))), name = 'doc ' + i);	
}

for(integer i = 200; i < 220; i++){
    insert new documentacao__c(TipoDocumentacao__c = 'Certidão Negativa de Débitos Federal (CND Federal)', DataEmissao__c = Date.newInstance(2022, Integer.valueof((Math.random() * 12)), Integer.valueof((Math.random() * 30))), name = 'doc ' + i);	
}

for(integer i = 221; i < 240; i++){
    insert new documentacao__c(TipoDocumentacao__c = 'Certidão Negativa de Débitos Estadual (CND Estadual)', DataEmissao__c = Date.newInstance(2022, Integer.valueof((Math.random() * 12)), Integer.valueof((Math.random() * 30))), name = 'doc ' + i);	
}

for(integer i = 241; i < 260; i++){
    insert new documentacao__c(TipoDocumentacao__c = 'Certidão Negativa de Débitos Municipal (CND Municipal)', DataEmissao__c = Date.newInstance(2022, Integer.valueof((Math.random() * 12)), Integer.valueof((Math.random() * 30))), name = 'doc ' + i);	
}

for(integer i = 261; i < 280; i++){
    insert new documentacao__c(TipoDocumentacao__c = 'Certificado de Regularidade Cadastral de Entidades – CRCE', DataEmissao__c = Date.newInstance(2022, Integer.valueof((Math.random() * 12)), Integer.valueof((Math.random() * 30))), name = 'doc ' + i);	
}

for(integer i = 281; i < 300; i++){
    insert new documentacao__c(TipoDocumentacao__c = 'Certificado de Registro Cadastral – CRC', DataEmissao__c = Date.newInstance(2022, Integer.valueof((Math.random() * 12)), Integer.valueof((Math.random() * 30))), name = 'doc ' + i);	
}