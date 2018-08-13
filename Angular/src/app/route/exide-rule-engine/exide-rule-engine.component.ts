import { Component } from "@angular/core";
import { HttpClientModule, HttpClient } from "@angular/common/http";
import { ContestService } from "../../services/contest.service"
import { IMasterContent } from "../../model/master-contest";
import { Router } from "@angular/router";
import { GridOptions } from "ag-grid/main";
@Component({
    selector: "exide-rule-engine",
    templateUrl: "exide-rule-engine.component.html",
    styleUrls: ["exide-rule-engine.component.scss"]
})
export class ExideRuleEngineComponent {
    private lists = IMasterContent;
    private gridOptions: GridOptions;
    constructor(private contestservice: ContestService, private router: Router){
        this.gridOptions = <GridOptions>{};
    }
    columnDefs = [
        {headerName: "Criteria", field: "criteria",width: 140},
        {headerName: "Period", field: "period",width: 140},
        {headerName: "Type", field: "type",width: 140},
        {headerName: "Seq", field: "seq",width: 140},
        {headerName: "Rule Name", field: "ruleName",width: 140},
        {headerName: "1", field: "_1",width: 60},
        {headerName: "2", field: "_2",width: 60},
        {headerName: "3", field: "_3",width: 60},
        {headerName: "4", field: "_4",width: 60},
        {headerName: "5", field: "_5",width: 60},
        {headerName: "Payable", field: "payable",width: 130}
    ];
    ngOnInit(){
          this.gridOptions.rowHeight=40;
          this.gridOptions.headerHeight=40;
          this.contestservice.getExideRuleEngine().subscribe((lists) => {
            this.lists=lists.data;
            console.log(lists)
          },(error)=>{
            console.log(error);
         })
    }
}
