public class ListHelper {

    public static Set<Id> convertStringListIntoSetIds ( List<String> baseList  ) {

        Set<Id> filtered = new Set<Id>();

        for ( String data : baseList  ) {
            filtered.add( data );
        }

        return filtered;
    }


    public static Set<Id> convertObjectListIntoSetIds ( List<SObject> baseList  ) {

        Set<Id> filtered = new Set<Id>();
        if (baseList == null  || baseList.isEmpty() ) return filtered;

        for ( SObject data : baseList  ) {
            if ( data.get('Id') == null ) continue;
            filtered.add( (Id) data.get('Id') );
        }

        return filtered;
    }



    public static List<String> convertObjectListIntoStringList ( String fieldNameForFilter
            , List<SObject> baseList  ) {

        Set<String> filtered = new Set<String>();
        if (baseList == null  || baseList.isEmpty() ) return new List<String>();

        for ( SObject data : baseList  ) {
            if ( data.get(fieldNameForFilter) == null ) continue;
            filtered.add( '' + data.get(fieldNameForFilter) );
        }
        List<String> result =  new List<String>();
        result.addAll (filtered);
        return result;
    }

    public static Map<String, SObject> indexListByField ( String fieldNameForFilter
            , List<SObject> baseList  ) {

        if (baseList == null  || baseList.isEmpty() ) return new Map<String, SObject>();

        String sObjectTypeString = String.valueOf(baseList[0].getSObjectType());

        Type sObjectType = Type.forName('Map<String,'+sObjectTypeString+'>');  

        Map<String,Sobject> values =(Map<String,Sobject>)sObjectType.newInstance();

        for ( SObject data : baseList  ) {

            String value =  '' + data.get(fieldNameForFilter);

            if ( value == null ) continue;

            values.put(value , data );
        }

        return values;
    }

    public static Map<String, List<SObject>> groupListByField ( String fieldNameForFilter
            , List<SObject> baseList  ) {

        if (baseList == null  || baseList.isEmpty() ) return null;

        Map<String, List<SObject>> values = new  Map<String, List<SObject>>();

        for ( SObject data : baseList  ) {

            String value = '' + data.get(fieldNameForFilter);

            if ( value  == null ) continue;

            if (values.get ( value ) == null) values.put (value , new List<SObject> ());

            values.get( value ).add (data);
        }

        return values;
    }

    public static Set<Id> convertObjectListIntoSetIds ( String fieldNameForFilter
            , List<SObject> baseList  ) {

        Set<Id> filtered = new Set<Id>();

        if (baseList == null  || baseList.isEmpty() ) return filtered;

        for ( SObject data : baseList  ) {
            if ( data.get(fieldNameForFilter) == null ) continue;
            filtered.add( (Id) data.get(fieldNameForFilter) );
        }

        return filtered;

    }
}