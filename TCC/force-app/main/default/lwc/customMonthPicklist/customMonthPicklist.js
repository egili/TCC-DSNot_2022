import { LightningElement, track, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';

export default class CustomMonthPicklist extends LightningElement {

    @track monthInNumericValue;

    @wire(getObjectInfo, { objectApiName: "FluxoCaixa__c" })
    fluxoCaixaMetadata;

    @wire(getPicklistValues, { recordTypeId: "$fluxoCaixaMetadata.data.defaultRecordTypeId", fieldApiName: "FluxoCaixa__c.Meses__c" })
    mesesPicklist;

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
        this.dispatchEvent(new CustomEvent("monthchange", { detail: this.monthInNumericValue })); 
    }
}