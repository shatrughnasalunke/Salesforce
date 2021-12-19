import { LightningElement } from 'lwc';
export default class GetteSetterExample extends LightningElement {
    
    get itemName() {
        console.log();
        this.itemName =='Shatrughna Salunke';
    }

}