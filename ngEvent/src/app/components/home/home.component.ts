import { Component, OnInit } from '@angular/core';
import { EventService } from '../../services/event.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { NeighborhoodEvent } from '../../models/event';


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
export class HomeComponent implements OnInit {

  events: NeighborhoodEvent[] = [];

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

}
