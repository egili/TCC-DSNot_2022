/**
 * classe responsavel por permitir a utilização de objetos relacionados em classes do tipo VO
 */ 

public with sharing virtual class RelatedOverrideable {
    
    @TestVisible
    protected RelatedOverrideable(){}

    public class RelatedSObject{
        
        @AuraEnabled public String idSObject   {get; set;}
        @AuraEnabled public String nameSObject {get; set;}
        @AuraEnabled public String urlSObject  {get; set;}
        
        public RelatedSObject(String idSObject, String nameSObject, String domain){
            this.idSObject   = idSObject;
            this.nameSObject = nameSObject;
            this.urlSObject  = domain + '/' + idSObject;
        }
    }
}