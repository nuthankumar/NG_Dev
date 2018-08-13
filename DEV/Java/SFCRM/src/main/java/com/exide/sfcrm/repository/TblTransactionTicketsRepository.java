package com.exide.sfcrm.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.exide.sfcrm.model.TblTransactionTickets;

/**
 * 
 * @author vasavivr
 *
 */

@Repository
@Transactional
public interface TblTransactionTicketsRepository extends
		JpaRepository<TblTransactionTickets, Long> {

	@Modifying
	@Query("UPDATE TblTransactionTickets tc SET tc.status = 1,tc.maker1UID = :makerId "
			+ ", tc.makerName = :makerName , tc.makerDate=((YEAR(GETDATE()))* "
			+ "100+MONTH(GETDATE()))*100+DAY(GETDATE()),tc.makerTime = GETDATE() "
			+ ", tc.approver1Remarks = :remarks where tc.status = 0 and tc.validFlag=1 and "
			+ "tc.paymentFlag=1 and tc.contestID = :contestId and "
			+ " tc.agentNo = :agentNo and tc.option= :option and "
			+ "tc.ticketLists= :ticketLists and tc.destId=:destid")
	Integer updateTblTransactionTicketsMaker(@Param("makerId") String makerId,
			@Param("makerName") String makerName,
			@Param("remarks") String remarks,
			@Param("contestId") Integer contestId,
			@Param("agentNo") String agentNo, @Param("option") String option,
			@Param("ticketLists") Integer ticketLists,
			@Param("destid") Integer destid);

	@Modifying
	@Query("UPDATE TblTransactionTickets tc SET tc.status = 2,tc.checkerUID = :checkerId "
			+ ", tc.checkerName = :checkerName, tc.checkerDate=((YEAR(GETDATE()))*"
			+ "100+MONTH(GETDATE()))*100+DAY(GETDATE()) ,  tc.checkerTime = GETDATE() "
			+ ", tc.approver1Remarks = :remarks where tc.status = 1 and tc.validFlag=1 and "
			+ "tc.paymentFlag=1 and tc.contestID = :contestId and "
			+ " tc.agentNo = :agentNo and tc.option= :option and "
			+ "tc.ticketLists= :ticketLists and tc.destId=:destid")
	Integer updateTblTransactionTicketsChecker(
			@Param("checkerId") String checkerId,
			@Param("checkerName") String checkerName,
			@Param("remarks") String remarks,
			@Param("contestId") Integer contestId,
			@Param("agentNo") String agentNo, @Param("option") String option,
			@Param("ticketLists") Integer ticketLists,
			@Param("destid") Integer destid);

	@Modifying
	@Query(value = "UPDATE TblTransactionTickets tc SET tc.status = 4,tc.deviationApprName= :deviationApprname "
			+ ",tc.deviationApprUID= :deviationApprId ,tc.deviationApprdate=((YEAR(GETDATE()))*"
			+ "100+MONTH(GETDATE()))*100+DAY(GETDATE()),tc.deviationApprTime= GETDATE() "
			+ ",tc.deviationApprRemarks= :remarks  where tc.validFlag=1 and tc.paymentFlag =1 and "
			+ " tc.status=2  and tc.entryFlag=1  and tc.contestID = :contestId and "
			+ " tc.agentNo = :agentNo and tc.option= :option and "
			+ "tc.ticketLists= :ticketLists and tc.destId=:destid")
	Integer updateTransactionTicketsDeviation(
			@Param("deviationApprId") String deviationApprId,
			@Param("deviationApprname") String deviationApprname,
			@Param("remarks") String remarks,
			@Param("contestId") Integer contestId,
			@Param("agentNo") String agentNo, @Param("option") String option,
			@Param("ticketLists") Integer ticketLists,
			@Param("destid") Integer destid);

	@Modifying
	@Query(value = "UPDATE TblTransactionTickets  SET tblTransactionTickets.status = -4,tblTransactionTickets.deviationApprName= :deviationApprname "
			+ ",tblTransactionTickets.deviationApprUID= :deviationApprId ,tblTransactionTickets.deviationApprdate=((YEAR(GETDATE()))*"
			+ "100+MONTH(GETDATE()))*100+DAY(GETDATE()),tblTransactionTickets.deviationApprTime= GETDATE() "
			+ ",tblTransactionTickets.deviationApprRemarks= :remarks from tblTransactionTickets as tc "
			+ " INNER JOIN tmptblticketsdeviation td ON td.contestID = :contestId and "
			+ " td.agentNo = :agentNo and "
			+ " td.ticketLists= :ticketLists and td.destId=:destid "
			+ " where tc.validFlag=1 and tc.paymentFlag =1 and "
			+ " tc.status=2  and tc.entryFlag=1", nativeQuery = true)
	Integer rejectTransactionTicketsDeviation(
			@Param("deviationApprId") String deviationApprId,
			@Param("deviationApprname") String deviationApprname,
			@Param("remarks") String remarks,
			@Param("contestId") Integer contestId,
			@Param("agentNo") String agentNo,
			@Param("ticketLists") Integer ticketLists,
			@Param("destid") Integer destid);

	@Query(value = " EXEC [AddDeviationTicket] ?1,?2,?3,?4,?5,?6,?7,?8,?9,?10,?11,?12,?13,?14,?15,?16,?17,?18,?19", nativeQuery = true)
	@Modifying
	@Transactional
	void executeDeviationTicket(String userId, Integer contestId,
			String agentNo, String contestName, Integer startDate,
			Integer endDate, Integer loadDate, Integer destid,
			Float qualifiedTicketCount, Float qualifiedCashCount,
			Float ticketValue, Float cashValue, Float paidTicketCount,
			Float paidCashCount, Float allpaidCount, Boolean additional,
			Boolean recover, String attachment, String remarks);

	@Modifying
	@Query("UPDATE TblTransactionTickets tc SET tc.status = 6,tc.approver1UID= :approverId "
			+ ", tc.approver1Name = :approverName , tc.approver1date=((YEAR(GETDATE()))*"
			+ "100+MONTH(GETDATE()))*100+DAY(GETDATE()) ,  tc.approver1Time = GETDATE() "
			+ ", tc.approver1Remarks = :remarks where tc.status = 5 and tc.validFlag>=1 and "
			+ "tc.paymentFlag=2 and tc.entryFlag in (1,2) and tc.prfNoGenREF= :prfNoGenRef and tc.option in ('T','t'),tc.netpayable > 0")
	Integer updateTransactionTicketApproverOne(
			@Param("approverId") String approverId,
			@Param("approverName") String approverName,
			@Param("prfNoGenRef") Integer prfNoGenRef,
			@Param("remarks") String remarks);

	@Modifying
	@Query("UPDATE TblTransactionTickets tc SET tc.status = 8,tc.approver2UID= :approverId "
			+ ", tc.approver2Name = :approverName , tc.approver2Date=((YEAR(GETDATE()))*"
			+ "100+MONTH(GETDATE()))*100+DAY(GETDATE()) ,  tc.approver2Time = GETDATE() "
			+ ", tc.approver2Remarks = :remarks where tc.status = 6 and tc.validFlag>=1 and "
			+ "tc.paymentFlag=2 and tc.entryFlag in (1,2) and tc.prfNoGenREF= :prfNoGenRef and tc.option in ('T','t'),tc.netpayable > 0")
	Integer updateTransactionTicketApproverTwo(
			@Param("approverId") String approverId,
			@Param("approverName") String approverName,
			@Param("prfNoGenRef") Integer prfNoGenRef,
			@Param("remarks") String remarks);
}
