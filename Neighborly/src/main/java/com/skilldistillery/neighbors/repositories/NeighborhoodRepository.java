package com.skilldistillery.neighbors.repositories;


import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.neighbors.entities.Neighborhood;

public interface NeighborhoodRepository extends JpaRepository<Neighborhood, Integer> {

}
