import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';

export default class FluxoDeCaixa extends LightningElement {

    @wire(getObjectInfo, { objectApiName: "FluxoCaixa__c" })
    fluxoCaixaMetadata;

    @wire(getPicklistValues, { recordTypeId: "$fluxoCaixaMetadata.data.defaultRecordTypeId", fieldApiName: "FluxoCaixa__c.Meses__c" })
    mesesPicklist;
}