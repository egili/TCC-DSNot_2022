import { LightningElement } from 'lwc';
import { ShowToastEvent }  from 'lightning/platformShowToastEvent';
//import getId from '@salesforce/apex/DocumentacaoLWCController.getIdToDisplayAndOpenDocAfterFlowInsert';

export default class FinishInsertDocFlow extends LightningElement {

    /*idNewDoc;

    connectedCallback(){
        getId({})
        .then(result => {
            this.idNewDoc = result;
        })
        .catch(error => {
            this.showErrorToast();
        })
    }*/

    showToast(title, message, variant, mode) {
        const toast = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
            mode: mode
        });
        this.dispatchEvent(toast);
    }

    showErrorToast(){
        this.showToast('Ocorreu um erro', 'Recarregue a página e tente novamente', 'error', 'sticky');
    }
}