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
        event.detail.files.length == undefined ? this.howManyFiles = 0 : this.howManyFiles = event.detail.files.length;
    }

    handleClick(event){

        console.log('howManyFiles ' + this.howManyFiles);
    
        if(this.howManyFiles == 0){
            this.showWarningToast();
            return;
        }
        this.closeModal(event);
        this.showSuccessToast();
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

    showWarningToast(){
        this.showToast('Atenção', 'Adicione documentos antes de salvar', 'warning', 'dismissible');
    }

    showSuccessToast(){
        this.showToast('Sucesso', 'Arquivo(s) anexados com sucesso', 'success', 'dismissible');
    }
}