public with sharing class ContactsSelector extends fflib_SObjectSelector{

    public ContactsSelector(){
        super(true,false,false,false);
    }

    public Schema.SObjectType getSObjectType(){
        return Contact.getSObjectType();
    }

    public List<Schema.SObjectField> getSObjectFieldList(){
        return new List<Schema.SObjectField>{
            Contact.Id,
            Contact.LastName,
            Contact.Name,
            Contact.Email,
            Contact.Phone,
            Contact.AccountId
        };
    }

    public override String getOrderBy(){
        return 'LastModifiedDate DESC';
    }


    public List<Contact> getContacts(){
        return Database.query(
                newQueryFactory().selectField(Contact.Title)
                        .selectField('AccountId.Name')
                        .setCondition('LastName !=null')
                        .setLimit(10)
                        .toSOQL()
        );
    }

}