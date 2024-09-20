window.addEventListener('DOMContentLoaded', function() {
    const urlParams = new URLSearchParams(window.location.search);
    const eventId = urlParams.get('id');

    if (!eventId) {
        console.error('Event ID is missing');
        return;
    }

    fetchEventDetails(eventId);

    const updateEventForm = document.getElementById('updateEventForm');
    if (updateEventForm) {
        updateEventForm.addEventListener('submit', function(e) {
            e.preventDefault();

            const updatedEvent = {
                name: updateEventForm.name.value,
                description: updateEventForm.description.value,
                createDate: updateEventForm.createDate.value,
                lastUpdate: updateEventForm.lastUpdate.value,
                imageUrl: updateEventForm.imageUrl.value,
                enabled: updateEventForm.enabled.checked,
                neighborhoodId: parseInt(updateEventForm.neighborhoodId.value) 
            };

            console.log('Updated Event Data:', updatedEvent);

            updateEvent(eventId, updatedEvent);
        });

        const cancelUpdateButton = document.getElementById('cancelUpdate');
        if (cancelUpdateButton) {
            cancelUpdateButton.addEventListener('click', function() {
                window.location.href = 'index.html'; 
            });
        }
    }
});

function fetchEventDetails(eventId) {
    fetch(`api/events/${eventId}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(event => populateForm(event))
        .catch(error => console.error('Error fetching event details:', error));
}

function populateForm(event) {
    document.getElementById('eventId').value = event.id;
    document.getElementById('updateName').value = event.name || '';
    document.getElementById('updateDescription').value = event.description || '';
    document.getElementById('updateCreateDate').value = event.createDate || '';
    document.getElementById('updateLastUpdate').value = event.lastUpdate || '';
    document.getElementById('updateImageUrl').value = event.imageUrl || '';
    document.getElementById('updateNeighborhoodId').value = event.neighborhoodId || '';
    document.querySelector(`input[name="enabled"][value="${event.enabled}"]`).checked = true;
}

function updateEvent(eventId, updatedEvent) {
	console.log('Sending Event Update:', updatedEvent);
    fetch(`api/events/${eventId}`, {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(updatedEvent)
    })
    .then(response => {
        if (!response.ok) {
            return response.text().then(text => {
                throw new Error(`Error updating event: ${text}`);
            });
        }
        console.log('Event updated successfully');
		loadEnabledEventsCount();
        window.location.href = 'index.html';
    })
    
}
