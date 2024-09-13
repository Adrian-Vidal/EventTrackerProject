console.log('script.js loaded');

window.addEventListener('load', function() {
	console.log('DOM loaded');
	init();
});

//======================================================//

function init() {
	loadAllEvents();
	document.addEventListener('load', function(event) {
		event.preventDefault();
		loadAllEvents();
	});


	//TODO - event listeners, etc.
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
			}
			else {
				//FIXME
				console.error('Error loading events:', xhr.status, xhr.statusText);
			}
		}
	};
	xhr.send();
}

//======================================================//

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
		nameCell.textContent = event.name;
		row.appendChild(nameCell);
		nameCell.style.cursor = 'pointer';
		nameCell.addEventListener('click', function(){
			displayEventDetails(event);
		});

		let lastUpdateCell = document.createElement('td');
		lastUpdateCell.textContent = event.lastUpdate;
		row.appendChild(lastUpdateCell);		

		tbody.appendChild(row);
		//FIXME
	});

}





