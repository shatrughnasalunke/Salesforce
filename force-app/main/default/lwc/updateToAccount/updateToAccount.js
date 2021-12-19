import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class AccountEditPage extends LightningElement {

    @api recordId;

    handleSuccess(event) {

        const toastEvent = new ShowToastEvent({
            title: 'Account Updated',
            message: 'Account Updated Successfully!!!',
            variant: 'success'
        });
        this.dispatchEvent(toastEvent);
        x
    }

}