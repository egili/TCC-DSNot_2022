import { LightningElement, track } from 'lwc';
//import arrowUp from '@salesforce/resourceUrl/ArrowUp';

export default class FluxoDeCaixa extends LightningElement {

    get options() {
        return [
            { label: 'Janeiro', value: 'janeiro' },
            { label: 'Fevereiro', value: 'fevereiro' },
            { label: 'Março', value: 'marco' },
            { label: 'Abril', value: 'abril' },
            { label: 'Maio', value: 'maio' },
            { label: 'Junho', value: 'junho' },
            { label: 'Julho', value: 'julho' },
            { label: 'Agosto', value: 'agosto' },
            { label: 'Setembro', value: 'setembro' },
            { label: 'Outubro', value: 'outubro' },
            { label: 'Novembro', value: 'novembro' },
            { label: 'Dezembro', value: 'dezembro' },
        ];
    }
}