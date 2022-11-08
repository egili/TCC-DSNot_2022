import { LightningElement, api } from 'lwc';

export default class FileUploader extends LightningElement {

    @api idRecord;

    get acceptedFormats() {
        return ['.pdf', '.png', '.docx', '.xlsx', '.jpg'];
    }
}