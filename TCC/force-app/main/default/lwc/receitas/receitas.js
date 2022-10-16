import { LightningElement, api, track, wire } from 'lwc';
import getReceita from '@salesforce/apex/ReceitasLWCController.getReceita';
import { ShowToastEvent }  from 'lightning/platformShowToastEvent';

export default class Despesas extends LightningElement {
    
    @api recordId;

    @track data;
    @track isLoading = true;

    connectedCallback() {
        getReceita({recordId: this.recordId})
        .then(result => {
            this.data = result;
        })
        .catch(error => {
            this.showToast('Ocorreu um erro', 'Recarregue a página e tente novamente', 'error', 'sticky');
            this.data = undefined;
        })
    }

    showToast(title, message, variant, mode) {
        const errorToast = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
            mode: mode
        });
        this.dispatchEvent(errorToast);
    }
}