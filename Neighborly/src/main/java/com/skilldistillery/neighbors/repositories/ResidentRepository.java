package com.skilldistillery.neighbors.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.neighbors.entities.Resident;

public interface ResidentRepository extends JpaRepository<Resident, Integer>{
	List<Resident> findByFirstName(String firstName);

}
