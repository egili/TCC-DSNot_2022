public with sharing class ProjetoVO {
    
    public ProjetoVO(){}
    
    public ProjetoVO(String idProjeto, String nomeProjeto, Date periodoProjeto, String acoesProjeto, String atendidos, Decimal valor){
        this.idProjeto 		= idProjeto;
        this.nomeProjeto 	= nomeProjeto;
        this.periodoProjeto = periodoProjeto;
        this.acoesProjeto 	= acoesProjeto;
        this.atendidos 		= atendidos;
        this.valor 			= valor;
    }
    
    @AuraEnabled public String idProjeto 	{get; set;}
    @AuraEnabled public String nomeProjeto  {get; set;}
    @AuraEnabled public Date periodoProjeto {get; set;}
    @AuraEnabled public String acoesProjeto {get; set;}
    @AuraEnabled public String atendidos    {get; set;}
    @AuraEnabled public Decimal valor 		{get; set;}
}