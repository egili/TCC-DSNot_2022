public with sharing class ReceitasVO extends RelatedOverrideable {

    public ReceitasVO(){}
    
    public ReceitasVO(String idReceita, Date dataReceita, String fonte, String descricao, Decimal valor, String idProjeto, String receitaProjeto, String idPlanilha, String receitaPlanilha, String domain){
        
        this.idReceita = idReceita;
        this.dataReceita = dataReceita;
        this.fonte = fonte;
        this.descricao = descricao;
        this.valor = valor;
        this.projeto = new RelatedSObject(idProjeto, receitaProjeto, domain);
        this.planilhaOrcamentaria = new RelatedSObject(idPlanilha, receitaPlanilha, domain);
    }
    
    @AuraEnabled public String idReceita 					{get; set;}
    @AuraEnabled public Date dataReceita 					{get; set;}
    @AuraEnabled public String fonte 						{get; set;}
    @AuraEnabled public String descricao 					{get; set;}
    @AuraEnabled public Decimal valor						{get; set;}
    @AuraEnabled public RelatedSObject projeto 				{get; set;}
    @AuraEnabled public RelatedSObject planilhaOrcamentaria {get; set;}
}