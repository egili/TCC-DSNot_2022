public with sharing class ProjetosLWCController {

    @AuraEnabled
    public static List<ProjetoVO> getDadosProjetos(String recordId){
     	List<ProjetoVO> listProjetoVO = new List<ProjetoVO>();
        
        List<Projeto__c> projetos = ProjetoDAO.getProjetos(recordId);
        
        return listProjetoVO;
    }
}