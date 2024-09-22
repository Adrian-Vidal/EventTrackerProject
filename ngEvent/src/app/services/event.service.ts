import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Observable, catchError, throwError } from 'rxjs';
import { NeighborhoodEvent } from '../models/event';

@Injectable({
  providedIn: 'root'
})
export class EventService {

  url = environment.baseUrl + "api/events";

  constructor(
    private http: HttpClient,
  ) { }

  index(): Observable<NeighborhoodEvent[]> {
    return this.http.get<NeighborhoodEvent[]>(this.url).pipe(
      catchError((err: any) => {
        console.error(err);
        return throwError(
           () => new Error( 'EventService.index(): error retrieving events: ' + err )
        );
      })
    );
  }

  //TODO: retrieve, create, update, destroy
// =========================================================================== //
create(event: NeighborhoodEvent): Observable<NeighborhoodEvent>{
    return this.http.post<NeighborhoodEvent>(this.url, event).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
           () => new Error( 'EventService.create(): error adding event: ' + err )
        );
      })
    );
  }

  update(event: NeighborhoodEvent): Observable<NeighborhoodEvent> {
    return this.http.put<NeighborhoodEvent>(`${this.url}/${event.id}`, event).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () => new Error(`TodoService.update(): error updating todo: ` + err)
        );
      })
    );
  }

  destroy(eventId: number): Observable<void>{
    return this.http.delete<void>(`${this.url}/${eventId}`).pipe(
      catchError((err: any) =>{
        console.log(err);
        return throwError(
          () => new Error(`EventService.destroy(): error deleting event: ` + err)
        );
      })
    );
  }


}
