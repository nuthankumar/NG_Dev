import { Component } from '@angular/core';
import { ContestService } from '../../services/contest.service'
import { ContestMasterList } from '../../model/contest-list';
import {GridOptions} from "ag-grid/main";
import {Router} from '@angular/router';


@Component({
    selector: 'contest-master-list',
    templateUrl: 'contest-master-list.component.html',
    styleUrls: ['contest-master-list.component.scss']
})
export class ContestMasterListComponent {
    private lists:ContestMasterList[];
     private gridOptions:GridOptions;
    constructor(private contestservice: ContestService, private router:Router){
        this.gridOptions = <GridOptions>{};

    }
     columnDefs = [
        {headerName: 'SL No', field: 'contestAutoId',width: 140 },
        {headerName: 'Contest ID', field: 'contestId',width: 160 },
        {headerName: 'Contest Name', field: 'contestName',width: 160},
        {headerName: 'Start Date', field: 'startDate',width: 160},
        {headerName: 'End Date', field: 'endDate',width: 140},
        {headerName: 'AG Types', field: 'agTypes',width: 140},
        {headerName: 'Category', field: 'incentive_YorN',width: 140},
        {headerName: 'Channel', field: 'channel',width: 140},
        {headerName: 'Status', field: '',width: 140}
     ];
    
     ngOnInit(){
        this.gridOptions.rowHeight=40;
        this.gridOptions.headerHeight=40;
        this.contestservice.getMasterContest().subscribe((lists)=>{
            this.lists=lists.data.contestMasters;
            console.log(lists);
          },(error)=>{
            console.log(error);
         })
         
    }
}
