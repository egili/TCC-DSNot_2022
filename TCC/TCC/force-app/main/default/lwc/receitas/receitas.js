import { LightningElement, api, track, wire } from 'lwc';
import getReceita from '@salesforce/apex/ReceitasLWCController.getReceita';
import { ShowToastEvent }  from 'lightning/platformShowToastEvent';

export default class Despesas extends LightningElement {
    
    @api recordId;

    @track data;
    @track isLoading = true;

    dataFromDataReceita
    formattedDate;

    connectedCallback() {
        getReceita({recordId: this.recordId})
        .then(result => {
            this.data = result;

            this.dataFromDataReceita = new Date(this.data[0].dataReceita);

            this.formattedDate = ((this.addZeroToDate(this.dataFromDataReceita.getDate() + 1))) + '/' + (this.addZeroToDate(this.dataFromDataReceita.getMonth() + 1)) + '/' + this.dataFromDataReceita.getFullYear();

        })
        .catch(error => {
            this.showToast('Ocorreu um erro', 'Recarregue a página e tente novamente', 'error', 'sticky');
            this.data = undefined;
        })
    }

    addZeroToDate(number) {
        return number <= 9 ? '0' + number : number;
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