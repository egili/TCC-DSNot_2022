public without sharing class CustomController {

    @AuraEnabled(cacheable=true)
    public static List<sObject> search(String searchTerm, String fieldApi, String myObject, String filter, String order) {
        
        if(String.isEmpty(filter)) {
            filter = '';
        }
        else {
            filter += ' AND';
        }

        String queryBase = 'SELECT {0} FROM {1} WHERE {2} {3} ORDER BY {4} {5} LIMIT 5';

        String queryFields = String.join(new List<String> {
            'Id',
            fieldApi
        }, ', ');

        String queryFilter = String.format(!String.isEmpty(searchTerm) ? '{0} LIKE \'%{1}%\'' : '{0} != NULL', new String[] { fieldApi, searchTerm });

        String query = String.format(queryBase, new String[] { queryFields, myObject, filter, queryFilter, fieldApi, order });

        System.debug(query);

        List<sObject> List = database.query(query);

        return List;
    }
}