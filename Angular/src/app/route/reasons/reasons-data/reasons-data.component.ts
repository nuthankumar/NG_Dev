import { Component } from '@angular/core';
import { ReasonsService } from '../../../services/reasons.service'
import { Reasons } from '../../../model/reasons';
import {Router} from '@angular/router';
import {GridOptions} from "ag-grid/main";
@Component({
    selector: 'reasons-data',
    templateUrl: 'reasons-data.component.html',
    styleUrls: ['reasons-data.component.scss']
})
export class ReasonsDataComponent {
    private reasons:Reasons[];
    private gridOptions:GridOptions;
    constructor(private reasonsService: ReasonsService, private router:Router) {
        this.gridOptions = <GridOptions>{};
    }
    columnDefs = [
        { field: '',width: 60, headerCheckboxSelection: true,
        headerCheckboxSelectionFilteredOnly: true,
        checkboxSelection: true, suppressSorting: true,
                suppressMenu: true},
        {headerName: 'Code', field: 'code' ,},
        {headerName: 'Name', field: 'name' },
        {headerName: 'Description', field: 'description'},
        {headerName: 'Status', field: 'status',valueGetter: 'if(data.status==true){return "Active"}else {return "Inactive"}'}
    ];
   ngOnInit() {
        this.gridOptions.rowHeight=40;
        this.gridOptions.headerHeight=40;
        this.reasonsService.getReasonsList().subscribe((reasons) => {
            this.reasons=reasons.data;
            debugger
            console.log(reasons)
          },(error) => {
            console.log(error);
         })
         
    }
    updateList(reason:any){
        this.reasons = this.gridOptions.api.getSelectedRows();
        this.reasonsService.setter(this.reasons[0]);
        this.router.navigate(['/editReasons'])
    }
    updateReason(reason:any){
        this.reasons = this.gridOptions.api.getSelectedRows();
        this.reasonsService.setter(this.reasons[0]);
        this.router.navigate(['/editReasons'])
    }
    createList() {
        let reason= new Reasons();
        this.reasonsService.setter(reason);
        this.router.navigate(['/addReasons']);
    }
    valueNameSetter(params:any) {
        var data = params.data;
        console.log("data"+data);
        if(data.status==false) {
            data.status='Active'
            return true
        }
        else {
            data.status='Active';
            return false
        }
    }

}
