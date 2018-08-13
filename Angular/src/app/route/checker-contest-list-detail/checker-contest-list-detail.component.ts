import { Component } from '@angular/core';
import { HttpClientModule, HttpClient } from '@angular/common/http';
import { CheckerService } from '../../services/checker.service'
import { IAgentWiseMakerList } from '../../model/master-contest';
import { ITransactionCash } from '../../model/transaction-cash';
import {Router,ActivatedRoute, Params} from '@angular/router';
import {GridOptions} from "ag-grid/main";

@Component({
    selector: 'checker-contest-list-detail',
    templateUrl: 'checker-contest-list-detail.component.html',
    styleUrls: ['checker-contest-list-detail.component.scss']
})
export class CheckerContestListDetailComponent {
     private gridOptions:GridOptions;
   private lists:IAgentWiseMakerList[];
    private list:IAgentWiseMakerList;
   private rowSelection:any;
   private rowData: any[];
   private isRowSelectable:any;
   selectedData: any;
   data:any;
  private selectedrow:any;
constructor(private checkerService: CheckerService, private router:Router,private route: ActivatedRoute,){
       this.gridOptions = <GridOptions>{};
        this.isRowSelectable = function(rowNode:any) {
           
           return rowNode.data.validation == 'PASS' ? rowNode.data : rowNode.disabled;
    };
    }
      columnDefs = [
         { field: '',width: 60, headerCheckboxSelection: true,
        headerCheckboxSelectionFilteredOnly: true,
        checkboxSelection: true, suppressSorting: true,
                suppressMenu: true},
         {headerName: 'Status', field: 'status',width: 130 },
         {headerName: 'Validation', field: 'validation',width: 140 },
         {headerName: 'Agent No', field: 'agentNo',width: 180 },
         {headerName: 'Agent Name', field: 'agentName',width: 190 },
         {headerName: 'Original Payable', field: 'previousNetPayable',width: 170 },
         {headerName: 'Final Payable', field: 'netPayable',width: 150 },
         {headerName: 'Entry', field: 'entryFlag',width: 160 }
];

ngOnInit(){
      this.gridOptions.rowHeight=30;
    this.gridOptions.headerHeight=40;
         this.route.params.switchMap((params:Params) =>
        this.checkerService.getagentWiseCheckerContestList(+params['contestId'])).subscribe((lists)=>{
            this.lists=lists.data;
          },(error)=>{
            console.log(error);
         })
        
         
    }
    selectAllCheckbox(){
        this.gridOptions.api.selectAll();
        this.selectedrow=this.gridOptions.api.getSelectedRows();
     }
        refresh(): void {
    window.location.reload();
}
      sendToApprover(){
          this.selectedrow=this.gridOptions.api.getSelectedRows();
    this.selectedrow=this.selectedrow;
    this.selectedData = {};
    let selectedRowData =[];
    for(var i = 0 ; i < this.selectedrow.length ; i++){ 
    selectedRowData.push({
            "contestId" :this.selectedrow[i].contestId,
            "agentNo" :this.selectedrow[i].agentNo ,
            "remarks":null
        });
    this.selectedData["selectedRowData"] = selectedRowData;
    this.data=selectedRowData;
    console.log("hdfkjs",this.data);
}
        this.checkerService.updateToApprover(this.data).subscribe((response)=>{
       console.log(this.data);
        var selectedNodes = this.gridOptions.api.getSelectedNodes();
        this.gridOptions.api.removeItems(selectedNodes);
        },(error)=>{
          console.log(error);
        });
      
    }
      
}
