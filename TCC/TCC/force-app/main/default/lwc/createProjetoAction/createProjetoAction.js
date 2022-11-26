import { LightningElement, wire, api, track } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi'; 
import { ShowToastEvent }  from 'lightning/platformShowToastEvent';
import { CloseActionScreenEvent } from "lightning/actions";

export default class CreateProjetoAction extends LightningElement {

    @wire(getObjectInfo, { objectApiName: "Projeto__c" })
    projetoMetadata;
}