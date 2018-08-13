import { Component } from '@angular/core';
import { DestinationService } from '../../../services/destination.service'
import { Destination } from '../../../model/destination';
import {Router} from '@angular/router';
import {GridOptions} from "ag-grid/main";
@Component({
    selector: 'destination-data',
    templateUrl: 'destination-data.component.html',
    styleUrls: ['destination-data.component.scss']
})
export class DestinationDataComponent {
     private destination: Destination[];
     private gridOptions:GridOptions;
     constructor(private destinationService: DestinationService, private router:Router){
        this.gridOptions = <GridOptions>{};
     }
    columnDefs = [
        { field: '',width: 60, headerCheckboxSelection: true, headerCheckboxSelectionFilteredOnly: true,
        checkboxSelection: true, suppressSorting: true, suppressMenu: true},
        {headerName: 'TransAutoId', field: 'transAutoId' ,},
        {headerName: 'Destination ID', field: 'destID' },
        {headerName: 'Dest Name', field: 'destName'},
        {headerName: 'Dest Description', field: 'destDescrp'}
    ];
    ngOnInit(){
        this.gridOptions.rowHeight=40;
        this.gridOptions.headerHeight=40;
        this.destinationService.getDestinationList().subscribe((destination)=>{
            this.destination=destination.data;
            debugger
            console.log(destination)
          },(error)=>{
            console.log(error);
         })
    }
    updateList(destinations:any)
    {
        this.destination = this.gridOptions.api.getSelectedRows();
        this.destinationService.setter(this.destination[0]);
        this.router.navigate(['/editDestination'])
      }
      createList(){
        let destination= new Destination();
        this.destinationService.setter(destination);
        this.router.navigate(['/addDestination']);
    }
}

