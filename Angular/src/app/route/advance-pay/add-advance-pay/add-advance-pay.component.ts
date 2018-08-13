import { Component } from '@angular/core';
import { HttpClientModule, HttpClient } from '@angular/common/http';
import { AgentMasterService } from '../../../services/agent-master.service'
import { IAgentMasterList } from '../../../model/agent-master';
import { IDeviation } from '../../../model/deviation';
import {Router,ActivatedRoute, Params} from '@angular/router';
import {GridOptions} from "ag-grid/main";
import { AdvancePayService } from '../../../services/advance-pay.service'
import { AdvancePay } from '../../../model/advance-pay';

@Component({
    selector: 'add-advance-pay',
    templateUrl: 'add-advance-pay.component.html',
    styleUrls: ['add-advance-pay.component.scss']
})
export class AddAdvancePayComponent {
     private gridOptions:GridOptions;
    private pages:number;
     private currentPageNumber= 1;
     pageSize:number;
     private lists:any;
     recoverable:any;
     advDate:any
     amount:any
     effStartDt:any
     maxRecoverblePerCycle:any
     remarks:any
     netBalance:any
     confAttchment:any
     is_edit:boolean=false;
     private selectedValue:Object={};
     constructor(private agentMasterService: AgentMasterService, private router:Router, private advancePayService:AdvancePayService){
        this.gridOptions = <GridOptions>{};
          
    }
     ngOnInit(){
        this.gridOptions.rowHeight=40;
        this.gridOptions.headerHeight=40;
       
        this.agentMasterService.getAgentList(this.currentPageNumber).subscribe((lists)=>{
            
            this.lists=lists.data.agentList;
            console.log(this.lists);
            this.pageSize = ((lists.data.agentListCount/20)+(lists.data.agentListCount % 20 !=0 ? 1 : 0));
            this.pageSize = Math.trunc( this.pageSize );
            this.pages = this.pageSize;
  });
         
         
    }
    form(){
         var getAdvDate= this.advDate;
       this.advDate= getAdvDate.replace(/-/g, "");
       var getEffStartDt= this.effStartDt;
       this.effStartDt= getEffStartDt.replace(/-/g, "");
   if(this.recoverable==true){
       this.recoverable=1;
       this.netBalance=this.amount;
   }else{
       this.recoverable=0;
       this.maxRecoverblePerCycle=0;
       this.netBalance=0;
   }
   
      var data=[{
                "agentNo":this.selectedValue["agentNo"],
                "advDate":this.advDate,
                "effStartDt":this.effStartDt,
                "amount":this.amount,
                "recoverable":this.recoverable,
                "remarks":this.remarks,
                "maxRecoverblePerCycle":this.maxRecoverblePerCycle,
                "netBalance":this.netBalance,
                "confAttchment":this.confAttchment
             }]
             this.advancePayService.updateAdvancePaymentsEntry(data).subscribe((data)=>{
          console.log(data);
          
          
        },(error)=>{
          console.log(error);
        });
    }
    
    checkboxState(){
        if(this.recoverable==true){
            this.is_edit=true;
        }else{
            this.is_edit=false;
        }
   }
}
