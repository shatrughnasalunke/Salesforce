import { LightningElement } from 'lwc';

export default class PropertyDemo extends LightningElement {
    message = 'Shatrughna';
    handleChage(event) {
        // console.log(event.taregt.values);
        this.message = event.target.value;
        console.log('My name is ', this.message);

    }
}