import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getAllContacts from '@salesforce/apex/ContactService.getAllContacts';
import updateContacts from '@salesforce/apex/ContactService.updateContacts';
import deleteContacts from '@salesforce/apex/ContactService.deleteContacts';

export function showToast(component) {
    const event = new ShowToastEvent({
        title: 'Toast message',
        message: 'Toast Message',
        variant: 'success',
        mode: 'dismissable'
    });
    component.dispatchEvent(event);
}

export async function getContacts(){
    try{
        let result = await getAllContacts();
        result = result.map(ele=>{
            ele.Account = {
                Id: ele.AccountId?ele.Account.Id:'',
                Name: ele.AccountId?ele.Account.Name:''
            }
            return ele;
        });
        return JSON.parse(JSON.stringify(result));
    }catch(err){
        return JSON.parse(JSON.stringify(err));
    }
}

export function showModel(component,show){
    const model = component.template.querySelector('c-model');
    show?model.show():model.hide();
}

export async function updateContact(component,updateContact){
    try{
        updateContact.Name = component.refs.name.value;
        updateContact.Email = component.refs.email.value;
        updateContact.phone = component.refs.phone.value;
        let contacts = [updateContact];
        let result = await updateContacts({contacts:JSON.stringify(contacts)});
        return result;
    }catch(err){
        console.log('Error ',err);
    }
}

export async function deleteContact(deleteContact){
    try{
        let contacts = [deleteContact];
        let result = await deleteContacts({contacts:JSON.stringify(contacts)});
        console.log('result ',result);
        return result;
    }catch(err){
            console.log('Error ',JSON.stringify(err));
    }
}