package com.exide.sfcrm.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.exide.sfcrm.dto.VendorTransactionDto;
import com.exide.sfcrm.model.VendorTransaction;

public interface VendorTransactionService {
	
	List<VendorTransaction> getVendorTranscationList();
	
	VendorTransaction save(VendorTransactionDto vendorTranscation);

	Page<VendorTransaction> getVendorTranscationListPagination(Pageable pageable);
   
	

}
