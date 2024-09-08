package com.skilldistillery.neighbors.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.neighbors.entities.Event;
import com.skilldistillery.neighbors.services.EventService;

@RestController
@RequestMapping("api")
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	@GetMapping("events")
	private List<Event> getEventList(){
		return eventService.getAllEvents();
	}

	@GetMapping("events/{eventId}")
    private ResponseEntity<Event> getEventById(@PathVariable("eventId") int eventId) {
        Event event = eventService.showEvent(eventId);
        if (event != null) {
            return new ResponseEntity<>(event, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping({"events","events/"})
    private ResponseEntity<Event> createEvent(@RequestBody Event newEvent) {
        try {
            Event createdEvent = eventService.create(newEvent);
            return new ResponseEntity<>(createdEvent, HttpStatus.CREATED);
        } catch (IllegalArgumentException e) {
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    

    @PutMapping("events/{eventId}")
    private ResponseEntity<Event> updateEvent(@PathVariable("eventId") int eventId, @RequestBody Event updatingEvent) {
        Event updatedEvent = eventService.update(eventId, updatingEvent);
        if (updatedEvent != null) {
            return new ResponseEntity<>(updatedEvent, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("events/{eventId}")
    private ResponseEntity<Void> deleteEvent(@PathVariable("eventId") int eventId) {
        boolean deleted = eventService.delete(eventId);
        if (deleted) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}

