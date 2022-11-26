import { LightningElement, track } from 'lwc';
import { ShowToastEvent }  from 'lightning/platformShowToastEvent';
import getProjetoCount from '@salesforce/apex/HomePageLWCController.getNumberOfProjetos';
import getDocsUpdate from '@salesforce/apex/HomePageLWCController.getDocsToUpdate';
import getFluxoCaixaInfo from '@salesforce/apex/HomePageLWCController.getFluxoCaixaInfo';

export default class HomePage extends LightningElement {

    @track projectNumber;
    @track docsNumber;
    @track fluxoCaixa;

    connectedCallback() {
        getProjetoCount({})
        .then(result => {
            this.projectNumber = result;
        })
        .catch(error => {
            this.showErrorToast();
        })

        getDocsUpdate({})
        .then(result => {
            this.docsNumber = result;
        }) 
        .catch(error => {
            this.showErrorToast();
        })

        getFluxoCaixaInfo({})
        .then(result => {
            this.fluxoCaixa = result;
        })
        .catch(error => {
            this.showErrorToast();
        })
    }

    get pluralOrSingularProjeto() {
        return this.projectNumber == 1 ? 'projeto está vigente' : 'projetos estão vigentes';
    }
    
    get pluralOrSingularDocumentacao() {
        return this.docsNumber == 1 ? 'documento para atualizar' : 'documentos para atualizar';
    }

    get cardColor() {
        return this.docsNumber == 0 ? `background-color:#66C557;` : this.docsNumber > 0 && this.docsNumber <= 20 ? `background-color: #ebee38;` : `background-color: #d81717;`;
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

    showErrorToast(){
        this.showToast('Ocorreu um erro', 'Recarregue a página e tente novamente', 'error', 'sticky');
    }
}