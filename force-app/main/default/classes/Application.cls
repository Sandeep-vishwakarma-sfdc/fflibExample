/**
 * Created by user on 8/26/2023.
 */

public with sharing class Application {

    public static final fflib_Application.UnitOfWorkFactory uow = new fflib_Application.UnitOfWorkFactory(new List<SObjectType>{
            Account.SObjectType,
            Contact.SObjectType,
            Case.SObjectType,
            Task.SObjectType
    });

    public static final fflib_Application.ServiceFactory service = new fflib_Application.ServiceFactory(new Map<Type,Type>{
            IContactService.class=>ContactServiceImpl.class
    });

    public static final fflib_Application.SelectorFactory selector = new fflib_Application.SelectorFactory(new Map<SObjectType,Type>{
            Contact.SObjectType => ContactsSelector.class
    });

    public static final fflib_Application.DomainFactory domain = new fflib_Application.DomainFactory(selector,new Map<SObjectType,Type>{
            Contact.SObjectType => Contacts.class
    });
}

