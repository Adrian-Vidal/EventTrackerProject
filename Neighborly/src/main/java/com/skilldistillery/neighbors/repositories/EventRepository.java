package com.skilldistillery.neighbors.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.neighbors.entities.Event;

public interface EventRepository extends JpaRepository<Event, Integer> {
	List<Event> findByEnabledTrue();
	Long countByEnabled(boolean enabled);

}
