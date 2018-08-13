import {Injectable} from "@angular/core";
import {Http, Response, RequestOptions, Headers} from "@angular/http";
import {Observable} from "rxjs/Observable";
import "rxjs/add/operator/map";
import "rxjs/add/operator/catch";
import {ITransactionCash} from "../model/transaction-cash";
import {IPRFList} from "../model/prf-list";
import {CommonService} from './common.service';
//import {Menu} from '../route/dashboard.component.model';

@Injectable()
export class ContestService {
    private apiURl  = "http://localhost:8090/SFCRM";
    private headers = new Headers({"content-Type": "application/json"});
    private options = new RequestOptions({headers: this.headers});
    constructor(private http: Http,private commonService: CommonService) {
    }
    getExideContest() {
        return this.http.get(this.apiURl + "/exideContest", this.options)
        .map((response: Response) => response.json());
    }
    getExideRuleEngine() {
        return this.http.get(this.apiURl + "/exideRuleEngine", this.options)
        .map((response: Response) => response.json());
    }
    getExideReportUpdate() {
        return this.http.get(this.apiURl + "/exidReportDataUpdate", this.options)
        .map((response: Response) => response.json());
    }
    getapproverOneContestList() {
        return this.http.get(this.apiURl + "/approverOneContestList?pageNumber=1", this.options)
        .map((response: Response) => response.json());
    }
    getapproverTwoContestList() {
        return this.http.get(this.apiURl + "/approverTwoContestList?pageNumber=1", this.options)
        .map((response: Response) => response.json());
    }
    getPRFList(agentTypes: any) {
        return this.http.get(this.apiURl + "/prfCashList?pageNumber=1&agentType=" + agentTypes, this.options)
        .map((response: Response) => response.json());
    }
    getagentTypes() {
        return this.http.get(this.apiURl + "/agentTypes", this.options)
        .map((response: Response) => response.json());
    }
    getChannelList(){
         return this.http.get(this.apiURl + "/channelList?pageNumber=1", this.options)
        .map((response: Response) => response.json());
    }
    getdeviationCashList() {
        return this.http.get(this.apiURl + "/deviationCashList?pageNumber=1", this.options)
        .map((response: Response) => response.json());
    }
    getMasterContest(){
        return this.http.get(this.apiURl + "/contestMaster?pageNumber=1", this.options)
        .map((response: Response) => response.json());
    }
    
    updateToApproverTwo(list: ITransactionCash): Observable<any> {
        return this.http.put(this.apiURl + "/updateApproverOneTransactionCash", JSON.stringify(list), this.options);
    }
    updateToPayout(list: ITransactionCash): Observable<any> {
        return this.http.put(this.apiURl + "/updateApproverTwoTransactionCash", JSON.stringify(list), this.options);
    }
    updateApproveDeviationCash(list: ITransactionCash): Observable<any> {
        return this.http.put(this.apiURl + "/approveDeviationCash", JSON.stringify(list), this.options);
    }
    rejectDeviationCash(list: ITransactionCash): Observable<any> {
        return this.http.put(this.apiURl + "/rejectDeviationCash", JSON.stringify(list), this.options);
    }
     updategeneratePrf(list: any): Observable<any> {
        return this.http.put(this.apiURl + "/generatePrf" , JSON.stringify(list), this.options);
    }
     updateDeviationCash(list: any): Observable<any> {
        return this.http.put(this.apiURl + "/deviationEntryCash" , JSON.stringify(list), this.options);
    }
    updateMasterContest(list: any): Observable<any> {
    return this.http.put(this.apiURl + "/addContest" , JSON.stringify(list), this.options);
}



getusers(){
debugger
    var token = this.commonService.getCsrfToken();
    return this.http.get(this.apiURl + "/user/userDetail", this.options)
        .map((response: Response) => response.json());
}
//method to get all the configured data from the configure.json
 getConfigJson() {
        return this.http.get("/src/configure.json")
    .map((response: Response) => response.json());
    } 


    // getConfigJson(): Observable<Menu> {
    // return this.http.get('src/assets/data/configure.json')
    // .map(res=>res.json());
    //  } 

}
