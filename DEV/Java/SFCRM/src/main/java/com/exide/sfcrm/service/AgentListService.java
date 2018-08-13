package com.exide.sfcrm.service;

import java.util.Map;

/**
 * 
 * @author vasavivr
 *
 */
public interface AgentListService {
	/**
	 * This method is used to get the AgentList
	 * @param userName
	 * @return
	 */

	 Map<String,Object> getAgentList(String userName, int pageNumber, int limit);

}
