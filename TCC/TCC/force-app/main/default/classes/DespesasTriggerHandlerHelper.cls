public with sharing class DespesasTriggerHandlerHelper {
    
    public static void fillMonthField(List<Despesas__c> triggerNew){

        Integer mesReceita;
        
        List<Despesas__c> dList = [SELECT Id, Mes__c, DataDespesa__c FROM Despesas__c WHERE Id IN: triggerNew];
        List<Despesas__c> dToUpdate = new List<Despesas__c>();

        for(Despesas__c Despesa : dList){
            mesReceita = Despesa.DataDespesa__c.month();
            Despesa.Mes__c = mesReceita;

            dToUpdate.add(Despesa);
        }
        update dToUpdate;
    }
    
    public static void insertInFluxoCaixa(List<Despesas__c> triggerNew){
        FluxoCaixa__c fluxo = [SELECT Id FROM FluxoCaixa__c LIMIT 1];
        
        for(Despesas__c d : triggerNew){
			d.FluxoCaixa__c = fluxo.Id;
        }
    }
    
    public static void insertInPlanilhaOrcamentaria(List<Despesas__c> triggerNew){
        Id idProj = triggerNew.get(0).DespesasProjeto__c ;
        PlanilhaOrcamentaria__c po = [SELECT Id, PlanilhaOrcamentariaProjeto__c FROM PlanilhaOrcamentaria__c WHERE PlanilhaOrcamentariaProjeto__c =: idProj LIMIT 1];
        for(Despesas__c d : triggerNew){
            if(d.DespesasProjeto__c != null){
                d.DespesasPlanilhaOrcamentaria__c = po.Id;
            }
        }
    }
    
     public static void preventAdditionWhenProjIsFinished(List<Despesas__c> triggerNew){
    	Set<Id> idSet = new Set<Id>();

        if(triggerNew != null){
            for(Despesas__c desp : triggerNew){
                if(desp.DespesasProjeto__c != null)
                    idSet.add(desp.DespesasProjeto__c);
          	}
    	}
        
        List<Projeto__c> projList = [SELECT Id, StatusProjeto__c FROM Projeto__c WHERE Id IN: idSet];
        Map<Id, String> idVsStatus = new map<Id, String>();
        
        for(Projeto__c proj : projList){
            if(!idVsStatus.containsKey(proj.Id))
                idVsStatus.put(proj.Id, proj.StatusProjeto__c);
        }
        
        for(Despesas__c desp : triggerNew){
            if(idVsStatus.get(desp.DespesasProjeto__c) == 'Finalizado' || idVsStatus.get(desp.DespesasProjeto__c) == 'Cancelado')
                desp.addError('Não é possível cadastrar uma nova Despesa com o Projeto no status atual');
        }
    }
}