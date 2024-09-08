package com.skilldistillery.neighbors.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.neighbors.entities.Resident;
import com.skilldistillery.neighbors.services.ResidentService;

@RestController
@RequestMapping("api")
public class ResidentController {
	
	@Autowired
	private ResidentService residentService;
	
	@GetMapping("residents")
	private List<Resident> getResidentList(){
		return residentService.getAllResidents();
	}
	
	@GetMapping("residents/{residentId}")
    private ResponseEntity<Resident> getResidentById(@PathVariable("residentId") int residentId) {
        Resident resident = residentService.showResident(residentId);
        if (resident != null) {
            return new ResponseEntity<>(resident, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

	@PostMapping({"residents","residents/"})
	private ResponseEntity<Resident> createResident(@RequestBody Resident newResident) {
		 try {
	         Resident createdResident = residentService.create(newResident);
	            return new ResponseEntity<>(createdResident, HttpStatus.CREATED);
	        } catch (IllegalArgumentException e) {
	            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
	        } catch (Exception e) {
	            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
	        }
}
	
	@PutMapping("residents/{residentId}")
	private ResponseEntity<Resident> updateResident(@PathVariable("residentId") int residentId, @RequestBody Resident updatingResident) {
        Resident updatedResident = residentService.update(residentId, updatingResident);
        if (updatedResident != null) {
            return new ResponseEntity<>(updatedResident, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
