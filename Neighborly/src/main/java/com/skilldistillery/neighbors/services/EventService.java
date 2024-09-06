package com.skilldistillery.neighbors.services;

import java.util.List;

import com.skilldistillery.neighbors.entities.Event;

public interface EventService {
	
	List<Event> getAllEvents();
	Event showEvent(int eventId);
	Event create(Event newEvent);
	Event update(int eventId, Event updatingEvent);
	boolean delete(int eventId);

}
