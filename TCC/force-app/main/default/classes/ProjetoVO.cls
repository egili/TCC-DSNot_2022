public with sharing class ProjetoVO {
    
    public ProjetoVO(){}
    
    public ProjetoVO(String idProjeto, String nomeProjeto, Date dataInicio, String atendidos, Decimal valor, String status){
        this.idProjeto 		= idProjeto;
        this.nomeProjeto 	= nomeProjeto;
        this.dataInicio     = dataInicio;
        this.atendidos 		= atendidos;
        this.valor 			= valor;
        this.status 		= status;
    }
    
    @AuraEnabled public String idProjeto   {get; set;}
    @AuraEnabled public String nomeProjeto {get; set;}
    @AuraEnabled public Date dataInicio    {get; set;}
    @AuraEnabled public String atendidos   {get; set;}
    @AuraEnabled public Decimal valor 	   {get; set;}
    @AuraEnabled public String status      {get; set;}
}