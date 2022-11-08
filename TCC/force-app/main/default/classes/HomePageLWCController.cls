public with sharing class HomePageLWCController {

    @AuraEnabled(cacheable=true)
    public static Integer getNumberOfProjetos(){
        return [SELECT COUNT() FROM Projeto__c];
    }
    
    @AuraEnabled(cacheable=true)
    public static Integer getDocsToUpdate(){
        return [SELECT COUNT() FROM Documentacao__c WHERE Status__c != 'Atualizado'];
    }
    
    @AuraEnabled(cacheable=true)
    public static List<FluxoCaixaVO> getFluxoCaixaInfo(){
        String inutil = 'a';
        List<FluxoCaixa__c> fluxo = FluxoCaixaDAO.get(inutil);
        List<FluxoCaixaVO> ret = new List<FluxoCaixaVO>();
		String urlDomain = Url.getOrgDomainUrl().toExternalForm();
        
        for(FluxoCaixa__c f : fluxo)
            ret.add(new FluxoCaixaVO(f.Id, f.Name, urlDomain));
		
        return ret;
    }
}