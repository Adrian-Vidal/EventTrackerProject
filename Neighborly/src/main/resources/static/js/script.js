console.log('script.js loaded');

window.addEventListener('load', function() {
    console.log('DOM loaded');
    init();
});

//================================================================================//

function init() {
    loadAllEvents();
}

function loadAllEvents() {
    let xhr = new XMLHttpRequest();
    xhr.open('GET', 'api/events');
    xhr.onreadystatechange = function() {
        if (xhr.readyState === xhr.DONE) {
            if (xhr.status === 200) {
                let events = JSON.parse(xhr.responseText);
                console.log(events);
                displayEventsList(events);
            } else {
                console.error('Error loading events:', xhr.status, xhr.statusText);
            }
        }
    };
    xhr.send();
}

//================================================================================//

function displayEventsList(eventList) {
    let tbody = document.getElementById('eventListBody');
    if (!tbody) {
        console.error('No upcoming events found');
        return;
    }

    tbody.innerHTML = '';

    eventList.forEach(event => {
        let row = document.createElement('tr');

        let nameCell = document.createElement('td');
        let nameSpan = document.createElement('span');
        nameSpan.className = 'event-name';
        nameSpan.textContent = event.name;
        nameCell.appendChild(nameSpan);
        row.appendChild(nameCell);
        nameSpan.addEventListener('click', function(){
            displayEventDetails(event);
        });

        let lastUpdateCell = document.createElement('td');
        lastUpdateCell.textContent = event.lastUpdate;
        row.appendChild(lastUpdateCell);        

        tbody.appendChild(row);
    });
}

//================================================================================//

function displayEventDetails(event) {
    let detailsDiv = document.getElementById('eventDetailsDiv');
    if (!detailsDiv) {
        console.error('Event details container not found');
        return;
    }

    detailsDiv.innerHTML = '';

	let detailsHtml = `
	        <h2><span class="event-name">${event.name}</span></h2>
	        <p><span class="event-description">${event.description || 'No description available.'}</span></p>
	        ${event.imageUrl ? `<img src="${event.imageUrl}" class="event-image" />` : ''}
	        <div class="button-group">
	            <button class="update-btn" onclick="updateEvent(${event.id})">Update</button>
	            <button class="delete-btn" onclick="deleteEvent(${event.id})">Delete</button>
	        </div>`;

	    detailsDiv.innerHTML = detailsHtml;
	}

//================================================================================//

window.addEventListener('DOMContentLoaded', function() {
    let form = document.getElementById('newEventForm');

    if (form) {
        form.addEventListener('submit', function(e) {
            e.preventDefault();
            
            console.log('Adding event');
            
            const newEvent = {
                name: form.name.value,
                description: form.description.value,
				createDate: form.createDate.value,
				lastUpdate: form.lastUpdate.value,
                imageUrl: form.imageUrl.value,
				enabled: form.enabled.checked,
				neighborhood: {
				            id: parseInt(form.neighborhoodId.value) 
				        }
            };

            console.log('New Event Object:', newEvent); 

            addEvent(newEvent);
        });
    } else {
        console.error('Form element not found');
    }

 
});

function addEvent(newEvent) {
    let xhr = new XMLHttpRequest();
    xhr.open('POST', 'api/events', true);
    xhr.setRequestHeader("Content-type", "application/json");

    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200 || xhr.status === 201) {
                console.log('Event added successfully:', xhr.responseText);
                displayEvent(JSON.parse(xhr.responseText));
            } else {
                console.error('Error creating event:', xhr.status, xhr.responseText);
                displayError("Error creating event: " + xhr.status);
            }
        }
    };

    let eventJson = JSON.stringify(newEvent);
    xhr.send(eventJson);
}

function displayEvent(event) {
    console.log('Displaying event:', event);
}

function displayError(error) {
    console.error('Error:', error);
}


//================================================================================//


function updateEvent(eventId) {
    alert(`Update event with ID: ${eventId}`);
}


//================================================================================//


function deleteEvent(eventId) {
    let xhr = new XMLHttpRequest();
    xhr.open('GET', `api/events/${eventId}`, true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                let event = JSON.parse(xhr.responseText);
                let eventName = event.name; 

                if (confirm(`Are you sure you want to delete the event: ${eventName}?`)) {
                    
                    let deleteXhr = new XMLHttpRequest();
                    deleteXhr.open('DELETE', `api/events/${eventId}`, true);
                    deleteXhr.onreadystatechange = function() {
                        if (deleteXhr.readyState === XMLHttpRequest.DONE) {
                            if (deleteXhr.status === 200 || deleteXhr.status === 204) {
                                console.log('Event deleted successfully');
                                loadAllEvents(); 
                            } else {
                                console.error('Error deleting event:', deleteXhr.status, deleteXhr.responseText);
                                displayError("Error deleting event: " + deleteXhr.status);
                            }
                        }
                    };
                    deleteXhr.send();
                }
            } else {
                console.error('Error fetching event details:', xhr.status, xhr.responseText);
                displayError("Error fetching event details: " + xhr.status);
            }
        }
    };
    xhr.send();
}
