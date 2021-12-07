import { LightningElement, wire, track } from 'lwc';
import getAllAccount from '@salesforce/apex/ViewUtiliyClass.getAllAccount'
export default class AccountView extends LightningElement {
    @track accounts;
    @track error;
    @wire(getAllAccount)
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = data;
        } else if (error) {
            console.log('Error--->' + error);
            this.error = error;
        }
    }
}