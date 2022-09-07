import { LightningElement, api, track } from 'lwc';

const columns = [
    { label: 'OSC', fieldName: 'nomeOSC', hideDefaultActions: true, sortable: true, type: 'text', editable: false, displayReadOnlyIcon: true, cellAttributes: { alignment: 'left' } },
    { label: 'Unidade Executora', fieldName: 'periodoProjeto', hideDefaultActions: true, sortable: true, type: 'text', editable: false, displayReadOnlyIcon: true, cellAttributes: { alignment: 'left' } },
    { label: 'Documento', fieldName: 'documento', hideDefaultActions: true, sortable: true, type: 'text', editable: false, displayReadOnlyIcon: true, cellAttributes: { alignment: 'left' } },  
    { label: 'Validade', fieldName: 'validadeDocumento', hideDefaultActions: true, sortable: true, type: 'date-local',typeAttributes: {day: "2-digit", month: "2-digit"}, editable: false, displayReadOnlyIcon: true, cellAttributes: { alignment: 'left' } },  // entender qual info sera mostrada nessa coluna
    { label: 'Operação', fieldName: 'operacao', hideDefaultActions: true, sortable: true, type: 'text', editable: true, cellAttributes: { alignment: 'left' } },
]

export default class Documentacao extends LightningElement {
    
    @api recordId;

    @track columns = columns;
    @track data;

    @track isLoading;
}