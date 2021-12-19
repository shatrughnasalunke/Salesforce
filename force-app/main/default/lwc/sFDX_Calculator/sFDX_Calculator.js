import { LightningElement } from 'lwc';

export default class SFDX_Calculator extends LightningElement {

    number1;
    number2;

    handleChange(event) {
        const val = event.target.value;
        const name = event.target.name;

        if (name === 'number1') {

            this.number1 = val;

        } else {
            this.number2 = val;

        }
    }
    doSum() {
        const sum = parseInt(this.number1) + parseInt(this.number2);
        alert(sum);
    }
    doSub() {
        const sub = parseInt(this.number1) - parseInt(this.number2);
        alert(sub);
    }
    doMul() {
        const mult = parseInt(this.number1) * parseInt(this.number2);
        alert(mult);
    }
    doDiv() {
        const div = parseInt(this.number1) / parseInt(this.number2);
        alert(div);
    }
}