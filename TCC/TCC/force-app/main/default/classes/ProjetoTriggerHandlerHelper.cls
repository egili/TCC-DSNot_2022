public without sharing class ProjetoTriggerHandlerHelper {

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
    
    public static void deleteRelatedPlanilha(Map<Id, Projeto__c> mapTriggerOld){
        List<PlanilhaOrcamentaria__c> listPlan = [SELECT Id, PlanilhaOrcamentariaProjeto__c FROM PlanilhaOrcamentaria__c WHERE PlanilhaOrcamentariaProjeto__c IN: mapTriggerOld.keySet()];
        system.debug('lllllld ' + listPlan);
        
        delete listPlan;
    }
}