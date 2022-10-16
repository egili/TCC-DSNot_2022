public with sharing class DespesasLWCController {

    @AuraEnabled
    public static List<DespesasVO> getDespesas(String recordId){
        List<Despesas__c> listDespesas = DespesasDAO.get(recordId);
        List<DespesasVO> listDespesasVO = new List<DespesasVO>();
        
        String urlDomain = Url.getOrgDomainUrl().toExternalForm();
        
        for(Despesas__c desp: listDespesas){
            listDespesasVO.add(new DespesasVO(desp.Id, desp.Descricao__c, desp.DataDespesa__c, desp.ValorDespesa__c,
            desp.DespesasPlanilhaOrcamentaria__c, desp.DespesasPlanilhaOrcamentaria__r.Name, desp.DespesasProjeto__c, desp.DespesasProjeto__r.Name, urlDomain));
        }
        return listDespesasVO;
    }
}