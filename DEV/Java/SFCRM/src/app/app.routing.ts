import { RouterModule, Routes } from "@angular/router";
import { NgModule } from "@angular/core";
import { ContestMasterComponent } from "./route/contest-master/contest-master.component";
import { DashboardComponent } from "./route/dashboard/dashboard.component";
import { ExideRuleEngineComponent } from "./route/exide-rule-engine/exide-rule-engine.component";
import { PrfListComponent } from "./route/prf-list/prf-list.component";
import { ExideReportDataUpdateComponent } from "./route/exide-report-data-update/exide-report-data-update.component";
import { MakerContestListComponent } from "./route/maker-contest-list/maker-contest-list.component";
import { MakerContestListDetailComponent } from "./route/maker-contest-list-detail/maker-contest-list-detail.component";
import { AgentMasterListComponent } from "./route/agent-master/agent-master-list/agent-master-list.component";
import { CheckerContestListComponent } from "./route/checker-contest-list/checker-contest-list.component";
import { AddDeviationComponent } from "./route/deviation/add-deviation/add-deviation.component";
import { VendorComponent } from "./route/vendor/vendor-data/vendor.component";
import { VendorAddComponent } from "./route/vendor/vendor-add/vendor-add.component";
import { VendorEditComponent } from "./route/vendor/vendor-edit/vendor-edit.component";
import { ReasonsAddComponent } from "./route/reasons/reasons-add/reasons-add.component";
import { ReasonsEditComponent } from "./route/reasons/reasons-edit/reasons-edit.component";
import { DeviationApprovalComponent } from "./route/deviation/deviation-approval/deviation-approval.component";

import { ReasonsDataComponent } from "./route/reasons/reasons-data/reasons-data.component";
import { DestinationDataComponent } from "./route/destination/destination-data/destination-data.component";
import { DestinationAddComponent } from "./route/destination/destination-add/destination-add.component";
import { DestinationEditComponent } from "./route/destination/destination-edit/destination-edit.component";
import { CheckerContestListDetailComponent } from "./route/checker-contest-list-detail/checker-contest-list-detail.component";
import { ApproverOneContestViewComponent } from "./route/approver-one-contest-view/approver-one-contest-view.component";
import { ApproverTwoContestViewComponent } from "./route/approver-two-contest-view/approver-two-contest-view.component";
import { LoginComponent } from "./route/login/login.component";
import { ContestMasterListComponent } from "./route/contest-master-list/contest-master-list.component";
import { AdvancePayMakerComponent } from "./route/advance-pay/advance-pay-maker/advance-pay-maker.component";
import { AdvancePayCheckerComponent } from "./route/advance-pay/advance-pay-checker/advance-pay-checker.component";
import { AddAdvancePayComponent } from "./route/advance-pay/add-advance-pay/add-advance-pay.component";
import { AddContestMasterComponent } from "./route/add-contest-master/add-contest-master.component";
import { NavMenuComponent } from "./route/navmenu/navmenu.component";
import { MenuComponent } from './route/menu/menu.component';

const APP_ROUTES: Routes = [
    { path: "login", component: LoginComponent},    
    {   
        path: "",
        component: DashboardComponent,
        children: [
            { path: "exideContest", component: ContestMasterComponent  },
            { path: "exideRuleEngine", component: ExideRuleEngineComponent },
            { path: "exideReportDataUpdate", component: ExideReportDataUpdateComponent },
            { path: "makerContestList", component: MakerContestListComponent },
            { path: "makerContestListDetails/:contestId", component: MakerContestListDetailComponent },
            { path: "agentMasterList", component: AgentMasterListComponent },
            { path: "checkerContestList", component: CheckerContestListComponent },
            { path: "checkerContestListDetails/:contestId", component: CheckerContestListDetailComponent },
            { path: "approveOne", component: ApproverOneContestViewComponent },
            { path: "approveTwo", component: ApproverTwoContestViewComponent },
            { path: "prfList", component: PrfListComponent },
            { path: "deviation", component: DeviationApprovalComponent },
            { path: "vendor", component: VendorComponent },
            { path: "addVendor", component: VendorAddComponent },
            { path: "editVendor", component: VendorEditComponent },
            { path: "reasons", component: ReasonsDataComponent },
            { path: "addReasons", component: ReasonsAddComponent },
            { path: "editReasons", component: ReasonsEditComponent },    
            { path: "contestmaster", component: ContestMasterListComponent },
            { path: "destination", component: DestinationDataComponent },
            { path: "addDestination", component: DestinationAddComponent },
            { path: "editDestination", component: DestinationEditComponent },
            { path: "advancePay", component: AdvancePayMakerComponent },
            { path: "advancePayChecker", component: AdvancePayCheckerComponent },
            { path: "addDeviation", component: AddDeviationComponent },
            { path: "addAdvancePay", component: AddAdvancePayComponent },
            { path: "addContest", component: AddContestMasterComponent }
        ]
    }
    
];

@NgModule({
    imports: [RouterModule.forRoot(APP_ROUTES)],
    exports: [RouterModule]
})
export class AppRoutingModule { }
