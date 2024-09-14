console.log('script.js loaded');

window.addEventListener('load', function() {
    console.log('DOM loaded');
    init();
});

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
        <p><strong>Description:</strong> ${event.description || 'No description available.'}</p>`;

    detailsDiv.innerHTML = detailsHtml;
}
