import { LightningElement, api, track, wire } from 'lwc';
import getDocumentacao from '@salesforce/apex/DocumentacaoLWCController.getDocumentacao';
import { ShowToastEvent }  from 'lightning/platformShowToastEvent';
import { getObjectInfo } from 'lightning/uiObjectInfoApi'; 
export default class Documentacao extends LightningElement {
    
    @api recordId;

    @track data;
    @track isLoading = true;

    @wire(getObjectInfo, { objectApiName: "Documentacao__c" })
    documentacaoMetadata;

    connectedCallback() {
        getDocumentacao({recordId: this.recordId})
        .then(result => {
            this.data = result;
            this.isLoading = false;
        })
        .catch(error => {
            this.showToast('Ocorreu um erro', 'Recarregue a página e tente novamente', 'error', 'sticky');
            this.data = undefined;
        })
    }

    get nomeOSCLabel() {
        if(this.documentacaoMetadata)
            return this.documentacaoMetadata.data.fields.NomeOSC__c.label;
    }

    get docProjLabel() {
        if(this.documentacaoMetadata)
            return this.documentacaoMetadata.data.fields.DocumentacaoProjeto__c.label;
    }

    get nameLabel() {
        if(this.documentacaoMetadata)
            return this.documentacaoMetadata.data.fields.Name.label;
    }

    get tipoLabel() {
        if(this.documentacaoMetadata)
            return this.documentacaoMetadata.data.fields.Tipo__c.label;
    }

    get dataVencLabel() {
        if(this.documentacaoMetadata)
            return this.documentacaoMetadata.data.fields.DataVencimento__c.label;
    }

    get statusLabel() {
        if(this.documentacaoMetadata)
            return this.documentacaoMetadata.data.fields.Status__c.label;
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