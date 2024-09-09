package com.skilldistillery.neighbors.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.neighbors.entities.Neighborhood;
import com.skilldistillery.neighbors.entities.Resident;
import com.skilldistillery.neighbors.repositories.NeighborhoodRepository;
import com.skilldistillery.neighbors.repositories.ResidentRepository;

@Service
public class ResidentServiceImpl implements ResidentService{

	@Autowired
	private ResidentRepository residentRepo;
	@Autowired
	private NeighborhoodRepository neighborhoodRepo;
	
	@Override
	public List<Resident> getAllResidents() {
		return residentRepo.findAll();
	}

	@Override
	public Resident showResident(int residentId) {
		return residentRepo.findById(residentId).orElse(null);
	}

	@Override
	public Resident create(Resident newResident) {
	    if (newResident.getNeighborhood() != null && newResident.getNeighborhood().getId() > 0) {
	        Neighborhood neighborhood = neighborhoodRepo.findById(newResident.getNeighborhood().getId()).orElse(null);
	        if (neighborhood != null) {
	            newResident.setNeighborhood(neighborhood);
	            return residentRepo.save(newResident);
	        } else {
	            throw new IllegalArgumentException("Resident with ID " + newResident.getNeighborhood().getId() + " not found");
	        }
	    } else {
	        throw new IllegalArgumentException("Invalid Resident ID");
	    }
	}

	@Override
	public Resident update(int residentId, Resident updatingResident) {
		if (residentRepo.existsById(residentId)) {
			updatingResident.setId(residentId);
			return residentRepo.save(updatingResident);
		}
		return null;
	}

	@Override
	public boolean delete(int residentId) {
	    if (residentRepo.existsById(residentId)) {
	        residentRepo.deleteById(residentId);
	        return true;
	    }
	    return false;
	}
	
	 @Override
	    public List<Resident> findByFirstName(String firstName) {
	        return residentRepo.findByFirstName(firstName);
	    }
}
