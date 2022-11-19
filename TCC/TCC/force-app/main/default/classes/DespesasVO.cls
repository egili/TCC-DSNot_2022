public with sharing class DespesasVO extends RelatedOverrideable {

    public DespesasVO(){}
    
    public DespesasVO(String idDespesa, String descricao, Date dataDespesa, Decimal valorDespesa, String idPlanilha, String despesaPlanilhaOrcamentaria, String idProjeto, String despesaProjeto, String domain){
        this.idDespesa = idDespesa;
        this.descricao = descricao;
        this.dataDespesa = dataDespesa;
        this.valorDespesa = valorDespesa;
        this.planilhaOrcamentaria = new RelatedSObject(idPlanilha, despesaPlanilhaOrcamentaria, domain);
        this.projeto = new RelatedSObject(idProjeto, despesaProjeto, domain);
    }
    
    @AuraEnabled public String idDespesa 					{get; set;}
    @AuraEnabled public String descricao 					{get; set;}
    @AuraEnabled public Date dataDespesa 					{get; set;}
    @AuraEnabled public Decimal valorDespesa 				{get; set;}
    @AuraEnabled public RelatedSObject planilhaOrcamentaria {get; set;}
    @AuraEnabled public RelatedSObject projeto   			{get; set;}
}