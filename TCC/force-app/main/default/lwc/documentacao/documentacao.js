import { LightningElement, api, track, wire } from 'lwc';
import getDocumentacao from '@salesforce/apex/DocumentacaoLWCController.getDocumentacao';
import { ShowToastEvent }  from 'lightning/platformShowToastEvent';
import { getObjectInfo } from 'lightning/uiObjectInfoApi'; 

export default class Documentacao extends LightningElement {
    
    @api recordId;

    @track data;
    @track isLoading = true;

    statusDoc;
    dateFromVencimento;
    formattedDate;

    @wire(getObjectInfo, { objectApiName: "Documentacao__c" })
    documentacaoMetadata;

    connectedCallback() {
        getDocumentacao({recordId: this.recordId})
        .then(result => {
            this.data = result;

            this.statusDoc = this.data[0].status;

            //this.formattedDate = this.data[0].vencimentotoLocaleDateString('pt-BR', {timeZone: 'UTC'});

            this.dateFromVencimento = new Date(this.data[0].vencimento);

            this.formattedDate = ((this.addZeroToDate(this.dateFromVencimento.getDate() + 1))) + '/' + (this.addZeroToDate(this.dateFromVencimento.getMonth() + 1)) + '/' + this.dateFromVencimento.getFullYear();

            console.log ("PEIDO:" + this.data[0].vencimento)

            this.isLoading = false;
        })
        .catch(error => {
            this.showToast('Ocorreu um erro', 'Recarregue a página e tente novamente', 'error', 'sticky');
            this.data = undefined;
        })
    }

    handleEditClick() {
        alert('tst')
    }

    addZeroToDate(number) {
        return number <= 9 ? '0' + number : number;
    }

    get semaphoreStyle(){
        return this.statusDoc == "Atualizado" ? `background-color:#66C557;` : this.statusDoc == "Próximo ao Vencimento" ? `background-color: #ebee38;` : `background-color: #d81717;`;
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