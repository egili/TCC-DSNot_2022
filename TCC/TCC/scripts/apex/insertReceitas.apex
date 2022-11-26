for(integer i = 0; i < 100; i++){
    insert new Receitas__c(Fonte__c='fonte ' + i, ValorReceita__c = 10.0, DataReceita__c = Date.newInstance(2022, Integer.valueof((Math.random() * 12)), Integer.valueof((Math.random() * 30))));
}