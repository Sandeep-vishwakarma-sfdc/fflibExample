/**
 * Created by user on 8/30/2023.
 */

public with sharing class CustomLookup {
    @AuraEnabled(cacheable=true)
    public static list<sObject> searchLookupData(string searchKey , string sObjectApiName) {
        List < sObject > returnList = new List < sObject > ();
        string sWildCardText = '%' + searchKey + '%';
        string sQuery = 'Select Id,Name From ' + sObjectApiName + ' Where Name Like : sWildCardText order by createdDate DESC LIMIT 5';
        for (sObject obj: database.query(sQuery)) {
            returnList.add(obj);
        }
        return returnList;
    }

    // Method to fetch lookup default value
    @AuraEnabled
    public static sObject searchDefaultRecord(string recordId , string sObjectApiName) {
        string sRecId = recordId;
        string sQuery = 'Select Id,Name From ' + sObjectApiName + ' Where Id = : sRecId LIMIT 1';
        for (sObject obj: database.query(sQuery)) {
            return obj;
        }
        return null;
    }
}