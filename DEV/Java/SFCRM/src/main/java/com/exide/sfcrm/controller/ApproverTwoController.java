package com.exide.sfcrm.controller;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exide.sfcrm.constants.ApplicationConstants;
import com.exide.sfcrm.constants.MessageConstants;
import com.exide.sfcrm.constants.PropertyConstants;
import com.exide.sfcrm.service.ApproverTwoContestListService;
import com.exide.sfcrm.service.AuditLogService;
import com.exide.sfcrm.util.CommonUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 
 * @author vasavivr
 *
 */
@Controller
public class ApproverTwoController {

	/**
	 * Logger.
	 */
	private static final Logger LOGGER = Logger
			.getLogger(ApproverTwoController.class);

	@Autowired
	ApproverTwoContestListService approverTwoContestListService;

	@Autowired
	ObjectMapper objectMapper;

	@Autowired
	private AuditLogService activityLogService;

	@Autowired
	private CommonUtil commonUtil;
	
	@Autowired
	PropertyConstants propertyConstants;

	@RequestMapping(value = { "/approverTwoContestList" }, method = RequestMethod.GET)
	@ResponseBody
	public String getApproverTwoContestList(
			@RequestParam("pageNumber") int pageNumber) {

		String response = null;
		try {
			Map<String, Object> data = approverTwoContestListService
					.getApproverTwoContestList("neethub", commonUtil.getOffset(pageNumber),propertyConstants.PAGE_LIMIT);

			response = commonUtil.serviceResponse(
					MessageConstants.SUCCESS_RESPONSE,
					ApplicationConstants.TRUE, data);
			activityLogService
					.addActivity(
							"Get agent details",
							"Success",
							"Get approverTwo ContestList request completed successfully",
							data.toString(), commonUtil.getUserName());
		} catch (Exception e) {
			LOGGER.error(
					"Error occured while getting approverTwo ContestList details "
							+ e, e);

			try {
				response = commonUtil.serviceResponse(
						MessageConstants.EXCEPTION_RESPONSE,
						ApplicationConstants.FALSE, null);
			} catch (JsonProcessingException e1) {
				LOGGER.error(
						"Error occured while converting response object in catch block of get approverTwo ContestList details"
								+ e1, e1);
				activityLogService
						.addActivity(
								"get approverTwo ContestList details",
								"Success",
								"Get approverTwo ContestList details request completed successfully",
								"", commonUtil.getUserName());
			}
		}
		return response;

	}

	@RequestMapping(value = { "/updateApproverTwoTransactionCash" }, method = RequestMethod.PUT)
	@ResponseBody
	public String updateApproverTwoTransactionCash(
			@RequestBody List<Map<String, String>> json) {
		/*
		 * http://localhost:8090/SFCRM/updateApproverTwoTransactionCash?remarks=
		 * Approved&prfNoGenRef=2
		 */String response = null;
		try {
			String approverId = "NULL", approverName = "NULL";
			int update = approverTwoContestListService
					.updateTransactionCashApproverTwo(approverId, approverName,
							json);
			response = commonUtil.serviceResponse(MessageConstants.SUCCESS,
					ApplicationConstants.TRUE, null);
			activityLogService.addActivity("Update approval Two ", "Success",
					"Updating approval Two completed successfully",
					String.valueOf(update), commonUtil.getUserName());
		} catch (Exception e) {
			LOGGER.error(
					"Error occured while updating approverTwo Transaction Cash details "
							+ e, e);
			try {
				response = commonUtil.serviceResponse(
						MessageConstants.EXCEPTION_RESPONSE,
						ApplicationConstants.FALSE, null);
			} catch (JsonProcessingException e1) {
				LOGGER.error(
						"Error occured while converting response object in catch block of Update approval1"
								+ e1, e1);
				activityLogService.addActivity("Update approval Two ",
						"Success",
						"Updating approval Two completed successfully", "",
						commonUtil.getUserName());
			}
		}
		return response;

	}

	@RequestMapping(value = { "/approverTwoPRFGeneratedCash" }, method = RequestMethod.GET)
	@ResponseBody
	public String getApproverOnePRFGeneratedCash(
			@RequestParam(value = "prfNoGenREF") int prfNoGenREF) {
		/*
		 * http://localhost:8090/SFCRM/approverOnePRFGeneratedCash?prfNoGenREF=2
		 */String response = null;

		try {
			List<Object> approverTwoPrfGeneratedCashList = approverTwoContestListService
					.getApproverTwoPRFGeneratedCash(prfNoGenREF);
			response = commonUtil.serviceResponse(
					MessageConstants.SUCCESS_RESPONSE,
					ApplicationConstants.TRUE, approverTwoPrfGeneratedCashList);

			activityLogService
					.addActivity(
							"Get agent details",
							"Success",
							"Get approverTwo PrfGeneratedCashList request completed successfully",
							approverTwoPrfGeneratedCashList.toString(),
							commonUtil.getUserName());
		} catch (Exception e) {
			LOGGER.error(
					"Error occured while getting approverTwo PrfGeneratedCashList details "
							+ e, e);

			try {
				response = commonUtil.serviceResponse(
						MessageConstants.EXCEPTION_RESPONSE,
						ApplicationConstants.FALSE, null);
			} catch (JsonProcessingException e1) {
				LOGGER.error(
						"Error occured while converting response object in catch block of get approverTwo PrfGeneratedCashList details"
								+ e1, e1);
				activityLogService
						.addActivity(
								"get approverTwo PrfGeneratedCashList",
								"Success",
								"Get approverTwo PrfGeneratedCashList request completed successfully",
								"", commonUtil.getUserName());
			}
		}
		return response;

	}
	@RequestMapping(value = { "/approveTwoTickets" }, method = RequestMethod.GET)
	@ResponseBody
	public String getApproveTwoTickets(
			@RequestParam(value = "pageNumber") int pageNumber) {

		String response = null;
		try {

			Map<String, Object> data = approverTwoContestListService
					.getApproveTwoTickets("vasavivr",
							commonUtil.getOffset(pageNumber),
							propertyConstants.PAGE_LIMIT);
			response = commonUtil.serviceResponse(
					MessageConstants.SUCCESS_RESPONSE,
					ApplicationConstants.TRUE, data);
			activityLogService
					.addActivity(
							"Get agent details",
							"Success",
							"Get approverTwo TicketList request completed successfully",
							data.toString(), commonUtil.getUserName());
		} catch (Exception e) {
			LOGGER.error(
					"Error occured while getting approverTwo TicketList details "
							+ e, e);
			try {
				response = commonUtil.serviceResponse(
						MessageConstants.EXCEPTION_RESPONSE,
						ApplicationConstants.FALSE, null);
			} catch (JsonProcessingException e1) {
				LOGGER.error(
						"Error occured while converting response object in catch block of Update approvalTwo"
								+ e1, e1);
				activityLogService.addActivity("Update approvalTwo", "Success",
						"Updating approvalTwo completed successfully", "",
						commonUtil.getUserName());
			}
		}
		return response;
	}
	@RequestMapping(value = { "/updateApproverTwoTransactionTicket" }, method = RequestMethod.PUT)
	@ResponseBody
	public String updateApproverTwoTransactionTicket(
			@RequestBody List<Map<String, String>> json) {
	
		 String response = null;
		try {
			String approverId = "NULL", approverName = "NULL";
			int update = approverTwoContestListService
					.updateApproverTwoTransactionTicket(approverId, approverName,
							json);
			response = commonUtil.serviceResponse(MessageConstants.SUCCESS,
					ApplicationConstants.TRUE, null);
			activityLogService.addActivity("Update approval one ", "Success",
					"Updating approval two completed successfully",
					String.valueOf(update), commonUtil.getUserName());
		} catch (Exception e) {
			LOGGER.error(
					"Error occured while updating approverTwo Transaction Ticket details "
							+ e, e);
			try {
				response = commonUtil.serviceResponse(
						MessageConstants.EXCEPTION_RESPONSE,
						ApplicationConstants.FALSE, null);
			} catch (JsonProcessingException e1) {
				LOGGER.error(
						"Error occured while converting response object in catch block of Update approval two"
								+ e1, e1);
				activityLogService.addActivity("Update approval two", "Success",
						"Updating approval two completed successfully", "",
						commonUtil.getUserName());
			}
		}
		return response;

	}
}
