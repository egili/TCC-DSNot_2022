import { LightningElement, wire, track } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { ShowToastEvent }  from 'lightning/platformShowToastEvent';
import getReceitas from '@salesforce/apex/FluxoCaixaLWCController.getReceitas';

export default class FluxoDeCaixa extends LightningElement {

    @track monthInNumericValue;
    @track valorTotalReceitas;

    @wire(getObjectInfo, { objectApiName: "FluxoCaixa__c" })
    fluxoCaixaMetadata;

    @wire(getPicklistValues, { recordTypeId: "$fluxoCaixaMetadata.data.defaultRecordTypeId", fieldApiName: "FluxoCaixa__c.Meses__c" })
    mesesPicklist;

    callGetReceitas(mes) {
        
        if(mes == null){
            this.showToast('Ocorreu um erro', 'Recarregue a página e tente novamente', 'error', 'sticky');
        }

        getReceitas({mes: mes})
        .then(data => {
            console.log(data);

            if(data.length == 0){
                this.showToast('Selecione outro mês', 'Nenhuma receita cadastrada para o mês selecionado', 'warning', 'dismissible');
            }

            

        })
        .catch(error => {
            this.showToast('Ocorreu um erro', 'Recarregue a página e tente novamente', 'error', 'sticky');
        })        
    }

    handleChangeMesesPicklist(event) {
        switch(event.detail.value){
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

        this.callGetReceitas(this.monthInNumericValue);

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