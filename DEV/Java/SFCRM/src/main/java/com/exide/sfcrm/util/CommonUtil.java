/**
 * 
 */
package com.exide.sfcrm.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.exide.sfcrm.constants.PropertyConstants;
import com.exide.sfcrm.model.ServiceResponse;
import com.exide.sfcrm.model.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author saurabhp
 *
 */
@Component
public class CommonUtil {

	@Autowired
	private ObjectMapper objectMapper;

	@Autowired
	private PropertyConstants propertyConstants;

	/**
	 * Get Logged In username.
	 * 
	 * @return
	 */
	public String getUserName() {
		
		/*UserDetails userDetails = (UserDetails) SecurityContextHolder
				.getContext().getAuthentication().getPrincipal();

		return userDetails.getUser().getUserName();*/
		
		return null;
	}

	/**
	 * This method is used to set the service response.
	 * 
	 * @param message
	 * @param status
	 * @param data
	 * @return
	 * @throws JsonProcessingException
	 */
	public String serviceResponse(String message, boolean status, Object data)
			throws JsonProcessingException {

		ServiceResponse<Object> serviceResponse = new ServiceResponse<Object>();
		serviceResponse.setData(data);
		serviceResponse.setSuccess(status);
		serviceResponse.setMessage(message);
		return objectMapper.writeValueAsString(serviceResponse);
	}

	/**
	 * This method is used to get the offset value from page number.
	 * 
	 * @param pageNumber
	 * @return
	 */
	public Integer getOffset(int pageNumber) {
		if (pageNumber != 0 && pageNumber !=1) {
			return ((pageNumber - 1) * propertyConstants.PAGE_LIMIT + 1);
		} else
			return 0;

	}
	
	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	public User getLoggedInUser() throws Exception {
		
	    if ( SecurityContextHolder.getContext() != null && SecurityContextHolder.getContext().getAuthentication() != null && SecurityContextHolder.getContext().getAuthentication().getPrincipal() != null) {
	    	com.exide.sfcrm.authentication.UserDetails userDetails = (com.exide.sfcrm.authentication.UserDetails) SecurityContextHolder
					.getContext().getAuthentication().getPrincipal();
	    	return userDetails.getUser();
		} else return null;
    
	}

}
