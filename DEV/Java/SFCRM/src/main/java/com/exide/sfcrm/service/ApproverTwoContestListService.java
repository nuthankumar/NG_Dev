package com.exide.sfcrm.service;

import java.util.List;
import java.util.Map;

public interface ApproverTwoContestListService {

	Map<String, Object> getApproverTwoContestList(String userId,
			int pageNumber,int limit);

	public int updateTransactionCashApproverTwo(String approverId,
			String approverName, List<Map<String, String>> json);

	List<Object> getApproverTwoPRFGeneratedCash(int prfNoGenREF);

	Map<String, Object> getApproveTwoTickets(String userId, Integer pageNumber,
			Integer limit);

	int updateApproverTwoTransactionTicket(String approverId,
			String approverName, List<Map<String, String>> json);


}
