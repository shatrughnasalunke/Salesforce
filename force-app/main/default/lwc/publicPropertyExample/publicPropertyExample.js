import { LightningElement, api } from 'lwc';

export default class PublicPropertyExample extends LightningElement {
    @api HouseName = 'Laurel';
    @api CityName = 'Malinagar';
    @api PinCodeName = 413108;

    get Name() {
        return 'Shatrughan Salunke';
    }
    get updateName() {
        return 'My House Name is  ' + this.HouseName + '  and I born and brought up in  ' + this.CityName + ' which is having postal code is ' + this.PinCodeName;
    }

    get allCalculation() {
        let number = 10;
        let number2 = 20;
        let getTotal = 10 + 20;
        return getTotal;
    }

}