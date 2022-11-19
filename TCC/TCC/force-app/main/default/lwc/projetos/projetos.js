import { LightningElement, track, api } from 'lwc';
import getProjeto from '@salesforce/apex/ProjetosLWCController.getDadosProjetos';
import { ShowToastEvent }  from 'lightning/platformShowToastEvent';

export default class Projetos extends LightningElement {

    @api recordId;

    @track data;
    @track isLoading;

    dataFim;

    dateFromDataInicio;
    formattedDateInicio;
    dateFromDataFim;
    formattedDateFim;

    connectedCallback() {
        getProjeto({recordId: this.recordId})
        .then(result => {
            this.data = result;
            this.isLoading = false;

            this.dataFim = this.data[0].dataTermino;

            this.dateFromDataFim = new Date(this.data[0].dataTermino);

            this.formattedDateFim = ((this.addZeroToDate(this.dateFromDataFim.getDate() + 1))) + '/' + (this.addZeroToDate(this.dateFromDataFim.getMonth() + 1)) + '/' + this.dateFromDataFim.getFullYear();

            this.dateFromDataInicio = new Date(this.data[0].dataInicio);

            this.formattedDateInicio = ((this.addZeroToDate(this.dateFromDataInicio.getDate() + 1))) + '/' + (this.addZeroToDate(this.dateFromDataInicio.getMonth() + 1)) + '/' + this.dateFromDataInicio.getFullYear();

        })
        .catch(error => {
            this.showToast('Ocorreu um erro', 'Recarregue a página e tente novamente', 'error', 'sticky');
            this.data = undefined;
        })
    }

    get showDataFim() {
        return this.dataFim != null ? true : false;
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