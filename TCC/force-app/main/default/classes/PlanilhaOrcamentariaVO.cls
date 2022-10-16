public with sharing class PlanilhaOrcamentariaVO extends RelatedOverrideable {

    public PlanilhaOrcamentariaVO(){}
    
    public PlanilhaOrcamentariaVO(String idPlanilha, String nomePlanilha, String descricao, String idProjeto, String planilhaProjeto, String domain){
        this.idPlanilha      = idPlanilha;
        this.nomePlanilha    = nomePlanilha;
        this.descricao       = descricao;
        this.planilhaProjeto = new RelatedSObject(idProjeto, planilhaProjeto, domain);
    }
    
    @AuraEnabled public String idPlanilha 			   {get; set;}
    @AuraEnabled public String nomePlanilha            {get; set;}
    @AuraEnabled public String descricao               {get; set;}
    @AuraEnabled public RelatedSObject planilhaProjeto {get; set;}
}