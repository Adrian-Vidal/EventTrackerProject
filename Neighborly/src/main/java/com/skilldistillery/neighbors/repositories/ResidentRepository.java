package com.skilldistillery.neighbors.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.neighbors.entities.Resident;

public interface ResidentRepository extends JpaRepository<Resident, Integer>{

}
