public with sharing class PlanilhaOrcamentariaLWCController {

    @AuraEnabled
    public static List<PlanilhaOrcamentariaVO> getPlanilha(String recordId){
        List<PlanilhaOrcamentaria__c>  listPlanilhas = PlanilhaOrcamentariaDAO.get(recordId);
        List<PlanilhaOrcamentariaVO> listPlanVO = new List<PlanilhaOrcamentariaVO>();
        
        String urlDomain = Url.getOrgDomainUrl().toExternalForm();

        for(PlanilhaOrcamentaria__c plan: listPlanilhas){
            listPlanVO.add(new PlanilhaOrcamentariaVO(plan.Id, plan.Name, plan.Descricao__c, plan.PlanilhaOrcamentariaProjeto__c, plan.PlanilhaOrcamentariaProjeto__r.Name, urlDomain));
        }
        return listPlanVO;
    }
}