import { LightningElement, api, track, wire } from 'lwc';
import getDespesas from '@salesforce/apex/DespesasLWCController.getDespesas';
import { ShowToastEvent }  from 'lightning/platformShowToastEvent';

export default class Despesas extends LightningElement {
    
    @api recordId;

    @track data;
    @track isLoading = true;

    dateFromDataDespesa;
    formattedDate;

    connectedCallback() {
        getDespesas({recordId: this.recordId})
        .then(result => {
            this.data = result;

            this.dateFromDataDespesa = new Date(this.data[0].dataDespesa);

            this.formattedDate = ((this.addZeroToDate(this.dateFromDataDespesa.getDate() + 1))) + '/' + (this.addZeroToDate(this.dateFromDataDespesa.getMonth() + 1)) + '/' + this.dateFromDataDespesa.getFullYear();
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