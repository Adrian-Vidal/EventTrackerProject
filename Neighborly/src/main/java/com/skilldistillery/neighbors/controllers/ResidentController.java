package com.skilldistillery.neighbors.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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

}
