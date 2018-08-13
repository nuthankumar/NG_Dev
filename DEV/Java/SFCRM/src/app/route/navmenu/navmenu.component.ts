import { Component } from '@angular/core';
import { Menu } from '../../model/menu';
import { MenuComponent } from '../menu/menu.component';

@Component({
    selector: 'navmenu',
    templateUrl: 'navmenu.component.html'
})
export class NavMenuComponent {
	menu: Array<Menu> = [{
		id:1,
		label:"User Mangement",
		levelName:"top",
		link:"#"
	},{
		id:2,
		label:"Master",
		levelName:"top",
		link:"#",
		children:[{
			id:1,
			label:"Agent Master List",
			levelName:"second",
			link:"/agentMasterList"
		}]
	},{
		id:3,
		label:"Deviation",
		levelName:"top",
		link:"#",
		children:[{
			id:1,
			label:"Deviation Approve",
			levelName:"second",
			link:"/deviation"
		},{
			id:1,
			label:"Tickets",
			levelName:"second",
			link:"#",
			children:[{
				id:1,
				label:"Deviation Entry",
				levelName:"third",
				link:"#"
			},{
				id:1,
				label:"Deviation Approval",
				levelName:"third",
				link:"#"
			}]
		}]
	}];
	constructor(){}
	ngOnInit(){}
}