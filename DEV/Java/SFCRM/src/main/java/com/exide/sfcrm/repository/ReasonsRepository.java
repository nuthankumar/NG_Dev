package com.exide.sfcrm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.exide.sfcrm.model.Reasons;

@Repository
public interface ReasonsRepository extends JpaRepository<Reasons, String> {

}
