public with sharing virtual class RelatedOverrideable {
    
    protected RelatedOverrideable(){}

    public class RelatedSObject{
        
        @AuraEnabled public Id idSObject	   {get; set;}
        @AuraEnabled public String nameSObject {get; set;}
        @AuraEnabled public String urlSObject  {get; set;}
        
        public RelatedSObject(Id idSObject, String nameSObject, String domain){
            this.idSObject   = idSObject;
            this.nameSObject = nameSObject;
            this.urlSObject  = domain + '/' + idSObject;
        }
    }
}