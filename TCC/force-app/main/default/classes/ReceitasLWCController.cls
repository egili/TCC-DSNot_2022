public with sharing class ReceitasLWCController {

    @AuraEnabled 
    public static List<ReceitasVO> getReceita(String recordId){
        List<Receitas__c> listReceitas = ReceitasDAO.get(recordId);
        List<ReceitasVO> listReceitaVO = new List<ReceitasVO>();
        
        String urlDomain = Url.getOrgDomainUrl().toExternalForm();

        
        for(Receitas__c r : listReceitas){
            listReceitaVO.add(new ReceitasVO(r.Id, r.DataReceita__c, r.Fonte__c, r.Name, r.ValorReceita__c, r.ReceitasProjeto__c,
                                             r.ReceitasProjeto__r.Name, r.ReceitaPlanilhaOrcamentaria__c, r.ReceitaPlanilhaOrcamentaria__r.Name, urlDomain));
        }
        return listReceitaVO;
    }
}