import { LightningElement, api } from 'lwc';

export default class GetterSetterExample extends LightningElement {

    @api message;
    get getName() {
            alert('getName method executed');
            this.message = 'Shatrughna Salunke';
        }
        /**
         * @param {string} value
         */
    set setName(value) {
        alert('new Values' + value);
        this.nessage = value.toUpperCase();
    }
}