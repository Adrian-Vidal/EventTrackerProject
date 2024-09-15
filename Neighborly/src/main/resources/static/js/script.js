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

    let detailsHtml = 
        `<h2><span class="event-name">${event.name}</span></h2>
        ${event.imageUrl ? `<img src="${event.imageUrl}" class="event-image" />` : ''}
        <p><span class="event-description"> ${event.description || 'No description available.'}</span></p>`;

    detailsDiv.innerHTML = detailsHtml;
}

//================================================================================//

window.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('newEventForm');

    if (form) {
        form.addEventListener('submit', function(e) {
            e.preventDefault(); // Prevent the default form submission
            
            console.log('Adding event');
            
            const newEvent = {
                name: form.name.value,
                description: form.description.value,
				createDate: form.createDate.value,
				lastUpdate: form.lastUpdate.value,
                imageUrl: form.imageUrl.value,
            };

            console.log('New Event Object:', newEvent); // Log the event object

            addEvent(newEvent);
        });
    } else {
        console.error('Form element not found');
    }

    // Other event listeners for search and add links
    // ...
});

function addEvent(newEvent) {
    let xhr = new XMLHttpRequest();
    xhr.open('POST', 'api/events', true);
    xhr.setRequestHeader("Content-type", "application/json");

    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200 || xhr.status === 201) {
                console.log('Event added successfully:', xhr.responseText);
                displayEvent(JSON.parse(xhr.responseText)); // Ensure this function is defined
            } else {
                console.error('Error creating event:', xhr.status, xhr.responseText);
                displayError("Error creating event: " + xhr.status); // Ensure this function is defined
            }
        }
    };

    let eventJson = JSON.stringify(newEvent);
    xhr.send(eventJson);
}

function displayEvent(event) {
    // Implement this function to update the UI or handle the newly added event
    console.log('Displaying event:', event);
}

function displayError(error) {
    // Implement this function to show errors to the user
    console.error('Error:', error);
}
