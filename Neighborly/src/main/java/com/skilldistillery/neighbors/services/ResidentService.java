package com.skilldistillery.neighbors.services;

import java.util.List;

import com.skilldistillery.neighbors.entities.Resident;

public interface ResidentService {
	
	List<Resident> getAllResidents();
	Resident showResident(int residentId);
	Resident create(Resident newResident);
	Resident update(int residentId, Resident updatingResident);
	boolean delete(int residentId);
	List<Resident> findByFirstName(String firstName);
	

}
