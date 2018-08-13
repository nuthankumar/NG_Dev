package com.exide.sfcrm.service;

import java.util.List;

import com.exide.sfcrm.model.Reasons;



public interface ReasonsService {

	List<Reasons> getReasonList();

	Reasons addReasons(Reasons reason);

	Reasons updateReasonList(Reasons reason);



}
