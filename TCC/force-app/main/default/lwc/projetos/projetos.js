import { LightningElement, track, wire, api } from 'lwc';

const columns = [
    { label: 'Projeto', fieldName: 'nomeProjeto', hideDefaultActions: true, sortable: true, type: 'text', editable: false, displayReadOnlyIcon: true, cellAttributes: { alignment: 'left' } },
    { label: 'Período', fieldName: 'periodoProjeto', hideDefaultActions: true, sortable: true, type: 'date-local',typeAttributes: {day: "2-digit", month: "2-digit"} , editable: false, displayReadOnlyIcon: true, cellAttributes: { alignment: 'left' } },
    { label: 'Ações', fieldName: 'acoesProjeto', hideDefaultActions: true, sortable: true, type: 'text', editable: false, displayReadOnlyIcon: true, cellAttributes: { alignment: 'left' } },  // entender qual info sera mostrada nessa coluna
    { label: 'Atendidos', fieldName: 'atendidosProjeto', hideDefaultActions: true, sortable: true, type: 'text', editable: false, displayReadOnlyIcon: true, cellAttributes: { alignment: 'left' } },  // entender qual info sera mostrada nessa coluna
    { label: 'Valor', fieldName: 'valorProjeto', hideDefaultActions: true, sortable: true, type: 'currency', typeAttributes: { currencyCode: 'BRL' }, editable: false, displayReadOnlyIcon: true, cellAttributes: { alignment: 'left' } },
]

export default class Projetos extends LightningElement {

    @api recordId;

    @track columns = columns;
    @track data;

    @track isLoading;

    
}