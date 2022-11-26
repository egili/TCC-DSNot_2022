public with sharing class FluxoCaixaVO extends RelatedOverrideable {

    public FluxoCaixaVO(){}
    
    public FluxoCaixaVO(String idFluxoCaixa, String fluxoCaixa, String domain){
        this.idFluxoCaixa = idFluxoCaixa;
		this.fluxoCaixa   = new RelatedSObject(idFluxoCaixa, fluxoCaixa, domain);
    }
    
    @AuraEnabled public String idFluxoCaixa 	  {get; set;}
    @AuraEnabled public RelatedSObject fluxoCaixa {get; set;}
}