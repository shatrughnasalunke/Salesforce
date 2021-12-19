import { LightningElement, wire, track } from 'lwc';
import getContacts from '@salesforce/apex/FetchContactData.getAllContacts'
export default class ContactView extends LightningElement {
    @track contacts;
    @track error;
    @wire(getContacts)
    wiredContacts({ error, data }) {
        if (data) {
            this.contacts = data;
        } else if (error) {
            console.log('Error--->' + error);
            this.error = error;
        }
    }
}