/**
 * Created by user on 8/26/2023.
 */

public with sharing class UOWExample {

    public void objectCreator(){
        fflib_ISObjectUnitOfWork unitOfWork = Application.uow.newInstance();
        List<Contact> contacts = new List<Contact>{new Contact(FirstName='Hello',LastName='World')};
        List<Case> cases = new List<Case>{new Case(Subject='New Case',Status='New')};
        unitOfWork.registerNew(contacts);
        unitOfWork.registerNew(cases);
        unitOfWork.registerRelationship(cases[0],Case.ContactId,contacts[0]);

        unitOfWork.commitWork();
    }

}