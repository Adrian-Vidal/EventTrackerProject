package com.skilldistillery.neighbors.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.neighbors.entities.Neighborhood;
import com.skilldistillery.neighbors.services.NeighborhoodService;

@RestController
@RequestMapping("api")
public class NeighborhoodController {
	
	@Autowired
	private NeighborhoodService neighborhoodService;
	
	@GetMapping("neighborhoods")
	private List<Neighborhood> getNeighborhoodList(){
		return neighborhoodService.getAllNeighborhoods();
	}
	
	@GetMapping("neighborhoods/{neighborhoodId}")
    private ResponseEntity<Neighborhood> getNeighborhoodById(@PathVariable("neighborhoodId") int neighborhoodId) {
        Neighborhood neighborhood = neighborhoodService.findById(neighborhoodId);
        if (neighborhood != null) {
            return new ResponseEntity<>(neighborhood, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

}