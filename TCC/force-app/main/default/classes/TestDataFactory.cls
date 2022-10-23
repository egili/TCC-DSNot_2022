/*
 * classe responsável por gerar dados para as classes de teste 
 */

@isTest
public class TestDataFactory {
    
    public static Projeto__c makeProjeto(){
        return new Projeto__c(DataInicioProjeto__c = System.today() - 1, Name = 'projeto');
    }
    
    public static PlanilhaOrcamentaria__c makePlanilhaOrcamentaria(){
        Projeto__c proj = makeProjeto();
        insert proj;
        
        return new PlanilhaOrcamentaria__c(PlanilhaOrcamentariaProjeto__c = proj.Id);
    }

    public static Documentacao__c makeDocumentacao(){
        Projeto__c proj = makeProjeto();
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
    
    public static Receitas__c makeReceita(){
        PlanilhaOrcamentaria__c plan = makePlanilhaOrcamentaria();
        insert plan;
        
        Receitas__c r = new Receitas__c();
        r.Fonte__c = 'Fonte';
        r.DataReceita__c = System.today() - 2;
        r.ValorReceita__c = 10.0;
        r.ReceitaPlanilhaOrcamentaria__c = plan.Id;
        
        return r;
    }
    
    public static Despesas__c makeDespesa(){
        PlanilhaOrcamentaria__c plan = makePlanilhaOrcamentaria();
        insert plan;
        
        Despesas__c desp = new Despesas__c();
        desp.ValorDespesa__c = 10.0;
        desp.DespesasPlanilhaOrcamentaria__c = plan.Id;
        desp.DataDespesa__c = System.today() - 1;
        
        return desp;
    }
}