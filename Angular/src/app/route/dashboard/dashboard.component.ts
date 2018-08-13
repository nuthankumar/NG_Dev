import { Component } from '@angular/core';
import { ContestService } from '../../services/contest.service'
import { CommonService } from '../../services/common.service'
import{Menu} from '../dashboard/dashboard.component.model';
import { Router } from '@angular/router'; 
//import {VERSION} from '@angular/material';

@Component({
    selector: 'dashboard',
    templateUrl: 'dashboard.component.html',
    styleUrls: ['dashboard.component.scss']
})
export class DashboardComponent {

  // version = VERSION;

    masterDataArr:any={};
    listOfMenuDropDown:any={};
    // selectNotificationOldNewType1:any={};
    // selectNotificationOldNewType2:any={};

    userDetails:any;
    checkMaker:boolean;
    configurationDetails:any[] =[];



      navItems: Menu[] = [
          {
          id:"1",
          label: 'User Mangement',
          levelName: 'feedback',
          link: '#'
        },
        {
          id:"1",
          label: 'Master',
          levelName: 'group',
          children: [
            {
              id:"1",
              label: 'Agent Master List',
              levelName: 'person',
              link: '/agentMasterList'
            },
            {
              id:"1",
              label: 'Contest',
              levelName: 'person',
              
            },
            {
              id:"1",
              label: 'Destination',
              levelName: 'person',
            },
            {
              id:"1",
              label: 'Reasons',
              levelName: 'person',
            },
            {
              id:"1",
              label: 'Agent Greglist',
              levelName: 'person',
            },
            {
              id:"1",
              label: 'Vendor Master',
              levelName: 'person',
            }
          ]
        },
        {
          id:"1",  
          label: 'Contest Data',
          levelName: 'speaker_notes',
          children: [
            {
              id:"1",
              label: 'Exide Contest',
              levelName: 'star_rate',
            },
            {
              id:"1",  
              label: 'Exide Report Data Update',
              levelName: 'star_rate',
            },
            {
              id:"1", 
              label: 'Exide Rule Engine',
              levelName: 'star_rate',
            }
          ]
        },
        {
          id:"1",
          label: 'Advance',
          levelName: 'feedback',
            children: [
            {
              id:"1",  
              label: 'Advance Payment',
              levelName: 'star_rate',
            },
            {
              id:"1",  
              label: 'Maker List',
              levelName: 'star_rate',
            },
            {
              id:"1",  
              label: 'Checker List',
              levelName: 'star_rate',
            }
          ]
        },
        
        {
           id:"1", 
          label: 'Deviation',
          levelName: 'feedback',
              children: [
            {
              id:"1",
              label: 'Deviation Approve',
              levelName: 'Cash',
            },
            {
              id:"1",  
              label: 'Maker List',
              levelName: 'star_rate',
                children: [
            {
              id:"1", 
              label: 'Deviation Approve',
              levelName: 'Cash',
            }
           ],
          }
         ]


        },
        {
          id:"1",
          label: 'PRF',
          levelName: 'feedback',
           children: [
            {
              id:"1",  
              label: 'Maker Queue',
              levelName: 'person',
            }
          ]
        },
        {
          id:"1",
          label: 'Vendor PRF',
          levelName: 'feedback',
           children: [
            {
              id:"1",  
              label: 'Vendor Trasaction',
              levelName: 'person',
            },
             {
              id:"1",   
              label: 'PreVendor List',
              levelName: 'person',
            }
          ]
        }
        // {
        //   id:"1", 
        //   label: 'Reports',
        //   levelName: 'feedback',
        // }
      ]
    

    constructor(private contestService:ContestService,private router: Router){
    }



    ngOnInit(){
    debugger
    this.contestService.getusers().subscribe((userDetails) => {
    debugger
    this.userDetails=userDetails.data.user.userGroup[0].name;
    //  this.checkMaker=true;
    console.log("user details"+this.userDetails);
    //console.log(this.navItems);
    this.routeOtherPages();
   });	
 
}


// to navigate to required page based upon the response
    routeOtherPages(){      
        debugger
      if(this.userDetails === "Maker") {
          //this.listOfMenuDropDown = this.masterDataArr;
          console.log(this.listOfMenuDropDown);
          this.router.navigate(['/makerContestList']); 
         //this.getRuleConditionDropDownValues();
      }else if(this.userDetails === "Checker") {
         this.router.navigate(['/checkerContestList']); 
      }else{
          this.router.navigate(['/login']); 
      }
    }


// to get the data from the config json 
  getRuleConditionDropDownValues() {
      debugger
        this.contestService.getConfigJson().subscribe(data => {
            this.masterDataArr = data;
            console.log(this.masterDataArr)
        });
    } 




}
