import { Component } from '@angular/core';
import { VendorService } from '../../../services/vendor.service'
import { Vendor } from '../../../model/vendor';
import {Router} from '@angular/router';
import {GridOptions} from "ag-grid/main";

@Component({
    selector: 'vendor',
    templateUrl: 'vendor.component.html',
    styleUrls: ['vendor.component.scss']
})
export class VendorComponent {
    private vendor:Vendor[];
    private gridOptions:GridOptions;
     constructor(private vendorService: VendorService, private router:Router){
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
        {headerName: 'Status', field: 'status'}


    ];
 ngOnInit(){
     this.gridOptions.rowHeight=40;
    this.gridOptions.headerHeight=40;
        this.vendorService.getVendorList().subscribe((vendor)=>{
            this.vendor=vendor.data;
            debugger
            console.log(vendor)
          },(error)=>{
            console.log(error);
         })
         
    }
    createList(){
        let vendor= new Vendor();
        this.vendorService.setter(vendor);
        this.router.navigate(['/addVendor']);
    }
    updateList(vendors:any)
    {
        debugger
        this.vendor = this.gridOptions.api.getSelectedRows();
        this.vendorService.setter(this.vendor[0]);
        this.router.navigate(['/editVendor'])
      }
}
