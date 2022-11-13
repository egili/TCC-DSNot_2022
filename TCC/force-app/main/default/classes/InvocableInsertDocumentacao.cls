public with sharing class InvocableInsertDocumentacao {
    
    static Output o = new Output();

    @InvocableMethod
    public static List<Output> insertDocumentacao(List<Input> flowInputs){
        Input i = flowInputs.get(0);
        
        Documentacao__c d = new Documentacao__c(Name = i.descricaoDocumentacao, 
                                           	   DataEmissao__c = i.dataEmissao,
                                               DataVencimento__c = i.dataVencimento,
                                               Tipo__c = i.tipo,
                                               OutroTipoDocumentacao__c = i.descricaoOutro,
                                               DocumentacaoProjeto__c = i.projetoRelacionado);
        insert d;
        
        o.idNewDocumentacao = d.Id;
        
        return new List<Output>{o};
    }
    
    public static String getId(){
        return o.idNewDocumentacao;
    }
    
    public class Input{
        @InvocableVariable
        public String descricaoDocumentacao;
        
        @InvocableVariable
        public Date dataEmissao;
        
        @InvocableVariable
        public Date dataVencimento;
        
        @InvocableVariable
        public String tipo;
        
        @InvocableVariable
        public String descricaoOutro;
        
        @InvocableVariable
        public String projetoRelacionado;
    }
    
    public class Output{
        @InvocableVariable
        public String idNewDocumentacao;
    }
}