package com.exide.sfcrm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.exide.sfcrm.model.Destination;


@Repository
public interface DestinationRepository extends JpaRepository<Destination, Integer>  {

}
