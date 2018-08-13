import { Component } from '@angular/core';
import { ContestService } from '../../services/contest.service'
import { IApproverOneContestView } from '../../model/approver-one';
import { IApproverOneKey } from '../../model/approver-one';
import {Router} from '@angular/router';
import {GridOptions} from "ag-grid/main";

@Component({
    selector: 'approver-one-contest-view',
    templateUrl: 'approver-one-contest-view.component.html',
    styleUrls: ['approver-one-contest-view.component.scss']
})
export class ApproverOneContestViewComponent {
    private lists:any;
     private gridOptions:GridOptions;
    private selectedrow:any;
    selectedData: any;
   data:any;
   private isRowSelectable:any;
   private rowSelection:any;

     constructor(private contestservice: ContestService, private router:Router){
        this.gridOptions = <GridOptions>{};
        this.rowSelection = "multiple";


    }
    columnDefs = [
         { field: '',width: 60, headerCheckboxSelection: true,
        headerCheckboxSelectionFilteredOnly: true,
        checkboxSelection: true, suppressSorting: true,
                suppressMenu: true},
         {headerName: 'PRF NO', field: 'prfNo' },
        {headerName: 'PRF GEN Date', field: 'makerTimeActual' },
        {headerName: 'Net Payable', field: 'prfAmount'},
        {headerName: 'Status', field: 'status'},
        {headerName: 'Remarks', field: 'remarks'},



    ];
    ngOnInit(){
          this.gridOptions.rowHeight=30;
    this.gridOptions.headerHeight=40;
        this.contestservice.getapproverOneContestList().subscribe((lists)=>{
            console.log(lists);
            this.lists=lists.data.approverOneContestViewList;
            for(let i=0; i<this.lists.length;i++){
                var test = this.lists[i].approverOneKey.prfNo;
                var date = this.lists[i].approverOneKey.makerTimeActual;
                this.lists[i].prfNo= test;
                this.lists[i].makerTimeActual= date;
            }

            //   this.lists.forEach((ele: any) => {
            //        this.lists[index].prfNo = ele.approverOneKey.prfNo;
            //        debugger
            //      })
            //  this.lists.forEach((ele: any) => {
            //        this.lists.push(...ele.approverOneKey);
            //        debugger
            //      })
            console.log(this.lists)
          },(error)=>{
            console.log(error);
         })
          this.isRowSelectable = function(rowNode:any) {
           setTimeout(function(){
            document.querySelector(".ag-row-level-"+rowNode.id+" span span").classList.remove('ag-hidden');
           },500);
           return rowNode.data.validation == 'PASS' ? rowNode.data : rowNode.disabled;
    };

    }
    selectAllCheckbox(){
        this.gridOptions.api.selectAll();
        this.selectedrow=this.gridOptions.api.getSelectedRows();
        console.log(this.selectedrow);
     }
      sendToApproverTwo(){
          this.selectedrow=this.gridOptions.api.getSelectedRows();
    this.selectedrow=this.selectedrow;
    this.selectedData = {};
    let selectedRowData =[];
    for(var i = 0 ; i < this.selectedrow.length ; i++){
    selectedRowData.push({
            "prfNoGenREF" :this.selectedrow[i].prfGenRef,
            "remarks":null,
             "prfNo" :this.selectedrow[i].prfNo,
        });
    this.selectedData["selectedRowData"] = selectedRowData;
    this.data=selectedRowData;
}
        this.contestservice.updateToApproverTwo(this.data).subscribe((response)=>{
       console.log(this.data);
        },(error)=>{
          console.log(error);
        });

    }
}
