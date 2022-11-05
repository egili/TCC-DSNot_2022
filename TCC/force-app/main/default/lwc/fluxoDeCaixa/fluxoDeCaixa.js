import { LightningElement, track } from 'lwc';
import { ShowToastEvent }  from 'lightning/platformShowToastEvent';
import getTotalDespesas from '@salesforce/apex/FluxoCaixaLWCController.getTotalDespesas';
import getTotalReceitas from '@salesforce/apex/FluxoCaixaLWCController.getTotalReceitas';
import getSaldoAnual from '@salesforce/apex/FluxoCaixaLWCController.getSaldoAnual';
import getTotalReceitasAnual from '@salesforce/apex/FluxoCaixaLWCController.getTotalReceitasAnual';
import getTotalDespesasAnual from '@salesforce/apex/FluxoCaixaLWCController.getTotalDespesasAnual';

export default class FluxoDeCaixa extends LightningElement {

    @track valorMensalReceitas;
    @track valorMensalDespesas;
    saldoAnual;
    totalReceitasAnual;
    totalDespesasAnual;

    connectedCallback() {
        getSaldoAnual({})
        .then(data => {
            this.saldoAnual = data;
        })
        .catch(error => {
            this.showErrorToast();
        })

        getTotalReceitasAnual({})
        .then(data => {
            this.totalReceitasAnual = data;
        })
        .catch(error => {
            this.showErrorToast();
        })

        getTotalDespesasAnual({})
        .then(data => {
            this.totalDespesasAnual = data;
        })
        .catch(error => {
            this.showErrorToast();
        })
    }

    handleMonthChange(event) {
        this.callGet(event.detail);
    }

    callGet(mes) {
        if(mes == null) {
            this.showErrorToast();
        }

        getTotalDespesas({mes: mes})
        .then(data => {

            if(data === 0)
                this.showToast('Sem despesas', 'Não foram encontradas despesas cadastradas para o mês selecionado', 'warning', 'dismissible');

            this.valorMensalDespesas = data;
            console.log('aqui ' , this.valorMensalDespesas)
        })
        .catch(error => {
            this.showErrorToast();
        })

        getTotalReceitas({mes: mes})
        .then(data => {

            if(data === 0)
                this.showToast('Sem receitas', 'Não foram encontradas despesas receitas para o mês selecionado', 'warning', 'dismissible');

            this.valorMensalReceitas = data;
            console.log('aqui tb ' , this.valorMensalReceitas)
        })
        .catch(error => {
            this.showErrorToast();
        })
    }

    get isReceitasFilled() {
        return this.valorMensalReceitas !== 0 ? true : false;
    }

    get isDespesasFilled() {
        return this.valorMensalDespesas !== 0 ? true : false;
    }

    get saldoMensal() {
        return this.valorMensalReceitas - this.valorMensalDespesas;
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

    showErrorToast() {
        this.showToast('Ocorreu um erro', 'Recarregue a página e tente novamente', 'error', 'sticky');
    }
}