public with sharing class ReceitasTriggerHandlerHelper {
    
    public static void fillMonthField(List<Receitas__c> triggerNew){

        Integer mesReceita;
        
        List<Receitas__c> rList = [SELECT Id, Mes__c, DataReceita__c FROM Receitas__c WHERE Id IN: triggerNew];
        List<Receitas__c> rToUpdate = new List<Receitas__c>();

        for(Receitas__c receita : rList){
            mesReceita = receita.DataReceita__c.month();
            receita.Mes__c = mesReceita;

            rToUpdate.add(receita);
        }
        update rToUpdate;
    }
    
    public static void insertInFluxoCaixa(List<Receitas__c> triggerNew){
        FluxoCaixa__c fluxo = [SELECT Id FROM FluxoCaixa__c LIMIT 1];
        
        for(Receitas__c r : triggerNew){
			r.FluxoCaixa__c = fluxo.Id;
        }
    }
    
    public static void preventAdditionWhenProjIsFinished(List<Receitas__c> triggerNew){
    	Set<Id> idSet = new Set<Id>();

        if(triggerNew != null){
            for(Receitas__c r : triggerNew){
                if(r.ReceitasProjeto__c != null)
                    idSet.add(r.ReceitasProjeto__c);
          	}
    	}
        
        List<Projeto__c> projList = [SELECT Id, StatusProjeto__c FROM Projeto__c WHERE Id IN: idSet];
        Map<Id, String> idVsStatus = new map<Id, String>();
        
        for(Projeto__c proj : projList){
            if(!idVsStatus.containsKey(proj.Id))
                idVsStatus.put(proj.Id, proj.StatusProjeto__c);
        }
        
        for(Receitas__c r : triggerNew){
            if(idVsStatus.get(r.ReceitasProjeto__c) == 'Finalizado' || idVsStatus.get(r.ReceitasProjeto__c) == 'Cancelado')
                r.addError('Não é possível cadastrar uma nova Receita com o Projeto no status atual');
        }
    }
}