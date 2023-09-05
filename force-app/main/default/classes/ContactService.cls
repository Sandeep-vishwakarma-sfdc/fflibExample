/**
 * Created by user on 8/26/2023.
 */

public with sharing class ContactService{

    @AuraEnabled
    public static List<Contact> getAllContacts(){
        ContactServiceImpl serviceImp = (ContactServiceImpl)Application.service.newInstance(IContactService.class);
        return serviceImp.getContacts();
    }

    @AuraEnabled
    public static List<Contact> createContacts(String contacts){
        List<Contact> createContacts = (List<Contact>) JSON.deserialize(contacts,List<Contact>.class);
        ContactServiceImpl serviceImpl = (ContactServiceImpl)Application.service.newInstance(IContactService.class);
        return serviceImpl.createContacts(createContacts);
    }

    @AuraEnabled
    public static List<Contact> updateContacts(String contacts){
        List<Contact> updateContacts = (List<Contact>) JSON.deserialize(contacts,List<Contact>.class);
        ContactServiceImpl serviceImpl = (ContactServiceImpl)Application.service.newInstance(IContactService.class);
        return serviceImpl.updateContacts(updateContacts);
    }

    @AuraEnabled
    public static List<Contact> deleteContacts(String contacts){
        List<Contact> deleteContacts = (List<Contact>) JSON.deserialize(contacts,List<Contact>.class);
        ContactServiceImpl serviceImpl = (ContactServiceImpl)Application.service.newInstance(IContactService.class);
        return serviceImpl.deleteContacts(deleteContacts);
    }
}