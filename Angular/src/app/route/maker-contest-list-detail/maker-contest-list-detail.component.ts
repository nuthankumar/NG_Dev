import { Component,ChangeDetectorRef } from '@angular/core';
import { HttpClientModule, HttpClient } from '@angular/common/http';
import { MakerService } from '../../services/maker.service'
import { IAgentWiseMakerList } from '../../model/master-contest';
import { ITransactionCash } from '../../model/transaction-cash';
import {Router,ActivatedRoute, Params} from '@angular/router';
import {GridOptions} from "ag-grid/main";
@Component({
    selector: 'maker-contest-list-detail',
    templateUrl: 'maker-contest-list-detail.component.html',
    styleUrls: ['maker-contest-list-detail.component.scss']
})
export class MakerContestListDetailComponent {
   private gridOptions: GridOptions;
   private gridOptions1:GridOptions;
   private lists: IAgentWiseMakerList[];
   private list: IAgentWiseMakerList;
   private Ticketlists:IAgentWiseMakerList[];
   private rowSelection: any;
   private rowData: any[];
   private isRowSelectable: any;
   selectedData: any;
   data: any;
   private selectedrow: any;
   constructor(private makerService: MakerService, private router:Router,private ChangeDet:ChangeDetectorRef,private route: ActivatedRoute,){
       this.gridOptions = <GridOptions>{};
       this.gridOptions1 = <GridOptions>{};
       this.rowSelection = "multiple";
    }
    columnDefs = [
         { field: '',width: 60, headerCheckboxSelection: true,
        headerCheckboxSelectionFilteredOnly: true,
        checkboxSelection: true, suppressSorting: true,
                suppressMenu: true},
         {headerName: 'Deviation', field: 'add', cellRenderer: function(params:any){
      return "<a routerLink='/addDeviation'>add</a>";},width: 120 },
         {headerName: 'Status', field: 'status',width: 100 },
         {headerName: 'Validation', field: 'validation',width: 120 },
         {headerName: 'Agent No', field: 'agentNo',width: 120 },
         {headerName: 'Agent Name', field: 'agentName',width: 140 },
         {headerName: 'Original Payable', field: 'previousNetPayable',width: 140 },
         {headerName: 'Final Payable', field: 'netPayable',width: 140 },
         {headerName: 'Entry', field: 'entryFlag',width: 140 },
         {headerName: 'Account Number', field: 'bankACNumber',width: 140 },
         {headerName: 'IFSC Code', field: 'ifscCode',width: 140 },
         {headerName: 'PAN Number', field: '',width: 140 },
         {headerName: 'Termination Date', field: 'dtTerm',width: 140 },
         {headerName: 'Branch Code', field: 'branchCode',width: 140 },
];

     ngOnInit(){
         this.gridOptions.rowHeight=40;
        this.gridOptions.headerHeight=40;
         this.route.params.switchMap((params: Params) =>
        this.makerService.getAgentWiseMakerContestList(+params['contestId'])).subscribe((lists)=>{
            this.lists=lists.data;
            console.log(this.lists);
          },(error)=>{
            console.log(error);
         })


this.route.params.switchMap((params: Params) =>
        this.makerService.getAgentWiseMakerContestTicketList(+params['contestId'])).subscribe((Ticketlists)=>{
            this.Ticketlists=Ticketlists.data;
            console.log("dsfs",this.Ticketlists);
          },(error)=>{
            console.log(error);
         })

         this.isRowSelectable = function(rowNode:any) {
             console.log("==>"+rowNode.id);
        //    var timer = setTimeout(function(){
        //        if(document.querySelector(".ag-row-level-"+rowNode.id+" span  span")){
        //             document.querySelector(".ag-row-level-"+rowNode.id+" span  span").classList.remove('ag-hidden');
        //        }
             
        //      console.log("timer==>"+rowNode.id)
        //    },2000);
           return rowNode.data.validation == 'PASS' ? rowNode.data : rowNode.disabled;
    };
    }
     selectAllCheckbox(){
        this.gridOptions.api.selectAll();
        this.selectedrow=this.gridOptions.api.getSelectedRows();
     }
sendToChecker(){
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
    
}

        this.makerService.updateData(this.data).subscribe((response)=>{
       console.log(this.data);
      var selectedNodes = this.gridOptions.api.getSelectedNodes();
this.gridOptions.api.removeItems(selectedNodes);

      
    // this.router.navigate(['/makerContestList']);
        },(error)=>{
          console.log(error);
        });
      
    }
    sendToCheckerTicket(){
        this.selectedrow=this.gridOptions.api.getSelectedRows();
    this.selectedrow=this.selectedrow;
    this.selectedData = {};
    let selectedRowData =[];
    for(var i = 0 ; i < this.selectedrow.length ; i++){ 
    selectedRowData.push({
            "contestId" :this.selectedrow[i].contestId,
            "agentNo" :this.selectedrow[i].agentNo ,
           "destid": this.selectedrow[i].destId,
           "ticketLists":this.selectedrow[i].ticketLists,
           "option":this.selectedrow[i].option,
            "remarks":null
        });
    this.selectedData["selectedRowData"] = selectedRowData;
    this.data=selectedRowData;
    
}

        this.makerService.updateToCheckerTicket(this.data).subscribe((response)=>{
       console.log(this.data);
      var selectedNodes = this.gridOptions.api.getSelectedNodes();
this.gridOptions.api.removeItems(selectedNodes);

      
    // this.router.navigate(['/makerContestList']);
        },(error)=>{
          console.log(error);
        });
    }
 
        
 }
