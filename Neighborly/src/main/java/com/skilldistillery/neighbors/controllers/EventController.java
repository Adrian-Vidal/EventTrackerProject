package com.skilldistillery.neighbors.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
	public List<Event> getEventList(){
		return eventService.getAllEvents();
	}

}
