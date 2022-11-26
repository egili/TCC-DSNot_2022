for(integer i = 0; i < 100; i++){
    insert new Despesas__c(Descricao__c='desc ' + i, ValorDespesa__c = 10.0, DataDespesa__c = Date.newInstance(2022, Integer.valueof((Math.random() * 12)), Integer.valueof((Math.random() * 30))));
}