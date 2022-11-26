import { LightningElement, wire, track } from 'lwc';
//import getAccounts from '@salesforce/apex/AccountSearchController.getAccounts';
import getProjetos from '@salesforce/apex/ProjetoSearchController.getProjetos';

export default class projetoSearchLookup extends LightningElement {

    @track projName = '';

    @track projList = [];    

    @track projId; 

    @track isShow = false;
    @track messageResult = false;
    @track isShowResult = true;   
    @track showSearchedValues = false;   

    @wire(getProjetos, {projName: '$projName'})
    retrieveProjetos({error, data}) {
        this.messageResult = false;
        if(data) {
            if(data.length > 0 && this.isShowResult) {
                this.projList = data;
                this.showSearchedValues = true;
                this.messageResult = false;
            } else if(data.length == 0) {
                this.projList = [];
                this.showSearchedValues = false;
                
                if(this.projName != '')
                    this.messageResult = true;
            } else if(error) {
                this.projId = '';
                this.projName = '';
                this.projList = [];
                this.showSearchedValues = false;
                this.messageResult = true;   
            }
        }
    }

    /*@wire(getAccounts, {actName:'$projName'})
    retrieveAccounts ({error, data}) {
        this.messageResult=false;
        if (data) {
            // TODO: Error handling 
            console.log('data::'+data.length);
            if(data.length>0 && this.isShowResult) {
            this.projList = data;                
            this.showSearchedValues = true; 
            this.messageResult=false;
        }            
        else if(data.length==0) {
            this.projList = [];                
            this.showSearchedValues = false;
            if(this.projName!='')
                this.messageResult=true;               
            }  
        } else if (error) {
            // TODO: Data handling
            this.projId =  '';
            this.projName =  '';
            this.projList=[];           
            this.showSearchedValues = false;
            this.messageResult=true;   
        }
    }*/
    
    handleClick(event) {
        this.isShowResult = true;   
        this.messageResult = false;        
    }

    handleKeyChange(event) {       
        this.messageResult = false; 
        this.projName = event.target.value;
    }  

    handleParentSelection(event) {        
        this.showSearchedValues = false;
        this.isShowResult = false;
        this.messageResult = false;
        //Set the parent calendar id
        this.projId = event.target.dataset.value;
        //Set the parent calendar label
        this.projName = event.target.dataset.label;      
        console.log('projId::'+this.projId);   
    
        const selectedEvent = new CustomEvent('selected', { detail: this.projId });
        this.dispatchEvent(selectedEvent);    
    }

    handleOpenModal(event) {
        this.isShow = true;
    }

    handleCloseModal(event) {
        this.isShow = false;
    }

    handleSuccess(event) {       
        this.isShowResult = false;
        this.messageResult = false;
        this.isShow = false;
        this.projId = event.detail.id;
        console.log(event.detail.id);
        //console.log('JSON OBject:'+JSON.stringify(event.detail));
        this.projName = event.detail.fields.Name.value;

        const selectedEvent = new CustomEvent('selected', { detail: this.projId });
        this.dispatchEvent(selectedEvent);
    }

    handleReset(event) {
        const inputFields = this.template.querySelectorAll('lightning-input-field');

        if (inputFields) {
            inputFields.forEach(field => {
                field.reset();
            });
        }
        this.isShow = false;
    }
}