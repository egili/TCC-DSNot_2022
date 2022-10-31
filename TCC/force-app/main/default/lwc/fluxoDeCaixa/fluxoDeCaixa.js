import { LightningElement, wire, track } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { ShowToastEvent }  from 'lightning/platformShowToastEvent';
import getTotalDespesas from '@salesforce/apex/FluxoCaixaLWCController.getTotalDespesas';
import getTotalReceitas from '@salesforce/apex/FluxoCaixaLWCController.getTotalReceitas';
import getSaldoAnual from '@salesforce/apex/FluxoCaixaLWCController.getSaldoAnual';
import getTotalReceitasAnual from '@salesforce/apex/FluxoCaixaLWCController.getTotalReceitasAnual';
import getTotalDespesasAnual from '@salesforce/apex/FluxoCaixaLWCController.getTotalDespesasAnual';

export default class FluxoDeCaixa extends LightningElement {

    @track monthInNumericValue;
    @track valorMensalReceitas;
    @track valorMensalDespesas;
    saldoAnual;
    totalReceitasAnual;
    totalDespesasAnual;

    @wire(getObjectInfo, { objectApiName: "FluxoCaixa__c" })
    fluxoCaixaMetadata;

    @wire(getPicklistValues, { recordTypeId: "$fluxoCaixaMetadata.data.defaultRecordTypeId", fieldApiName: "FluxoCaixa__c.Meses__c" })
    mesesPicklist;

    renderedCallback() {
        this.valorMensalDespesas = '';
        this.valorMensalReceitas = '';
    }

    connectedCallback() {
        getSaldoAnual({})
        .then(data => {
            this.saldoAnual = data;
        })
        .catch(error => {
            this.showToast('Ocorreu um erro', 'Recarregue a página e tente novamente', 'error', 'sticky');
        })

        getTotalReceitasAnual({})
        .then(data => {
            this.totalReceitasAnual = data;
        })
        .catch(error => {
            this.showToast('Ocorreu um erro', 'Recarregue a página e tente novamente', 'error', 'sticky');
        })

        getTotalDespesasAnual({})
        .then(data => {
            this.totalDespesasAnual = data;
        })
        .catch(error => {
            this.showToast('Ocorreu um erro', 'Recarregue a página e tente novamente', 'error', 'sticky');
        })

    }

    handleClick(event) {
        this.callGet(this.monthInNumericValue);
    }

    callGet(mes) {
        if(mes == null) {
            this.showToast('Ocorreu um erro', 'Recarregue a página e tente novamente', 'error', 'sticky');
        }

        getTotalDespesas({mes: mes})
        .then(data => {
            this.valorMensalDespesas = data;
            console.log('aqui ' , this.valorMensalDespesas)
        })
        .catch(error => {
            this.showToast('Ocorreu um erro', 'Recarregue a página e tente novamente', 'error', 'sticky');
        })

        getTotalReceitas({mes: mes})
        .then(data => {
            this.valorMensalReceitas = data;
            console.log('aqui tb ' , this.valorMensalReceitas)
        })
        .catch(error => {
            this.showToast('Ocorreu um erro', 'Recarregue a página e tente novamente', 'error', 'sticky');
        })
    }

    get saldoMensal() {
        return this.valorMensalReceitas - this.valorMensalDespesas;
    }

    handleChangeMesesPicklist(event) {
        switch(event.detail.value) {
            case 'Janeiro':
                this.monthInNumericValue = 1;
                break;

            case 'Fevereiro':
                this.monthInNumericValue = 2;
                break;

            case 'Março':
                this.monthInNumericValue = 3;
                break;

            case 'Abril':
                this.monthInNumericValue = 4;
                break;

            case 'Maio':
                this.monthInNumericValue = 5;
                break;

            case 'Junho':
                this.monthInNumericValue = 6;
                break;

            case 'Julho':
                this.monthInNumericValue = 7;
                break;

            case 'Agosto':
                this.monthInNumericValue = 8;
                break;

            case 'Setembro':
                this.monthInNumericValue = 9;
                break;

            case 'Outubro':
                this.monthInNumericValue = 10;
                break;

            case 'Novembro':
                this.monthInNumericValue = 11;
                break;

            case 'Desembro':
                this.monthInNumericValue = 12;
                break;
        } 
        this.callGet(this.monthInNumericValue);
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