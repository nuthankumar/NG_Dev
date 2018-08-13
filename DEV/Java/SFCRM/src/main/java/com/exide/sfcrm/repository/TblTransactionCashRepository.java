package com.exide.sfcrm.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.exide.sfcrm.model.TblTransactionCash;

/**
 * @author neethub
 *
 */
@Repository
@Transactional
public interface TblTransactionCashRepository extends
		JpaRepository<TblTransactionCash, Long> {

	@Modifying
	@Query("UPDATE TblTransactionCash tc SET tc.status = 1,tc.maker1UID = :makerId "
			+ ", tc.makerName = :makerName , tc.makerDate=((YEAR(GETDATE()))*"
			+ "100+MONTH(GETDATE()))*100+DAY(GETDATE()) ,  tc.makerTime = GETDATE() "
			+ ", tc.approver1Remarks = :remarks where tc.status = 0 and tc.validFlag=1 and "
			+ "tc.paymentFlag=1 and tc.contestID = :contestId and tc.agentNo = :agentNo")
	Integer updateTblTransactionCashMaker(@Param("makerId") String makerId,
			@Param("makerName") String makerName,
			@Param("remarks") String remarks,
			@Param("contestId") Integer contestId,
			@Param("agentNo") String agentNo);

	@Modifying
	@Query("UPDATE TblTransactionCash tc SET tc.status = 2,tc.checkerUID = :checkerId "
			+ ", tc.checkerName = :checkerName, tc.checkerDate=((YEAR(GETDATE()))*"
			+ "100+MONTH(GETDATE()))*100+DAY(GETDATE()) ,  tc.checkerTime = GETDATE() "
			+ ", tc.approver1Remarks = :remarks where tc.status = 1 and tc.validFlag=1 and "
			+ "tc.paymentFlag=1 and tc.contestID = :contestId and tc.agentNo = :agentNo")
	Integer updateTblTransactionCashChecker(
			@Param("checkerId") String checkerId,
			@Param("checkerName") String checkerName,
			@Param("remarks") String remarks,
			@Param("contestId") Integer contestId,
			@Param("agentNo") String agentNo);

	@Modifying
	@Query("UPDATE TblTransactionCash tc SET tc.status = 6,tc.approver1UID= :approverId "
			+ ", tc.approver1Name = :approverName , tc.approver1date=((YEAR(GETDATE()))*"
			+ "100+MONTH(GETDATE()))*100+DAY(GETDATE()) ,  tc.approver1Time = GETDATE() "
			+ ", tc.approver1Remarks = :remarks where tc.status = 5 and tc.validFlag>=1 and "
			+ "tc.paymentFlag=2 and tc.entryFlag in (1,2) and tc.prfNoGenREF= :prfNoGenRef")
	Integer updateTransactionCashApproverOne(
			@Param("approverId") String approverId,
			@Param("approverName") String approverName,
			@Param("prfNoGenRef") Integer prfNoGenRef,
			@Param("remarks") String remarks);
	
	

	@Modifying
	@Query("UPDATE TblTransactionCash tc SET tc.status = 8,tc.approver2UID= :approverId "
			+ ", tc.approver2Name = :approverName , tc.approver2Date=((YEAR(GETDATE()))*"
			+ "100+MONTH(GETDATE()))*100+DAY(GETDATE()) ,  tc.approver2Time = GETDATE() "
			+ ", tc.approver2Remarks = :remarks where tc.status = 6 and tc.validFlag>=1 and "
			+ "tc.paymentFlag=2 and tc.entryFlag in (1,2) and tc.prfNoGenREF= :prfNoGenRef")
	Integer updateTransactionCashApproverTwo(
			@Param("approverId") String approverId,
			@Param("approverName") String approverName,
			@Param("remarks") String remarks,
			@Param("prfNoGenRef") Integer prfNoGenRef);
	
	
		@Modifying
	@Query("UPDATE TblTransactionCash tc SET tc.status = -1,tc.maker1UID = :makerId "
			+ ", tc.makerName = :makerName , tc.makerDate=((YEAR(GETDATE()))*"
			+ "100+MONTH(GETDATE()))*100+DAY(GETDATE()) ,  tc.makerTime = GETDATE() "
			+ ", tc.approver1Remarks = :remarks where tc.status = 0 and tc.validFlag=1 and "
			+ "tc.paymentFlag=1 and tc.contestID = :contestId and tc.agentNo = :agentNo")
	Integer rejectTblTransactionCashMaker(@Param("makerId") String makerId,
			@Param("makerName") String makerName,
			@Param("remarks") String remarks,
			@Param("contestId") Integer contestId,
			@Param("agentNo") String agentNo);

	@Modifying
	@Query(value = "UPDATE TblTransactionCash tc SET tc.status = 4,tc.deviationApprName= :deviationApprname "
			+ ",tc.deviationApprUID= :deviationApprId ,tc.deviationApprdate=((YEAR(GETDATE()))*"
			+ "100+MONTH(GETDATE()))*100+DAY(GETDATE()),tc.deviationApprTime= GETDATE() "
			+ ",tc.deviationApprRemarks= :remarks  where tc.validFlag=1 and tc.paymentFlag =1 and "
			+ " tc.status=2  and tc.entryFlag=1  and tc.contestID = :contestId and tc.agentNo = :agentNo ")
	Integer updateTransactionCashDeviation(
			@Param("deviationApprId") String deviationApprId,
			@Param("deviationApprname") String deviationApprname,
			@Param("remarks") String remarks,
			@Param("contestId") Integer contestId,
			@Param("agentNo") String agentNo);

	@Modifying
	@Query(value = "UPDATE TblTransactionCash  SET tblTransactionCash.status = -4,tblTransactionCash.deviationApprName= :deviationApprname "
			+ ",tblTransactionCash.deviationApprUID= :deviationApprId ,tblTransactionCash.deviationApprdate=((YEAR(GETDATE()))*"
			+ "100+MONTH(GETDATE()))*100+DAY(GETDATE()),tblTransactionCash.deviationApprTime= GETDATE() "
			+ ",tblTransactionCash.deviationApprRemarks= :remarks from tblTransactionCash as tc "
			+ " INNER JOIN tmptblcashdeviation td ON td.contestID = :contestId and td.agentNo = :agentNo "
			+ " where tc.validFlag=1 and tc.paymentFlag =1 and "
			+ " tc.status=2  and tc.entryFlag=1   ", nativeQuery = true)
	Integer rejectTransactionCashDeviation(
			@Param("deviationApprId") String deviationApprId,
			@Param("deviationApprname") String deviationApprname,
			@Param("remarks") String remarks,
			@Param("contestId") Integer contestId,
			@Param("agentNo") String agentNo);

	@Query(value = " EXEC [AddDeviation] ?1,?2,?3,?4,?5,?6,?7,?8,?9,?10", nativeQuery = true)
	@Modifying
	@Transactional
	public void executeAddDeviation(String userId, Integer contestId,
			String agentNo,String contestName, Integer startDate, Integer endDate, Integer loadDate,
			Float netAmount, String attachment, String remarks);

	@Query(value = " EXEC [NetPayableCalc] ", nativeQuery = true)
	@Modifying
	@Transactional
	public void updateNetPayableCalc();

	@Query(value = " EXEC [BalancePayableCalc] ", nativeQuery = true)
	@Modifying
	@Transactional
	public void updateBalancePayableCalc();

}
