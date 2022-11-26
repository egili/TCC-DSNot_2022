import { LightningElement, api, track, wire } from 'lwc';
import getPlanilha from '@salesforce/apex/PlanilhaOrcamentariaLWCController.getPlanilha';
import { ShowToastEvent }  from 'lightning/platformShowToastEvent';

export default class PlanilhaOrcamentaria extends LightningElement {
    
    @api recordId;

    @track data;
    @track isLoading = true;

    connectedCallback() {
        getPlanilha({recordId: this.recordId})
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