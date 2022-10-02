import { api, LightningElement, track } from "lwc";
import lookUp from "@salesforce/apex/CustomLookupController.search";

export default class customLookUp extends LightningElement {

  @api objName;
  @api fieldApi;
  @api iconName;
  @api disabled;
  @api label;
  @api filter = "";
  @api searchPlaceholder = "Buscar";
  @api fieldType;
  @api order;
  @api initial;
  @api selectedName;

  searchTerm = "";
  loading = false;

  @track records;
  @track isValueSelected;
  @track blurTimeout;
  @track inputClass = "label-text";
  @track boxClass = "slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click slds-has-focus";

  get variant() {
    return this.label == null ? "label-hidden" : "";
  }

  connectedCallback() {
    this.searchTerm = this.initial;
    this.selectedName = this.initial;

    if (this.disabled) {
      const forcedStyles = document.createElement("style");
      forcedStyles.innerText = `c-custom-lookup button[data-element-id="searchClear"] {display: none;}`;
      document.body.appendChild(forcedStyles);
    }
  }

  validateChange({ key, type, preventDefault, target, metaKey }) {
    if (key == "Enter") {
      this.searchTerm = target.value;
      this.isValueSelected = true;
      this.selectedName = this.searchTerm;
      this.boxClass =
        "slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click slds-has-focus";

      const valueSelectedEvent = new CustomEvent("lookupselected", {detail: { name: this.searchTerm },});
      this.dispatchEvent(valueSelectedEvent);
    }
  }

  @api clearSearchTerm() {
    this.searchTerm = undefined;
  }

  onSelect(event) {
    let selectedId = event.currentTarget.dataset.id;
    let selectedName = event.currentTarget.dataset.name;

    const valueSelectedEvent = new CustomEvent("lookupselected", {detail: { name: selectedName, id: selectedId },});
    this.dispatchEvent(valueSelectedEvent);

    this.isValueSelected = true;
    this.selectedName = selectedName;
    this.searchTerm = selectedName;

    this.boxClass = "slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click slds-has-focus";
  }

  handleRemovePill() {
    this.isValueSelected = false;
    this.boxClass = "slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click slds-has-focus";
  }

  onChange(event) {
    this.searchTerm = event.target.value;
    this.boxClass = "slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click slds-has-focus";
    this.isValueSelected = false;

    this.loading = true;

    lookUp({searchTerm: this.searchTerm, fieldApi: this.fieldApi, myObject: this.objName, filter: this.filter, order: this.order,})
    .then((data) => {
      this.error = undefined;
      this.records = [];

      if (data.length == 0) {
        this.boxClass = "slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click slds-has-focus";
      } else if (data.length > 1 && this.searchTerm) {
        this.boxClass = "slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click slds-has-focus slds-is-open";
      } else if (this.searchTerm && this.searchTerm != data[0][this.fieldApi]) {
        this.boxClass = "slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click slds-has-focus slds-is-open";
      }

      data.forEach((item) => {
        this.records.push({ label: item[this.fieldApi], value: item.Id });
      });
    })
    .catch((error) => {
      this.error = error;
      this.records = undefined;
      console.log('error no lookup ' ,error);
    })
    .finally(() => {
      this.loading = false;
    });
  }

  onCommit(event) {
    if (!event.target.value) {
      this.searchTerm = event.target.value;
      this.boxClass = "slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click slds-has-focus";
      this.isValueSelected = false;

      const valueSelectedEvent = new CustomEvent("lookupselected", {detail: { name: this.searchTerm },});
      this.dispatchEvent(valueSelectedEvent);
    }
  }
}