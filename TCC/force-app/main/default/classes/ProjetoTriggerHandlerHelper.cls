public with sharing class ProjetoTriggerHandlerHelper {

    public static void insertRelatedPlanilhaInProjeto(List<Projeto__c> triggerNew){
        PlanilhaOrcamentaria__c planilhaProjeto = new PlanilhaOrcamentaria__c();
     
        for(Projeto__c proj: triggerNew){
            planilhaProjeto.PlanilhaOrcamentariaProjeto__c = proj.Id;
            planilhaProjeto.Name = 'Planilha Orçamentária do Projeto ' + proj.Name;
            
            if(proj.Descricao__c != null)
                planilhaProjeto.Descricao__c = 'Descrição da Planilha Orçamentária com base em ' + proj.Descricao__c;
        }
        
        try{
             Database.insert(planilhaProjeto);
        }catch(Exception e){
            system.debug(e.getMessage() + ' ' + e.getTypeName());
        }
    }
    
    /*public static void preventMoreThanOnePlanilhaAdded(Map<Id, Projeto__c> mapTriggerNew){
        Set<Id> idsProjeto = mapTriggerNew.keySet();
       
        List<PlanilhaOrcamentaria__c> planilhas = [SELECT Id, PlanilhaOrcamentariaProjeto__c FROM PlanilhaOrcamentaria__c WHERE PlanilhaOrcamentariaProjeto__c IN : idsProjeto];
        
        for(Projeto__c proj: mapTriggerNew.values()){
            if(planilhas.size() == 1)
            	proj.addError('Um Projeto não pode ter mais de uma Planilha Orçamentária');
        }
    }*/
}