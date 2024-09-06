package com.skilldistillery.neighbors.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.neighbors.entities.Event;
import com.skilldistillery.neighbors.repositories.EventRepository;
@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventRepository eventRepo;
	
	@Override
	public List<Event> getAllEvents() {
		return eventRepo.findAll();
	}

	@Override
	public Event showEvent(int eventId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Event create(Event newEvent) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Event update(int eventId, Event updatingEvent) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(int eventId) {
		// TODO Auto-generated method stub
		return false;
	}

}
