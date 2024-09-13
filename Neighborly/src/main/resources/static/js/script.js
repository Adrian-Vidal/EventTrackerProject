console.log('script.js loaded');

window.addEventListener('load', function() {
	console.log('DOM loaded');
	init();
});

function init() {
	loadAllEvents();

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
			}
		}
	};
	xhr.send();
}

function displayEventsList(eventList) {
	let tbody = document.getElementById('eventListBody');
	//FIXME
}