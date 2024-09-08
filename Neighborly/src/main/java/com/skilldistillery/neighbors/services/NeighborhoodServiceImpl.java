package com.skilldistillery.neighbors.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.neighbors.entities.Neighborhood;
import com.skilldistillery.neighbors.repositories.NeighborhoodRepository;

@Service
public class NeighborhoodServiceImpl implements NeighborhoodService{

	@Autowired
	private NeighborhoodRepository neighborhoodRepo;
	
	@Override
	public List<Neighborhood> getAllNeighborhoods() {
		return neighborhoodRepo.findAll();
	}

	@Override
	public Neighborhood findById(int neighborhoodId) {
		return neighborhoodRepo.findById(neighborhoodId).orElse(null);
	}

}
