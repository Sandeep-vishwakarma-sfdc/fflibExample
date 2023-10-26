/**
 * Created by user on 9/5/2023.
 */

@IsTest
public with sharing class ContactServiceTest {


    @IsTest
    static void getContacts(){
        //Given
        fflib_ApexMocks mocks =  new fflib_ApexMocks();
        ContactsSelector selector = new ContactsSelector();

        mocks.startStubbing();
            List<Contact> contacts = new List<Contact>();
            contacts.add(new Contact(FirstName='fname1',LastName='lname1'));
            contacts.add(new Contact(FirstName='fname2',LastName='lname2'));
            mocks.when(selector.getContacts()).thenReturnMulti(contacts);
        mocks.stopStubbing();

        ContactServiceImpl impl = new ContactServiceImpl();
        List<Contact> returnContacts = (List<Contact>) impl.getContacts();

        System.assertEquals(2,returnContacts.size());
    }

    @IsTest
    static void getAllContact(){
        Id ContactId = fflib_IDGenerator.generate(Contact.SObjectType);
        //Arrage
        fflib_ApexMocks mocks =  new fflib_ApexMocks();
        ContactsSelector mockselector = (ContactsSelector)mocks.mock(ContactsSelector.class);

        ContactServiceImpl serviceImpl = (ContactServiceImpl)mocks.mock(ContactServiceImpl.class);
        mocks.startStubbing();
        mocks.when(mockselector.getContacts()).thenReturn(new List<Contact>{new Contact(Id=ContactId,LastName='LastName'),new Contact(Id=ContactId,LastName='LastName2')});
        mocks.when(serviceImpl.getContacts()).thenReturn(new List<Contact>{new Contact(Id=ContactId,LastName='LastName'),new Contact(Id=ContactId,LastName='LastName2')});
        mocks.stopStubbing();

        Application.selector.setMock(mockselector);

        //Act
        Test.startTest();
        List<Contact> result = serviceImpl.getContacts();
        Test.stopTest();

        System.assertEquals(2, result.size(), 'Check that the record returned.');
    }


}