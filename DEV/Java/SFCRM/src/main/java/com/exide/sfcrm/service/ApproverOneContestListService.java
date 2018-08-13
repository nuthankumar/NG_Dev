package com.exide.sfcrm.service;

import java.util.List;
import java.util.Map;

public interface ApproverOneContestListService {

	/**
	 * This method is used to get the contest list for maker.
	 * 
	 * @param userName
	 * @return
	 */
	public Map<String, Object> getApproverOneContestList(String userId,
			int pageNumber, int limit);

	public int updateTransactionCashApproverOne(String approverId,
			String approverName, List<Map<String, String>> json);

	public List<Object> getApproverOnePRFGeneratedCash(Integer prfNoGenREF);

	public Map<String, Object> getApproveOneTickets(String userId,
			Integer pageNumber, Integer limit);

	public int updateApproverOneTransactionTicket(String approverId,
			String approverName, List<Map<String, String>> json);

}
