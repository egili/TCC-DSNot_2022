/*
 * classe responsável por gerar dados para as classes de teste 
 */

@isTest
public class TestDataFactory {

    public static Documentacao__c makeDocumentacao(){
        Projeto__c proj = new Projeto__c();
        proj.DataInicioProjeto__c = System.today() - 1;
        insert proj;
        
        Documentacao__c doc = new Documentacao__c();
        doc.Tipo__c = 'Estatuto';
        doc.DataEmissao__c = System.today();
        doc.NomeOSC__c = 'osc';
        doc.DocumentacaoProjeto__c = proj.Id;
        doc.Name = 'teste';
        doc.Status__c = 'Atualizado';
        doc.DataVencimento__c = System.today() + 30;
        
        return doc;
    }
    
    public static Documentacao__c makeDocumentacao(Projeto__c proj){
        Documentacao__c doc = new Documentacao__c();
        doc.Tipo__c = 'Estatuto';
        doc.DataEmissao__c = System.today();
        doc.NomeOSC__c = 'osc';
        doc.DocumentacaoProjeto__c = proj.Id;
        doc.Name = 'teste';
        doc.Status__c = 'Atualizado';
        doc.DataVencimento__c = System.today() + 30;
        
        return doc;
    }
}