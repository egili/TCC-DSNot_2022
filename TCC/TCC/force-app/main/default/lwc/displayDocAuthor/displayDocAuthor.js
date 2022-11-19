import { LightningElement } from 'lwc';
import getUserName from '@salesforce/apex/DocumentacaoLWCController.getUserName';

export default class DisplayDocAuthor extends LightningElement {

    username;

    connectedCallback() {
        getUserName({})
        .then(result => {
            this.username = result;
        })
        .catch(error => {
            console.log(error);
        })
    }
}