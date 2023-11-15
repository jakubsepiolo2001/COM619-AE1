// Map initialize

var map = L.map( 'map', {
    center: [56.0, 17.0],
    minZoom: 2,
    zoom: 6
});



//Temporary function for button to test POST request for adding a point
function createPoint() {
    //Will only work locally for now until environment variables are introduced in application.properties
    fetch(apiUrl + "add/", {
        method: "POST",
        headers: {
            'Content-Type': "application/json"
        },
        body: JSON.stringify({
            "name": "testapi",
            "description": "testapidesc",
            "category": "testapicat",
            "lat": Math.random()*50-5, //Just some random Points for now
            "lng": Math.random()*50-5
        })
    })
        .then(response => {
            console.log(response)
            if (!response.ok) {
                //Not in 200 range means something went wrong
                throw new Error("Network response was not ok");
            }
            // Check for 201 status
            if (response.status === 201) {
                return response.json();
            }
        })
        .then(data => {
            console.log(data)
            // Check if we got valid json data returned with correct map point format
            if ('id' in data) {
                alert("Created new point\nid: " + data.id + "\nname: " + data.name + "\ndescription: " + data.description + "\ncategory: " + data.category + "\nlat: " + data.lat + "\nlon: " + data.lng);
            }
        })
        .catch(error => {
            //Catch previously thrown exception
            console.error("Error:", error);
            alert("Error: " + error.message);
        });
}

function getLocation() {
    if (navigator.geolocation) {
        // Ask for permission to get the user's location
        navigator.geolocation.getCurrentPosition(sendPosition, showError, { enableHighAccuracy: true });
    } else {
        alert("Geolocation is not supported by this browser.");
    }
}

function sendPosition(position) {
    alert("Latitude: " + position.coords.latitude + "\nLongitude: " + position.coords.longitude);
    fetch(apiUrl + "add/", {
        method: "POST",
        headers: {
            'Content-Type': "application/json"
        },
        body: JSON.stringify({
            "name": "Current Location Test",
            "description": "Current Location Test",
            "category": "Test Location",
            "lat": position.coords.latitude,
            "lng": position.coords.longitude
        })
    })
        .then(response => {
            console.log(response)
            if (!response.ok) {
                //Not in 200 range means something went wrong
                throw new Error("Network response was not ok");
            }
            // Check for 201 status
            if (response.status === 201) {
                return response.json();
            }
        })
        .then(data => {
            console.log(data)
            // Check if we got valid json data returned with correct map point format
            if ('id' in data) {
                alert("Created new point\nid: " + data.id + "\nname: " + data.name + "\ndescription: " + data.description + "\ncategory: " + data.category + "\nlat: " + data.lat + "\nlon: " + data.lng);
            }
        })
        .catch(error => {
            //Catch previously thrown exception
            console.error("Error:", error);
            alert("Error: " + error.message);
        });
}

function showError(error) {
    console.log("Geolocation Error:", error);

    switch(error.code) {
        case error.PERMISSION_DENIED:
            alert("User denied the request for Geolocation.");
            break;
        case error.POSITION_UNAVAILABLE:
            alert("Location information is unavailable.");
            break;
        case error.TIMEOUT:
            alert("The request to get user location timed out.");
            break;
        case error.UNKNOWN_ERROR:
            alert("An unknown error occurred.");
            break;
    }
}

L.tileLayer( 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.github.com/imaginalis">@imaginalis</a>',
    subdomains: ['a','b','c']
}).addTo( map );
var controlLoader = L.control.loader().addTo(map);
