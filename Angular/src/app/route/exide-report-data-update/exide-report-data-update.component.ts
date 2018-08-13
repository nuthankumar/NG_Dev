import { Component } from "@angular/core";
import { HttpClientModule, HttpClient } from "@angular/common/http";
import { ContestService } from "../../services/contest.service"
import { IMasterContent } from "../../model/master-contest";
import { Router } from "@angular/router";
import { GridOptions } from "ag-grid/main";
@Component({
    selector: "exide-report-data-update",
    templateUrl: "exide-report-data-update.component.html",
    styleUrls: ["exide-report-data-update.component.scss"]
})
export class ExideReportDataUpdateComponent {
    private lists: IMasterContent[];
    pagination: true;
    private gridOptions: GridOptions;
    paginationPageSize: 10;
    constructor(private contestservice: ContestService, private router:Router){
        this.gridOptions = <GridOptions>{};
    }
    columnDefs = [
        {headerName: "ContestID", field: "contestId",width: 100 },
        {headerName: "Contest Name", field: "contestName",width: 140 },
        {headerName: "Agent No", field: "agentNo",width: 100},
        {headerName: "DOJ", field: "doj",width: 100},
        {headerName: "DOT", field: "dot",width: 100},
        {headerName: "Period", field: "period",width: 100},
        {headerName: "Start_Date", field: "startDate",width: 140},
        {headerName: "End_Date", field: "endDate",width: 140},
        {headerName: "AgType", field: "agType",width: 100},
        {headerName: "1", field: "_1",width: 60},
        {headerName: "2", field: "_2",width: 60},
        {headerName: "3", field: "_3",width: 60},
        {headerName: "4", field: "_4",width: 60},
        {headerName: "5", field: "_5",width: 60},
        {headerName: "6", field: "_6",width: 60},
        {headerName: "7", field: "_7",width: 60},
        {headerName: "8", field: "_8",width: 60},
        {headerName: "9", field: "_9",width: 60},
        {headerName: "10", field: "_10",width: 60},
        {headerName: "11", field: "_11",width: 60},
        {headerName: "12", field: "_12",width: 60},
        {headerName: "13", field: "_13",width: 60},
        {headerName: "14", field: "_14",width: 60},
        {headerName: "15", field: "_15",width: 60},
        {headerName: "16", field: "_16",width: 60},
        {headerName: "17", field: "_17",width: 60},
        {headerName: "18", field: "_18",width: 60},
        {headerName: "19", field: "_18",width: 60},
        {headerName: "20", field: "_18",width: 60},
        {headerName: "21", field: "_18",width: 60},
        {headerName: "22", field: "_18",width: 60},
        {headerName: "23", field: "_18",width: 60},
        {headerName: "24", field: "_18",width: 60},
        {headerName: "25", field: "_18",width: 60},
        {headerName: "26", field: "_18",width: 60},
        {headerName: "27", field: "_18",width: 60},
        {headerName: "28", field: "_18",width: 60},
        {headerName: "29", field: "_18",width: 60},
        {headerName: "30", field: "_18",width: 60},
        {headerName: "31", field: "_18",width: 60},
        {headerName: "32", field: "_18",width: 60},
        {headerName: "33", field: "_18",width: 60},
        {headerName: "34", field: "_18",width: 60},
        {headerName: "35", field: "_18",width: 60},
    ];
    ngOnInit(){
        this.gridOptions.rowHeight=40;
        this.gridOptions.headerHeight=40;
        this.contestservice.getExideReportUpdate().subscribe((lists)=>{
            this.lists=lists.data;
            console.log(lists)
          },(error)=>{
            console.log(error);
         })
    }
}
