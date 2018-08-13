package com.exide.sfcrm.service;


import java.util.List;
import java.util.Map;

/**
 * 
 * @author vasavivr
 *
 */
public interface ContestMasterService  {

	/**
	 * This method is used to get the ContestMaster table details.
	 * @param limit 
	 * @param  
	 */
     public	Map<String, Object> getContestMaster(Integer pageNumber , Integer limit);

	
	public Map<String, Object> getChannelList(boolean status, String userId,
			Integer pageNumber, Integer limit);




	public void addContest(List<Map<String, String>> json, String string);





}
