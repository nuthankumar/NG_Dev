package com.exide.sfcrm.service;

import java.util.List;
import java.util.Map;

public interface DeviationTicketsService {

	Map<String, Object> getDeviationTicketsList(String userId, Integer pageNumber,
			Integer limit);

	int updateTransactionTicketDeviation(String deviationApprId,
			String deviationApprName, List<Map<String, String>> json);

	int rejectTransactionTicketsDeviation(String deviationApprId,
			String deviationApprName, List<Map<String, String>> json);

	void addDeviation(List<Map<String, String>> json, String userId);

	

}
