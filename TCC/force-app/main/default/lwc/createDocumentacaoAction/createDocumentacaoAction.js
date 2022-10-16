import { LightningElement, track, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi'; 
import { ShowToastEvent }  from 'lightning/platformShowToastEvent';
import { CloseActionScreenEvent } from "lightning/actions";
import getUserName from '@salesforce/apex/DocumentacaoLWCController.getUserName';
import insertDocumentacao from '@salesforce/apex/DocumentacaoLWCController.insertDocumentacaoInAction';

export default class CreateDocumentacaoAction extends LightningElement {

    username;
    descricaoValue;
    dataEmissaoValue;
    dataVencimentoValue;
    tipoValue;
    outroTipoDescricaoValue;
    isInProjetoValue;
    @track documentacaoProjetoValue;

    projetoId;
    projetoName;

    isInProjeto = false;
    isOutroTextVisible = false;

    @track isModalOpen = true;

    @wire(getObjectInfo, { objectApiName: "Documentacao__c" })
    documentacaoMetadata;

    @wire(getPicklistValues, { recordTypeId: "$documentacaoMetadata.data.defaultRecordTypeId", fieldApiName: "Documentacao__c.Tipo__c" })
    tipoPicklist;

    connectedCallback() {
        getUserName({})
        .then(result => {
            this.username = result;
        })
        .catch(error => {
            this.showToast('Ocorreu um erro', 'Recarregue a página e tente novamente', 'error', 'sticky');
        })
    }

    descricaoChange(event) {
        this.descricaoValue = event.detail.value;
        console.log('descricao ' , this.descricaoValue);
    }

    dataEmissaoChange(event) {
        this.dataEmissaoValue = event.detail.value;
        console.log('dataEmissaoValue ' , this.dataEmissaoValue);
    }

    dataVencimentoChange(event) {
        this.dataVencimentoValue = event.detail.value;
        console.log('dataVencimentoValue ' , this.dataVencimentoValue);
    }
    
    tipoPicklistChange(event) {
        this.isOutroTextVisible = false;

        if(event.target.value == 'Outro')
            this.isOutroTextVisible = true;

        this.tipoValue = event.detail.value;
    }

    outroTipoChange(event) {
        this.outroTipoDescricaoValue = event.detail.value;
        console.log('outroTipoDescricaoValue ' , this.outroTipoDescricaoValue);
    }

    isInProjetoChange(event) {
        this.isInProjetoValue = event.target.checked;
        this.isInProjeto = !this.isInProjeto;
    }

    documentacaoProjetoChange(event) {
        this.documentacaoProjetoValue = event.detail.value;
    }
    
    createDocumentacao(event) {
        this.projetoId = event.detail.id;
        this.projetoName = event.detail.name;
    }

    handleSave() {
        insertDocumentacao({descricao: this.descricaoValue, dataEmissao: this.dataEmissaoValue, dataVencimento: this.dataEmissaoValue ? this.dataEmissaoValue : null,
                        tipo: this.tipoValue, descricaoOutroTipo: this.outroTipoDescricaoValue ? this.outroTipoDescricaoValue : null,
                        projetoRelacionado: this.documentacaoProjetoValue ? this.documentacaoProjetoValue : null})
        .then(result => {
            this.showToast('Sucesso', 'Nova documentação inserida com sucesso', 'success', 'dismissible');
        })
        .catch(error => {
            this.showToast('Ocorreu um erro', 'Recarregue a página e tente novamente', 'error', 'sticky');
        })
        .finally(() => {
            this.dispatchEvent(new CloseActionScreenEvent());
        })
    }

    handleSelectedValue(event) {
        this.documentacaoProjetoValue = event.detail.name;
        console.log('doc ' + this.documentacaoProjetoValue);
    }

    handleClose(event) {
        this.isModalOpen = false;
        this.dispatchEvent(new CloseActionScreenEvent());
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