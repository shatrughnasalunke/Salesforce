/* eslint-disable no-console */
import { LightningElement, track, wire } from 'lwc';

import retrieveAccounts from '@salesforce/apex/PaginationController.retrieveAccounts';
//define columns of the datatable

const columns = [
    { label: 'Id', fieldName: 'Id' }, 
    { label: 'Name', fieldName: 'Name' },
    { label: 'Type', fieldName: 'Type' },
    { label: 'BillingCountry', fieldName: 'BillingCountry' },       
];
let i=0;

export default class DisplayPaginatedRecords extends LightningElement {
    @track page = 1; //this will initialize 1st page
    @track items = []; //it contains all the records.
    @track data = []; //data to be displayed in the table
    @track columns; //holds column info.
    @track startingRecord = 1; //start record position per page
    @track endingRecord = 0; //end record position per page
    @track pageSize = 5; //default value we are assigning
    @track totalRecountCount = 0; //total record count received from all retrieved records
    @track totalPage = 0; //total number of page is needed to display all records

    @wire(retrieveAccounts)
    wiredAccounts({ error, data }) {
        if (data) {
            //if you want to perform data transformation then following code will be used,
            //so that individual values to be assigned into each columns
            /*
            for(i=0; i<data.length; i++) {
                this.items = [...this.items,
                                    {Id:data[i].Id, 
                                    Name:data[i].Name, 
                                    Type:data[i].Type, 
                                    BillingCountry:data[i].BillingCountry}];                               
            }
            */
            this.items = data;
            this.totalRecountCount = data.length; //here it is 23
            this.totalPage = Math.ceil(this.totalRecountCount / this.pageSize); //here it is 5
            
            //initial data to be displayed ----------->
            //slice will take 0th element and ends with 5, but it doesn't include 5th element
            //so 0 to 4th rows will be displayed in the table
            this.data = this.items.slice(0,this.pageSize); 
            this.endingRecord = this.pageSize;
            this.columns = columns;

            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.data = undefined;
        }
    }

    //clicking on previous button this method will be called
    previousHandler() {
        if (this.page > 1) {
            this.page = this.page - 1; //decrease page by 1
            this.displayRecordPerPage(this.page);
        }
    }

    //clicking on next button this method will be called
    nextHandler() {
        if((this.page<this.totalPage) && this.page !== this.totalPage){
            this.page = this.page + 1; //increase page by 1
            this.displayRecordPerPage(this.page);            
        }             
    }

    //this method displays records page by page
    displayRecordPerPage(page){

        /*let's say for 2nd page, it will be => "Displaying 6 to 10 of 23 records. Page 2 of 5"
        page = 2; pageSize = 5; startingRecord = 5, endingRecord = 10
        so, slice(5,10) will give 5th to 9th records.
        */
        this.startingRecord = ((page -1) * this.pageSize) ;
        this.endingRecord = (this.pageSize * page);

        this.endingRecord = (this.endingRecord > this.totalRecountCount) 
                            ? this.totalRecountCount : this.endingRecord; 

        this.data = this.items.slice(this.startingRecord, this.endingRecord);

        //increment by 1 to display the startingRecord count, 
        //so for 2nd page, it will show "Displaying 6 to 10 of 23 records. Page 2 of 5"
        this.startingRecord = this.startingRecord + 1;
    }    
}