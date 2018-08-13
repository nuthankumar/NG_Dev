import {Injectable} from "@angular/core";
import {Http, Response, RequestOptions, Headers} from "@angular/http";
import "rxjs/add/operator/map";
import "rxjs/add/operator/catch";
@Injectable()
export class AgentMasterService {
    private apiURl  = "http://localhost:8090/SFCRM";
    private headers = new Headers({"content-Type": "application/json"});
    private options = new RequestOptions({headers: this.headers});
    constructor(private http: Http) {
    }
    getAgentList(currentPageNumber: number) {
        return this.http.get(this.apiURl + "/agentList?pageNumber=" + currentPageNumber, this.options)
        .map((response: Response) => response.json());
    }
}
