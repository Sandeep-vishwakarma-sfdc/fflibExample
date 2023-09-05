import { LightningElement } from 'lwc';
import {showToast,getContacts,showModel,updateContact,deleteContact} from './helper'

export default class CrudCmp extends LightningElement {
    contacts = [];
    editModel = false;
    editContact = {
        Id:'',
        Name:'',
        Email:'',
        Phone:'',
        AccountId:'',
        Account:{
            Id:'',
            Name:''
        }
    }
    async connectedCallback(){
        this.contacts =  await getContacts();
        console.log('Contacts ',this.contacts);
    }

    handleEditContact(event){
        try{
            showModel(this,true);
            let index = this.contacts.findIndex(ele=>ele.Id == event.target.dataset.id);
            this.editContact = this.contacts[index];
        }catch(err){
            console.log('Error ',err.message);
        }
    }
    handleLookupSelection(event){
        if(event.detail.selectedRecord != undefined){
            console.log('Selected Record Value on Parent Component is ' +JSON.stringify(event.detail.selectedRecord));
            this.editContact.Account.Id = event.detail.selectedRecord.Id;
            this.editContact.Account.Name = event.detail.selectedRecord.Name;
            this.editContact.AccountId = event.detail.selectedRecord.Id;
        }
    }
    async handleDeleteContact(event){
        try{
            let index = this.contacts.findIndex(ele=>ele.Id == event.target.dataset.id);
            let deleteCon = this.contacts[index];
            console.log('Delete Contact ',deleteCon);
            let deleted = await deleteContact(deleteCon);
            console.log('deleted  '+deleted)
        }catch(err){
            console.log('Error ',err);
        }
    }

    async handleSaveModal(){
        try{
        showModel(this,false);
        let result = await updateContact(this,this.editContact);
        let index = this.contacts.findIndex(ele=>ele.Id==result[0].Id);
        this.contacts[index].AccountId = result[0].Id;
        this.contacts[index].Account.Id = result[0].Account.Id;
        this.contacts[index].Account.Name = result[0].Account.Name;
        this.contacts = JSON.parse(JSON.stringify(this.contacts));
        console.log('updated');
        }catch(err){
            console.log('Error ',err.message);
        }
    }

    handleAddContact(){
        showModel(this,true);

    }

    handleCloseModal(){
        showModel(this,false);
    }

}