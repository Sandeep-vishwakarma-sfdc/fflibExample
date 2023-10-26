/**
 * Created by user on 8/26/2023.
 */

public with sharing class ContactServiceImpl implements IContactService {

    public List<Contact> getContacts() {
        fflib_ISObjectSelector selector =  Application.selector.newInstance(Contact.SObjectType);
        ContactsSelector selectorObj = (ContactsSelector)selector;
        return selectorObj.getContacts();
    }

    public List<Contact> createContacts(List<Contact> contacts) {
        fflib_ISObjectUnitOfWork unitofWork = Application.uow.newInstance();
        unitofWork.registerNew(contacts);

        unitofWork.commitWork();
        return contacts;
    }

    public List<Contact> updateContacts(List<Contact> contacts) {
        fflib_ISObjectUnitOfWork unitofWork = Application.uow.newInstance();
        unitofWork.registerDirty(contacts);
        unitofWork.commitWork();
        return contacts;
    }

    public List<Contact> deleteContacts(List<Contact> contacts) {
        fflib_ISObjectUnitOfWork unitofWork = Application.uow.newInstance();
        unitofWork.registerDeleted(contacts);
        unitofWork.commitWork();
        return contacts;
    }

}