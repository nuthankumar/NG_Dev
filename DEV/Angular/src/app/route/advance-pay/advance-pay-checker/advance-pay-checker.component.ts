import { Component } from '@angular/core';
import { AdvancePayService } from '../../../services/advance-pay.service'
import { AdvancePay } from '../../../model/advance-pay';
import {Router} from '@angular/router';
import {GridOptions} from "ag-grid/main";

@Component({
    selector: 'advance-pay-checker',
    templateUrl: 'advance-pay-checker.component.html',
    styleUrls: ['advance-pay-checker.component.scss']
})
export class AdvancePayCheckerComponent {
    private advancePay:AdvancePay[];
          private gridOptions:GridOptions;
          advancePayListData:any;
          data:any;
          selectedData:any;
           private selectedrow:any;
          constructor(private advancePayService: AdvancePayService, private router:Router){
        this.gridOptions = <GridOptions>{};

    }
    columnDefs = [
        { field: '',width: 60, headerCheckboxSelection: true,
        headerCheckboxSelectionFilteredOnly: true,
        checkboxSelection: true, suppressSorting: true,
                suppressMenu: true},
         {headerName: 'Agent No', field: 'agentNo' },
        {headerName: 'Advance Date', field: 'advDate' },
        {headerName: 'Effective Date', field: 'effectiveStartDateForRecovery'},
        {headerName: 'Amount', field: 'amount'},
        {headerName: 'Recoverable', field: 'recoverable'},
        {headerName: 'Remarks', field: 'remarks'},
        {headerName: 'Recoverable per cycle', field: 'maxRecoverblePerCycle'},
        {headerName: 'Net Balance', field: 'netBalance'}
];
ngOnInit(){
          this.gridOptions.rowHeight=40;
    this.gridOptions.headerHeight=40;
        this.advancePayService.getAdvancePayCheckerList().subscribe((advancePay)=>{
             this.advancePay = advancePay.data.advancePayCheckerList;
            this.advancePayListData  = [];
               this.advancePay.forEach((ele: any) => {
                   this.advancePayListData.push(ele.advancePayCashKey);
                 })
          },(error)=>{
            console.log(error);
         })
         
    }
    advancePayApprove(){
        this.selectedrow= this.gridOptions.api.getSelectedRows();
    this.selectedData = {};
    let selectedRowData =[];
    for(var i = 0 ; i < this.selectedrow.length ; i++){ 
    selectedRowData.push({
            "agentNo" :this.selectedrow[i].agentNo,
            "advDate":this.selectedrow[i].advDate
        });
    this.selectedData["selectedRowData"] = selectedRowData;
    this.data=selectedRowData;
}
        this.advancePayService.updateAdvancePayChecker(this.data).subscribe((response)=>{
       console.log(this.data);
        },(error)=>{
          console.log(error);
        });
      
    

    }
}
