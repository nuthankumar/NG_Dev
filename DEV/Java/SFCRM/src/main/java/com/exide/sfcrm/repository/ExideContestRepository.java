package com.exide.sfcrm.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.exide.sfcrm.model.ExideContest;

/**
 * @author neethub
 *
 */
@Repository
public interface ExideContestRepository extends CrudRepository<ExideContest, Long> {
	
	@Override
	public Iterable<ExideContest> findAll();

	

}
