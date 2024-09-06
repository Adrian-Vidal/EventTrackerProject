package com.skilldistillery.neighbors.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.neighbors.entities.Event;

public interface EventRepository extends JpaRepository<Event, Integer> {

}
