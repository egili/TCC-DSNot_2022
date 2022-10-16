public with sharing class PlanilhaOrcamentariaVO extends RelatedOverrideable {

    public PlanilhaOrcamentariaVO(){}
    
    public PlanilhaOrcamentariaVO(Id idPlanilha, String nomePlanilha, String descricao, Id idProjeto, String planilhaProjeto, String domain){
        this.idPlanilha      = idPlanilha;
        this.nomePlanilha    = nomePlanilha;
        this.descricao       = descricao;
        this.planilhaProjeto = new RelatedSObject(idProjeto, planilhaProjeto, domain);
    }
    
    @AuraEnabled public Id idPlanilha 				   {get; set;}
    @AuraEnabled public String nomePlanilha            {get; set;}
    @AuraEnabled public String descricao               {get; set;}
    @AuraEnabled public RelatedSObject planilhaProjeto {get; set;}
}