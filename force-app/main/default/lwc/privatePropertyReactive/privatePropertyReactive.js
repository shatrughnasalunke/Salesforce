import { LightningElement, track } from 'lwc';
export default class PrivatePropertyReactive extends LightningElement {

    @track message1;
    @track message2;
    @track message3;
    @track message4;

    handleChange() {
        this.message1 = 'Shatrughna';
        this.message2 = 'Salunke';
        this.message3 = '27';
        this.message4 = 'Malinagar';
    }
}