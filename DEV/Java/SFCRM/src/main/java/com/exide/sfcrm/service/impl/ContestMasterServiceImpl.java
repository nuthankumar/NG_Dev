package com.exide.sfcrm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exide.sfcrm.constants.PropertyConstants;
import com.exide.sfcrm.model.ChannelMaster;
import com.exide.sfcrm.model.ContestMaster;
import com.exide.sfcrm.repository.ChannelMasterRepository;
import com.exide.sfcrm.repository.ContestMasterRepository;
import com.exide.sfcrm.service.ContestMasterService;

/**
 * 
 * @author vasavivr
 *
 */

@Service
public class ContestMasterServiceImpl implements ContestMasterService {

	@Autowired
	ContestMasterRepository contestMasterRepository;

	@Autowired
	PropertyConstants propertyConstants;

	@Autowired
	ChannelMasterRepository channelMasterRepository;

	@Override
	public Map<String, Object> getContestMaster(Integer pageNumber,
			Integer limit) {
		List<ContestMaster> contestMasters = new ArrayList<ContestMaster>();
		Integer totalContestMasterCount = contestMasterRepository.getCount();
		contestMasters = contestMasterRepository.findAll(pageNumber,
				propertyConstants.PAGE_LIMIT);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("totalContestMasterCount", totalContestMasterCount);
		data.put("contestMasters", contestMasters);
		return data;
	}

	@Override
	public Map<String, Object> getChannelList(boolean status, String userId,
			Integer pageNumber, Integer limit) {
		List<ChannelMaster> channelMasters = new ArrayList<ChannelMaster>();
		Integer totalChannelMasterCount = channelMasterRepository.getCounts(
				status, userId);
		channelMasters = channelMasterRepository.getChannelList(status, userId,
				pageNumber, propertyConstants.PAGE_LIMIT);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("totalChannelMasterCount", totalChannelMasterCount);
		data.put("channelMasters", channelMasters);
		return data;
	}

	@Override
	public void addContest(List<Map<String, String>> json, String userId) {

		for (Map<String, String> rows : json) {
			String chkTrip = rows.get("chkTrip");
			String chkCash = rows.get("chkCash");
			String destId = rows.get("destId");
			String cashAmt = rows.get("cashAmt");
			String tripAmt = rows.get("tripAmt");
			String contestName = rows.get("contestName");
			String startDate = rows.get("startDate");
			String cid = rows.get("cid");
			String endDate = rows.get("endDate");
			String contestType = rows.get("contestType");
			String agtypes = rows.get("agtypes");
			String attachment = rows.get("attachment");
			callSp(userId, chkTrip, chkCash, destId, cashAmt, tripAmt,
					contestName, startDate, cid, endDate, contestType, agtypes,
					attachment);
		}
	}

	private void callSp(String userId, String chkTrip, String chkCash,
			String destId, String cashAmt, String tripAmt, String contestName,
			String startDate, String cid, String endDate, String contestType,
			String agtypes, String attachment) {
		contestMasterRepository.executeAddContest(userId,
				Boolean.valueOf(chkTrip), Boolean.valueOf(chkCash),
				Integer.valueOf(destId), Float.valueOf(cashAmt),
				Float.valueOf(tripAmt), contestName,
				Integer.valueOf(startDate), Integer.valueOf(cid),
				Integer.valueOf(endDate), contestType, agtypes, attachment);

	}
}
