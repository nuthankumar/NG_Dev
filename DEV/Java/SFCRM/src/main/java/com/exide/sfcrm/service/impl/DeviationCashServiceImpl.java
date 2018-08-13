package com.exide.sfcrm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exide.sfcrm.constants.PropertyConstants;
import com.exide.sfcrm.dao.DeviationListDao;
import com.exide.sfcrm.model.DeviationCashView;
import com.exide.sfcrm.repository.DeviationRepository;
import com.exide.sfcrm.repository.MakerAgentWiseContestListRepository;
import com.exide.sfcrm.repository.TblTransactionCashRepository;
import com.exide.sfcrm.service.DeviationCashService;
/**
 * 
 * @author vasavivr
 *
 */
@Service
public class DeviationCashServiceImpl implements DeviationCashService {

	@Autowired
	private DeviationRepository deviationRepository;

	@Autowired
	private TblTransactionCashRepository tblTransactionCashRepository;
	
	@Autowired
	private MakerAgentWiseContestListRepository makerAgentWiseContestListRepository;

	@Autowired
	private PropertyConstants propertyConstants;

	@Autowired
	private DeviationListDao deviationListDao;

	@Override
	public Map<String, Object> getDeviationListCash(String userId,
			int pageNumber, int limit) {
		List<DeviationCashView> cashList = deviationRepository
				.getDeviationListCash(userId, pageNumber,
						propertyConstants.PAGE_LIMIT);
		Integer totalNoOfdeviationCash = deviationRepository
				.getDeviationCashCount(userId);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("deviationListCash", cashList);
		data.put("deviationListCashCount", totalNoOfdeviationCash);
		insertTmpDeviationCashData(cashList);
		return data;

	}

	private void insertTmpDeviationCashData(List<DeviationCashView> cashList) {
		deviationListDao.insertTmpDeviationCashData(cashList);
	}

	@Override
	public int updateTransactionCashDeviation(String deviationApprId,
			String deviationApprName, List<Map<String, String>> json) {
		String contestId = null;
		String agentNo = null;
		String remarks = null;

		for (Map<String, String> rows : json) {
			contestId = rows.get("contestId");
			agentNo = rows.get("agentNo");
			remarks = rows.get("remarks");
		}

		Integer data = tblTransactionCashRepository
				.updateTransactionCashDeviation(deviationApprId,
						deviationApprName, remarks, Integer.valueOf(contestId),
						agentNo);

		return data;

	}

	@Override
	public int rejectTransactionCashDeviation(String deviationApprId,
			String deviationApprName, List<Map<String, String>> json) {
		String contestId = null;
		String agentNo = null;
		String remarks = null;

		for (Map<String, String> rows : json) {
			contestId = rows.get("contestId");
			agentNo = rows.get("agentNo");
			remarks = rows.get("remarks");
		}
		return tblTransactionCashRepository.rejectTransactionCashDeviation(
				deviationApprId, deviationApprName, remarks,
				Integer.valueOf(contestId), agentNo);
	}

	@Override
	public void addDeviation(List<Map<String, String>> json, String userId) {

		for (Map<String, String> rows : json) {
			String contestId = rows.get("contestId");
			String agentNo = rows.get("agentNo");
			String startDate = rows.get("startDate");
			String contestName=rows.get("contestName");
			String endDate = rows.get("endDate");
			String loadDate = rows.get("loadDate");
			String netAmount = rows.get("netAmount");
			String attachment = rows.get("attachment");
			String remarks = rows.get("remarks");
			callSp(userId, contestId, agentNo,contestName, startDate, endDate, loadDate,
					netAmount,attachment,remarks); 

		}

	}
	private void callSp(String userId, String contestId, String agentNo,String contestName,
			String startDate, String endDate, String loadDate,
			String netAmount,  String attachment, String remarks) {
		tblTransactionCashRepository.executeAddDeviation(userId,
				Integer.valueOf(contestId), agentNo, contestName,Integer.valueOf(startDate), Integer.valueOf(endDate),
				Integer.valueOf(loadDate), Float.valueOf(netAmount), attachment, remarks);
		tblTransactionCashRepository.updateNetPayableCalc();
		tblTransactionCashRepository.updateBalancePayableCalc();
	}

}
