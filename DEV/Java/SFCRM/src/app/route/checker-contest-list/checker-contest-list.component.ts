import { Component } from '@angular/core';
import { HttpClientModule, HttpClient } from '@angular/common/http';
import { CheckerService } from '../../services/checker.service'
import { ICheckerList } from '../../model/master-contest';
import {Router} from '@angular/router';
import { GridOptions } from "ag-grid/main";



@Component({
    selector: 'checker-contest-list',
    templateUrl: 'checker-contest-list.component.html',
    styleUrls: ['checker-contest-list.component.scss']
})
export class CheckerContestListComponent {
     private lists:ICheckerList[];
          private gridOptions:GridOptions;

        constructor(private checkerService: CheckerService, private router:Router){
        this.gridOptions = <GridOptions>{};

    }
     columnDefs = [
         {headerName: 'Contest List', field: 'contestId',width:180 },
        {headerName: 'Contest Name', field: 'contestName' ,width:260},
        {headerName: 'AG Class', field: 'agType',width:180},
        {headerName: 'Agent Count', field: 'countOfAgentNo',width:180},
        {headerName: 'Net Payable', field: 'sumOfNetPayable',width:180},
        {headerName: 'Previous Net Payable', field: 'sumOfPreviousPaid',width:200}


    ];
    ngOnInit(){
          this.gridOptions.rowHeight=30;
    this.gridOptions.headerHeight=40;
        this.checkerService.getcheckerContestList().subscribe((lists)=>{
            this.lists=lists.data.checkerContestList;
            debugger
            console.log(lists)
          },(error)=>{
            console.log(error);
         })
         
    }
    onRowClicked(e:any){
        let data=e.data;
        let contestId=data.contestId;
       this.router.navigate(['/checkerContestListDetails', contestId ]); 
    }
}
