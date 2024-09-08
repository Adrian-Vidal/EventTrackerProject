package com.skilldistillery.neighbors.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.neighbors.entities.Resident;
import com.skilldistillery.neighbors.repositories.ResidentRepository;

@Service
public class ResidentServiceImpl implements ResidentService{

	@Autowired
	private ResidentRepository residentRepo;
	
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
		return null;
	}

	@Override
	public Resident update(int residentId, Resident updatingResident) {
		return null;
	}

	@Override
	public boolean delete(int residentId) {
		return false;
	}

}
