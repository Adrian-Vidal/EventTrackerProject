package com.skilldistillery.neighbors.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.neighbors.entities.Event;
import com.skilldistillery.neighbors.entities.Neighborhood;
import com.skilldistillery.neighbors.repositories.EventRepository;
import com.skilldistillery.neighbors.repositories.NeighborhoodRepository;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventRepository eventRepo;
	@Autowired
	private NeighborhoodRepository neighborhoodRepo;
	
	@Override
	public List<Event> getAllEvents() {
		return eventRepo.findAll();
//		return eventRepo.findByEnabledTrue();
	}

	@Override
	public Event showEvent(int eventId) {
		return eventRepo.findById(eventId).orElse(null);
		
	}

	@Override
	public Event create(Event newEvent) {
	    if (newEvent.getNeighborhood() != null && newEvent.getNeighborhood().getId() > 0) {
	        Neighborhood neighborhood = neighborhoodRepo.findById(newEvent.getNeighborhood().getId()).orElse(null);
	        if (neighborhood != null) {
	            newEvent.setNeighborhood(neighborhood);
	            return eventRepo.save(newEvent);
	        } else {
	            throw new IllegalArgumentException("Neighborhood with ID " + newEvent.getNeighborhood().getId() + " not found");
	        }
	    } else {
	        throw new IllegalArgumentException("Invalid Neighborhood ID");
	    }
	}
		

	@Override
	public Event update(int eventId, Event updatingEvent) {
		if (eventRepo.existsById(eventId)) {
	        updatingEvent.setId(eventId);
	        return eventRepo.save(updatingEvent);
	    }
	    return null;
	}

	@Override
	public boolean delete(int eventId) {
		if (eventRepo.existsById(eventId)) {
	        eventRepo.deleteById(eventId);
	        return true;
	    }
	    return false;
	}

}
