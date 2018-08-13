package com.exide.sfcrm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exide.sfcrm.model.Reasons;
import com.exide.sfcrm.repository.ReasonsRepository;
import com.exide.sfcrm.service.ReasonsService;

@Service
public class ReasonsServiceImpl implements ReasonsService {

	@Autowired
	ReasonsRepository reasonsRepository;

	@Override
	public List<Reasons>getReasonList() {
		return reasonsRepository.findAll();
	}

	@Override
	public Reasons addReasons(Reasons reason) {
		return reasonsRepository.save(reason);
	}

	@Override
	public Reasons updateReasonList(Reasons reason) {
		return reasonsRepository.saveAndFlush(reason);
	}

}
