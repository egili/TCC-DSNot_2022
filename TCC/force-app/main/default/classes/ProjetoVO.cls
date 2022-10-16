public with sharing class ProjetoVO{
    
    public ProjetoVO(){}
    
    public ProjetoVO(String idProjeto, String nomeProjeto, String descricao, Decimal atendidos, Date dataInicio, Date dataTermino, Date periodo, String status){
        this.idProjeto   = idProjeto;
        this.nomeProjeto = nomeProjeto;
        this.descricao   = descricao;
        this.atendidos   = atendidos;
        this.dataInicio  = dataInicio;
        this.dataTermino = dataTermino;
        this.periodo     = periodo;
        this.status      = status;
    }
    
    @AuraEnabled public String idProjeto   {get; set;}
    @AuraEnabled public String nomeProjeto {get; set;}
    @AuraEnabled public String descricao   {get; set;}
    @AuraEnabled public Decimal atendidos  {get; set;}
    @AuraEnabled public Date dataInicio    {get; set;}
    @AuraEnabled public Date dataTermino   {get; set;}
    @AuraEnabled public Date periodo       {get; set;}
    @AuraEnabled public String status      {get; set;}
}