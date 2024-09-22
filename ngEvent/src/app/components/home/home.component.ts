import { Component, OnInit } from '@angular/core';
import { EventService } from '../../services/event.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { NeighborhoodEvent } from '../../models/event';

// =============================================================================//
@Component({
  selector: 'app-home',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule
  ],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})

// =============================================================================//

export class HomeComponent implements OnInit {

  events: NeighborhoodEvent[] = [];
  selected: NeighborhoodEvent | null = null;
  editEvent: NeighborhoodEvent | null = null;
  newEvent: NeighborhoodEvent = new NeighborhoodEvent(0, '', '', '', '', '', true, false, {id: 1});

  editNeighborhoodEvent: any;

// =============================================================================//

  constructor(
    private eventService: EventService
  ) {}

  ngOnInit(): void {
    this.reloadEvents();
  }

  reloadEvents(): void {
    this.eventService.index().subscribe( {
      next: (eventList) => {
        this.events = eventList;
      },
      error: (fail => {
        console.error("HomeComponent.reloadEvents: error retriving event list");
        console.error(fail);

      })
    });
  }

// =============================================================================//

//TODO detail div with selected event
displayEvent(event: NeighborhoodEvent): void {
  this.selected = event;
}

// =============================================================================//

displayTable(): void {
  this.selected = null;
}

// =============================================================================//

// TODO form to create new event
addEvent(event: NeighborhoodEvent): void {
  this.eventService.create(this.newEvent).subscribe({
    next: (createdEvent) => {
      this.reloadEvents();
      this.newEvent = new NeighborhoodEvent();
    },
    error: (oops: any) => {
      console.error('Error creating event: ', oops);
    }
  });
}

// =============================================================================//

//TODO update form
updateEvent(): void {
  if (this.editEvent) {
    this.eventService.update(this.editEvent).subscribe({
      next: () => {
        this.reloadEvents();
        this.editEvent = null;
        this.selected = null;
      },
      error: (err: any) => {
        console.error('Error updating todo:', err);
      }
    });
  }
}

setEditEvent(): void {
  if (this.selected) {
    this.editEvent = Object.assign({}, this.selected);
  }
}

cancelEdit(): void {
  this.editEvent = null;
}

// =============================================================================//

//TODO delete button - where? in list or detail view
deleteEvent(eventId: number): void {
  this.eventService.destroy(eventId).subscribe({
    next: () => {
      this.reloadEvents();
    },
    error: (kaboom) => {
      console.error('TodoListComponent.deleteTodo failed');
      console.error(kaboom);
    }
  })
}

//TODO Models for Neighborhood, EventVisit, User










}
