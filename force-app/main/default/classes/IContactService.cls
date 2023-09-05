/**
 * Created by user on 8/26/2023.
 */

public interface IContactService {
     List<Contact> getContacts();
     List<Contact> createContacts(List<Contact> contacts);
     List<Contact> updateContacts(List<Contact> contacts);
     List<Contact> deleteContacts(List<Contact> contacts);
}