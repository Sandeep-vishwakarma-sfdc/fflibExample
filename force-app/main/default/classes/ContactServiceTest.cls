/**
 * Created by user on 9/5/2023.
 */

@IsTest
public with sharing class ContactServiceTest {

    @IsTest
    static void getContacts(){
        fflib_ApexMocks mocks =  new fflib_ApexMocks();
        fflib_SObjectSelector selector = new ContactsSelector();
    }


}