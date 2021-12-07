import { LightningElement } from 'lwc';

export default class PrivatePropertyDemo2 extends LightningElement {

    firstName = 'FirstName';
    lastName = 'lastName';
    age = '20';
    address = 'malinagar';
    pincCode = '413109';

    handleChange1(event) {
        this.firstName = event.target.value
    }
    handleChnage2(event) {
        this.lastName = event.target.value
    }
    handleChange3(event) {
        this.age = event.target.value
    }
    handleChange4(event) {
        this.address = event.target.value
    }
    handleChange5(event) {
        this.pincCode = event.target.value
    }

}