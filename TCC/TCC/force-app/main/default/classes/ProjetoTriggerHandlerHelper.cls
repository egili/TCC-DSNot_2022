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
}