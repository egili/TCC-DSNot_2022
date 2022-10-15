import { LightningElement, track, wire, api } from 'lwc';
import getProjeto from '@salesforce/apex/ProjetosLWCController.getDadosProjetos';
import { ShowToastEvent }  from 'lightning/platformShowToastEvent';

export default class Projetos extends LightningElement {

    @api recordId;

    @track data;
    @track isLoading;

    dataFim;

    connectedCallback() {
        getProjeto({recordId: this.recordId})
        .then(result => {
            this.data = result;
            this.isLoading = false;

            this.dataFim = this.data[0].dataTermino;
        })
        .catch(error => {
            this.showToast('Ocorreu um erro', 'Recarregue a página e tente novamente', 'error', 'sticky');
            this.data = undefined;
        })
    }

    get showDataFim() {
        return this.dataFim != null ? true : false;
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