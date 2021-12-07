import { LightningElement } from 'lwc';

export default class PrivatepropertyDemo1 extends LightningElement {
    firstName = 'Shatrughna';
    lastName = 'Salunke';
    handleChange(event) {
        this.firstName = event.target.value
    }
    handleChnage1(event) {
        this.lastName = event.target.value
    }

}