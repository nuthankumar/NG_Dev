import { Component } from '@angular/core';
import { ContestService } from '../../services/contest.service'
import { IApproverTwoContestView } from '../../model/approver-two';
import {Router} from '@angular/router';
import { GridOptions } from "ag-grid/main";


@Component({
    selector: 'approver-two-contest-view',
    templateUrl: 'approver-two-contest-view.component.html',
    styleUrls: ['approver-two-contest-view.component.scss']
})
export class ApproverTwoContestViewComponent {
    private lists:IApproverTwoContestView[];
        gridOptions: GridOptions;
        private selectedrow:any;
    selectedData: any;
   data:any;
   private isRowSelectable:any;
   private rowSelection:any;

     constructor(private contestservice: ContestService, private router:Router){
        this.gridOptions = <GridOptions>{};

    }
    columnDefs = [
         { field: '',width: 60, headerCheckboxSelection: true,
        headerCheckboxSelectionFilteredOnly: true,
        checkboxSelection: true, suppressSorting: true,
                suppressMenu: true},
         {headerName: 'PRF NO', field: 'prfGenRef' },
        {headerName: 'PRF GEN Date', field: 'contestprfGenDateName' },
        {headerName: 'Net Payable', field: 'prfAmount'},
        {headerName: 'Status', field: 'status'},
        {headerName: 'Remarks', field: 'remarks'},
        
       


    ];
    ngOnInit(){
          this.gridOptions.rowHeight=40;
    this.gridOptions.headerHeight=40;
        this.contestservice.getapproverTwoContestList().subscribe((lists)=>{
            this.lists=lists.data.approverTwoContestViewList;
            console.log(lists)
          },(error)=>{
            console.log(error);
         })
         
    }
    
    sendToPayout(){
          this.selectedrow=this.gridOptions.api.getSelectedRows();
    this.selectedrow=this.selectedrow;
    this.selectedData = {};
    let selectedRowData =[];
    for(var i = 0 ; i < this.selectedrow.length ; i++){ 
    selectedRowData.push({
            "prfNoGenRef" :this.selectedrow[i].prfGenRef,
            "remarks":null
        });
    this.selectedData["selectedRowData"] = selectedRowData;
    this.data=selectedRowData;
}
        this.contestservice.updateToPayout(this.data).subscribe((response)=>{
       console.log(this.data);
        },(error)=>{
          console.log(error);
        });
      
    }
}
