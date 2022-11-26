public with sharing class ProjetosLWCController {

    @AuraEnabled
    public static List<ProjetoVO> getDadosProjetos(String recordId){
     	List<ProjetoVO> listProjetoVO = new List<ProjetoVO>();
        List<Projeto__c> projetos = ProjetoDAO.get(recordId);

        for(Projeto__c proj: projetos){
            listProjetoVO.add(new ProjetoVO(proj.Id, proj.Name, proj.Descricao__c, proj.Atendidos__c, proj.DataInicioProjeto__c,
                                           proj.DataTerminoProjeto__c != null ? proj.DataTerminoProjeto__c : null, 
                                           proj.PeriodoProjeto__c != null ? proj.PeriodoProjeto__c : null,
                                           proj.StatusProjeto__c));
        }
        return listProjetoVO;
    }
}