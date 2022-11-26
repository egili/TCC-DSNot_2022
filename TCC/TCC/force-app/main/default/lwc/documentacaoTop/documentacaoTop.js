import { LightningElement, api } from 'lwc';
import { ShowToastEvent }  from 'lightning/platformShowToastEvent';

export default class DocumentacaoTop extends LightningElement {

    @api recordId;
    isModalOpen = false
    howManyFiles;

    openModal() {
        this.isModalOpen = true;
    }

    closeModal(event) {
        this.isModalOpen = false;
    }

    get acceptedFormats() {
        return ['.csv','.doc','.xls','.pdf','.png','.jpg','.jpeg','.docx','.doc'];
    }

    handleUploadFinished(event){
        const uploadedFiles = event.detail.files;
        this.howManyFiles = event.detail.files.length;
    }

    handleClick(event){
        this.closeModal(event);

        const toast = new ShowToastEvent({
            title: 'Sucesso',
            message: this.howManyFiles + ' Arquivo(s) anexados com sucesso',
            variant: 'success',
            mode: 'dismissible'
        });
        this.dispatchEvent(toast); 
    }
}