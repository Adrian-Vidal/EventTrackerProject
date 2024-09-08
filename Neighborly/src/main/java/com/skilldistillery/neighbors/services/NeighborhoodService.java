package com.skilldistillery.neighbors.services;

import java.util.List;

import com.skilldistillery.neighbors.entities.Neighborhood;

public interface NeighborhoodService {
	
	List<Neighborhood> getAllNeighborhoods();
	Neighborhood findById(int neighborhoodId);

}
