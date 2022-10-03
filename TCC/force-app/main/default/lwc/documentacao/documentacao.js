import { LightningElement, api, track, wire } from 'lwc';
import getDocumentacao from '@salesforce/apex/DocumentacaoLWCController.getDocumentacao';
import { ShowToastEvent }  from 'lightning/platformShowToastEvent';
import { getObjectInfo } from 'lightning/uiObjectInfoApi'; 
export default class Documentacao extends LightningElement {
    
    @api recordId;

    @track data;
    @track isLoading = true;

    statusDoc;
    formattedDate;

    @wire(getObjectInfo, { objectApiName: "Documentacao__c" })
    documentacaoMetadata;

    connectedCallback() {
        getDocumentacao({recordId: this.recordId})
        .then(result => {
            this.data = result;
            console.log("results ", this.data[0].status);

            this.statusDoc = this.data[0].status;

            //this.formattedDate = this.formatDate(this.data[0].vencimento);

            //console.log('formatada ' + this.formattedDate);

            this.isLoading = false;
        })
        .catch(error => {
            this.showToast('Ocorreu um erro', 'Recarregue a página e tente novamente', 'error', 'sticky');
            this.data = undefined;
        })
    }

    formatDate(date) {
        let format = ((date.getDate())) + "/" + ((date.getMonth() + 1)) + "/" + date.getFullYear();
        return format;
    }

    get semaphoreStyle(){
        return this.statusDoc == "Atualizado" ? `background-color:#66C557;` : this.statusDoc == "Próximo ao Vencimento" ? `background-color: #ebee38;` : this.statusDoc == "Desatualizado" ? `background-color: #d81717;`: "";
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