import { Component } from '@angular/core';
import { HttpClientModule, HttpClient } from '@angular/common/http';
import { ContestService } from '../../services/contest.service'
import { IPRFList } from '../../model/prf-list';
import {Router,ActivatedRoute, Params} from '@angular/router';
import { IMultiSelectOption } from 'angular-2-dropdown-multiselect';
import {GridOptions} from "ag-grid/main";
@Component({
    selector: 'prf-list',
    templateUrl: 'prf-list.component.html',
    styleUrls: ['prf-list.component.scss']
})
export class PrfListComponent {
     private gridOptions:GridOptions;
     private rowSelection:any;
    private lists:IPRFList[];
    private list:IPRFList[];
    private agentType:IPRFList[];
    private selectedItemss:any;
    prfCommentData:any;
    selectedDataA:any
    requestData = {};
     selectedData: any;
     dropdownSettings = {};
     data:any;
     agentTypes:any;
    constructor(private contestservice: ContestService, private router:Router){
        this.gridOptions = <GridOptions>{};
        this.rowSelection = "multiple";
    }
     columnDefs = [
        { field: '',width: 60, headerCheckboxSelection: true,
        headerCheckboxSelectionFilteredOnly: true,
        checkboxSelection: true, suppressSorting: true,
                suppressMenu: true},
        {headerName: 'Agent No', field: 'agentNo' },
        {headerName: 'Agent Name', field: 'agentName'},
        {headerName: 'Tran Date', field: 'tranDate'},
        {headerName: 'Net Amount', field: 'netAmount'},
        {headerName: 'Rec Amount', field: 'recoverbleAmount'},
        {headerName: 'Dev Amount', field: 'deviationAmt'},
        {headerName: 'AdvancePayout', field: 'advancePayout'},
        {headerName: 'Adva Recoverable', field: 'advanceRecoverable'},
        {headerName: 'Max Rec Amount', field: 'maxRecoverableAmt'},
        {headerName: 'Final Payable', field: 'netPayout'},
        {headerName: 'Comments', field: 'prfComment',editable:true, valueSetter: this.nameValueGetter , valueGetter: ""},



    ];
      refresh(): void {
    window.location.reload();
}
   onItemSelect(list:any){

        this.agentTypes=this.selectedItemss;
          this.contestservice.getPRFList(this.agentTypes).subscribe((lists)=>{
                    this.lists=lists;
            this.selectedData = {};
            let selectedRowData =[];
            for(var i=0;i<lists.data.length;i++){
                var list= lists.data[i];
                selectedRowData.push(list.prfListCashKey);
                this.selectedData["selectedRowData"] = selectedRowData;
                this.data=selectedRowData;
            }
this.lists=this.data;
console.log(this.lists);

          },(error)=>{
            console.log(error);
         })
          
    }

    onItemDeSelect(list:any){
        this.agentTypes=this.selectedItemss;
        if(this.selectedItemss && this.selectedItemss.length != 0){
         this.contestservice.getPRFList(this.agentTypes).subscribe((lists)=>{
                    this.lists=lists;
            this.selectedData = {};
            let selectedRowData =[];
            for(var i=0;i<lists.data.length;i++){
                var list= lists.data[i];
                
            selectedRowData.push(list.prfListCashKey);
            this.selectedData["selectedRowData"] = selectedRowData;
            this.data=selectedRowData;
            }
            this.lists=this.data;
            this.list=this.data.agTypes;
                    },(error)=>{
                        console.log(error);
                    })
                }else{
                    this.lists=[];
      }

  }
 ngOnInit(){
       this.gridOptions.rowHeight=30;
    this.gridOptions.headerHeight=40;
        this.dropdownSettings = {
            singleSelection: false,
            selectAllText: 'Select All',
            unSelectAllText: 'UnSelect All',
        };
        this.lists=[];
         this.contestservice.getagentTypes().subscribe((agentType)=>{
            this.agentType=agentType.data;
            debugger
          },(error)=>{
            console.log(error);
            })
         }
         generatePrf(){
             this.prfCommentData = this.gridOptions.api.getSelectedRows();
        this.selectedDataA = {};
    let selectedRowData =[];
    for(var i = 0 ; i < this.prfCommentData.length ; i++){ 
    selectedRowData.push({
            "agentNo":  this.prfCommentData[i].agentNo,     
            "prfComment" :this.prfCommentData[i].prfComment,
            "agId":this.prfCommentData[i].agType,
            "transAutoId":this.prfCommentData[i].transAutoId
        });
    this.selectedDataA["selectedRowData"] = selectedRowData;
    this.data=selectedRowData;
    
}
             this.agentTypes=this.selectedItemss;
             this.requestData["agentTypes"] = ""+this.selectedItemss;
             this.requestData["selectedRecords"]=this.data;
     
        console.log("Request generate==>"+JSON.stringify(this.requestData));
           this.contestservice.updategeneratePrf(this.requestData).subscribe((response)=>{
               console.log(this.requestData);
               this.refresh();
          },(error)=>{
            console.log(error);
         })
        }
        
         nameValueGetter(params:any) {
              params.data['prfComment'] = params.newValue;
              
              return true;
             
  }
}
