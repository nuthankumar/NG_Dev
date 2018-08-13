export class IMasterContent {
    contestId:number;
    contestName:string;
    period:string;
    startDate:Date;
    endDate:Date;
    type:string;
    _1:string;
    _2:string;
    _3:string;
    _4:string;
    _5:string;
    _6:string;
    _7:string;
    _8:string;
    _9:string;
    _10:string;
    _11:string;
    _12:string;
    _13:string;
    _14:string;
    _15:string;
    _16:string;
    _17:string;
    _18:string;
    _19:string;
    _20:string;
    _21:string;
    _22:string;
    _23:string;
    _24:string;
    _25:string;
    _26:string;
    _27:string;
    _28:string;
    _29:string;
    _30:string;
}
export class IExideRuleEngine {
    id:number;
    criteria:string;
    period:string;
    type:string;
    seq:string;
    ruleName:string;
    payable:string;
    _1:string;
    _2:string;
    _3:string;
    _4:string;
    _5:string;
}
export class IExideReportDataUpdate {
    contestId:number;
    contestName:string;
    agentNo:string;
    DOJ:string
    DOT:string;
    period:string;
    startDate:Date;
    endDate:Date;
    agType:string;
    _1:string;
    _2:string;
    _3:string;
    _4:string;
    _5:string;
    _6:string;
    _7:string;
    _8:string;
    _9:string;
    _10:string;
    _11:string;
    _12:string;
    _13:string;
    _14:string;
    _15:string;
    _16:string;
    _17:string;
    _18:string;
    _19:string;
    _20:string;
    _21:string;
    _22:string;
    _23:string;
    _24:string;
    _25:string;
    _26:string;
    _27:string;
    _28:string;
    _29:string;
    _30:string;
    _31:string;
    _32:string;
    _33:string;
    _34:string;
    _35:string;
}
export class IMakerList {
    contestId:number;
    contestName:string;
    AgType:string;
    CountOfAgentNo:number;
    SumOfNetPayable:number;
    SumOfPreviousPaid:number;
}
export class IAgentWiseMakerList {
    contestId:number;
    contestName:string;
    agentNo:string;
    netAmount:number;
    previousNetPayable:number;
    netPayable:number;
    entryFlag:number;
    status:number;
    agentName:string;
    agType:string;
    validation:string;
    bankACNumber:string;
    ifscCode:string;
    dtTerm:Date;
    branchCode:string;
    remarks:string;
}
export class ICheckerList {
    contestId:number;
    contestName:string;
    agType:string;
    countOfAgentNo:number;
    sumOfNetPayable:number;
    sumOfPreviousPaid:number;
}