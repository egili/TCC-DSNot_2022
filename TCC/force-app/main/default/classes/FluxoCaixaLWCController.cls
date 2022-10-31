public with sharing class FluxoCaixaLWCController {
    
    @AuraEnabled(cacheable=false)
    public static Decimal getTotalReceitas(Decimal mes){
        List<Receitas__c> receitasList = ReceitasDAO.getAllByMonth(mes);
        Decimal ret = 0;
        
        for(Receitas__c r: receitasList){
            ret += r.ValorReceita__c;
            system.debug('ret ' + ret);
        }
        return ret;
    }
    
    @AuraEnabled(cacheable=false)
    public static Decimal getTotalDespesas(Decimal mes){
        List<Despesas__c> despesasList = DespesasDAO.getAllByMonth(mes);
        Decimal ret = 0;
        
        for(Despesas__c d: despesasList){
            ret += d.ValorDespesa__c;
            system.debug('ret ' + ret);
        }
        return ret;
    }
    
    @AuraEnabled 
    public static Decimal getSaldoAnual(){
        return getTotalReceitasAnual() - getTotalDespesasAnual() < 0 ? - ( getTotalReceitasAnual() - getTotalDespesasAnual()) :  getTotalReceitasAnual() - getTotalDespesasAnual();
    }
    
    @AuraEnabled 
    public static Decimal getTotalReceitasAnual(){
        
	    List<Receitas__c> rList = ReceitasDAO.getAll();        
        Decimal totalReceitas = 0;
        
        for(Receitas__c r : rList){
            totalReceitas += r.ValorReceita__c;
            system.debug('total receitas ' + totalReceitas);
        }
        return totalReceitas;
    }
    
    @AuraEnabled 
    public static Decimal getTotalDespesasAnual(){
        
	    List<Despesas__c> dList = DespesasDAO.getAll();
        Decimal totalDespesas = 0;
        
        for(Despesas__c d : dList){
            totalDespesas += d.ValorDespesa__c;
            system.debug('totalDespesas ' + totalDespesas);
        }
        return totalDespesas;
    }
    
    
}