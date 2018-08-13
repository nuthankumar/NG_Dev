import { Component } from '@angular/core';
import { HttpClientModule, HttpClient } from '@angular/common/http';
import { ContestService } from '../../../services/contest.service'
import { ContestMasterList } from '../../../model/contest-list';
import { IDeviation } from '../../../model/deviation';
import {Router,ActivatedRoute, Params} from '@angular/router';
import {GridOptions} from "ag-grid/main";

@Component({
    selector: 'add-deviation',
    templateUrl: 'add-deviation.component.html',
    styleUrls: ['add-deviation.component.scss']
})
export class AddDeviationComponent {
    private lists:any;
    // private data:IDeviation[];
    loadDate : any;
    agentNo: any;
    netPayable: any;
    remarks: any;
    attachment:any=null;
    selectedValue:Object={}
     private gridOptions:GridOptions;
     someName:any;
     
    constructor(private contestservice: ContestService, private router:Router){
        this.gridOptions = <GridOptions>{};
          this.lists=[];
    }
    ngOnInit(){
        this.gridOptions.rowHeight=40;
        this.gridOptions.headerHeight=40;
       
        this.contestservice.getMasterContest().subscribe((lists)=>{
            debugger;
            this.lists=lists.data.contestMasters;
            console.log(lists);
          },(error)=>{
            console.log(error);
         })
         
    }
    form(){
        console.log(data);
        debugger;
        console.log()
        var getDate= this.loadDate;
       var newStr = getDate.replace(/-/g, "");
       var data =[{
           'loadDate' : newStr,
           'agentNo' : this.agentNo,
           'netAmount': this.netPayable,
           'remarks' : this.remarks,
           'contestId': this.selectedValue["contestId"],
           'startDate': this.selectedValue["startDate"],
           'endDate': this.selectedValue["endDate"],
           'contestName': this.selectedValue["contestName"],
           'attachment':this.attachment

        }]
        this.contestservice.updateDeviationCash(data).subscribe((data)=>{
          console.log(data);
          
        },(error)=>{
          console.log(error);
        });
     }
    
//     valueChange(list){
//     this.someName=this.list.contestName;
// }
   

}
