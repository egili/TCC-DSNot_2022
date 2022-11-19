import { LightningElement } from 'lwc';

export default class DocumentacaoTop extends LightningElement {

    isModalOpen = false

    openModal() {
        this.isModalOpen = true;
    }

    closeModal(event) {
        this.isModalOpen = false;
    }
}