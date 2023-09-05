/**
 * Created by user on 8/28/2023.
 */

trigger ContactTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    fflib_SObjectDomain.triggerHandler(Contacts.class);
}