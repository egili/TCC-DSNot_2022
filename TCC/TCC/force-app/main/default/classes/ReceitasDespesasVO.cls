public class ReceitasDespesasVO {

    public ReceitasDespesasVO(){}
    
    public ReceitasDespesasVO(String idReceita, String idDespesa, Decimal valorReceita, Decimal valorDespesa, String descricaoReceita, String descricaoDespesa, Date dataReceita, Date dataDespesa, String planilhaOrcamentaria){
        this.idReceita = idReceita;
        this.idDespesa = idDespesa;
        this.valorReceita = valorReceita;
        this.valorDespesa = valorDespesa;
        this.descricaoReceita = descricaoReceita;
        this.descricaoDespesa = descricaoDespesa;
        this.dataReceita = dataReceita;
        this.dataDespesa = dataDespesa;
        this.planilhaOrcamentaria = planilhaOrcamentaria;
    }
    
    public String descricaoReceita     {get; set;}
    public String descricaoDespesa 	   {get; set;}
    public Decimal valorDespesa 	   {get; set;}
    public Decimal valorReceita 	   {get; set;}
    public String idReceita 		   {get; set;}
    public String idDespesa            {get; set;}
    public Date dataDespesa 		   {get; set;}
    public Date dataReceita 		   {get; set;}
    public String planilhaOrcamentaria {get; set;}
}