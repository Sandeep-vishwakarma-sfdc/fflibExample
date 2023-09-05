/**
 * Created by user on 8/28/2023.
 */

public with sharing class Contacts extends fflib_SObjectDomain{

    public Contacts(List<Contact> records){
        super(records);
    }

    public override void onBeforeInsert(){
        System.debug('Before Inserting Contact');
    }

    public override void onBeforeUpdate(Map<Id,SObject> existingRecords){
        System.debug('Existing Records '+existingRecords);
    }

    public override void onAfterInsert(){
        System.debug('After Insert Send Email');
    }

    public class Constructor implements fflib_SObjectDomain.IConstructable {

        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new Contacts(sObjectList);
        }
    }
}