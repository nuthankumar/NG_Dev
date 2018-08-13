package com.exide.sfcrm.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.exide.sfcrm.model.TblPRFGenratedCash;

@Repository
@Transactional
public interface TblPRFGenratedCashRepository extends
		JpaRepository<TblPRFGenratedCash, Long> {

	@Query(value = "SELECT agentNo,netAmount,netPayout,recoverableAmont,deviationAmt,advancePayout,advanceRecoverable,prfNoGenREF,prfGENDate,prfNo,prfComment from TblPRFGenratedCash where prfnogenref=?1")
	List<Object> findByprfNoGenREF(Integer prfNoGenREF);

	@Query(value = "SELECT prfNoGenREF,prfNo,prfGENDate,netPayout AS sumOfNetPayout,AgTypes,costCentreCode,channel,locationBranchCode,modeOfPayment,prfComment from TblPRFGenratedCash where prfGENDate=?1 and cid=?2 and status=8")
	List<String> findByPrfGENDate(Integer prfGENDate, Integer cid);

	@Query(value = "SELECT cid from tblCUmap where uid=?1", nativeQuery = true)
	Integer findByCid(String uid);

	@Query(value = "SELECT prfNoGenREF,prfNo,prfGENDate,netPayout AS sumOfNetPayout,AgTypes,costCentreCode,channel,locationBranchCode,modeOfPayment,prfComment from TblPRFGenratedCash where prfNoGenREF=?1 and cid=?2 and status=8")
	List<String> findByPrfNoGenREF(Integer prfNoGenREF, Integer cid);

	@Query(value = "SELECT prfNoGenREF,prfNo,prfGENDate,netPayout AS sumOfNetPayout,AgTypes,costCentreCode,channel,locationBranchCode,modeOfPayment,prfComment from TblPRFGenratedCash where prfGENDate>=?1 and prfGENDate<=?2 and cid=?3 and status=8")
	List<String> findByDate(Integer startDate, Integer endDate, Integer cid);

}
