public with sharing class HomePageLWCController {

    @AuraEnabled(cacheable=true)
    public static Integer getNumberOfProjetos(){
        return [SELECT COUNT() FROM Projeto__c WHERE StatusProjeto__c = 'Aguardando Resposta' OR StatusProjeto__c = 'Aprovado'];
    }
    
    @AuraEnabled(cacheable=true)
    public static Integer getDocsToUpdate(){
        return [SELECT COUNT() FROM Documentacao__c WHERE Status__c != 'Atualizado'];
    }
    
    @AuraEnabled(cacheable=true)
    public static List<FluxoCaixaVO> getFluxoCaixaInfo(){
        List<FluxoCaixa__c> fluxo = FluxoCaixaDAO.get('a');
        List<FluxoCaixaVO> ret = new List<FluxoCaixaVO>();
		String urlDomain = Url.getOrgDomainUrl().toExternalForm();
        String fluxoCaixaUrl = 'https://cotuca-d-dev-ed.builder.salesforce-communities.com/sfsites/picasso/core/config/commeditor.jsp?exitURL=https%3A%2F%2Fcotuca-d-dev-ed.my.salesforce.com%2Fservlet%2Fnetworks%2Fswitch%3FnetworkId%3D0DB8c0000008aY1%26startURL%3D%252FcommunitySetup%252FcwApp.app%2523%252Fc%252Fhome';
        
        for(FluxoCaixa__c f : fluxo)
            ret.add(new FluxoCaixaVO(f.Id, f.Name, urlDomain));
		
        return ret;
    }
}