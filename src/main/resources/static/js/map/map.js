// Map initialize

var map = L.map( 'map', {
    center: [56.0, 17.0],
    minZoom: 2,
    zoom: 6
});



//Temporary function for button to test POST request for adding a point
function createPoint(lat, lng) {
    var name = document.getElementById("nameInput").value;
    var description = document.getElementById("descriptionInput").value;
    var category = document.getElementById("categoryInput").value;
    var latt = lat || parseFloat(document.getElementById("latInput").value);
    var lngg = lng || parseFloat(document.getElementById("lngInput").value);

    if (!name || !description || !category) {
        alert("Name, description, and category cannot be empty.");
        return;
    }

    if (isNaN(latt) || latt < -90 || latt > 90 || isNaN(lngg) || lngg < -180 || lngg > 180) {
        alert("Invalid latitude or longitude. Latitude must be between -90 and 90, and longitude must be between -180 and 180.");
        return;
    }
    fetch(apiUrl + "add/", {
        method: "POST",
        headers: {
            'Content-Type': "application/json"
        },
        body: JSON.stringify({
            "name": name,
            "description": description,
            "category": category,
            "lat": latt,
            "lng": lngg
        })
    })
        .then(response => handleResponse(response))
        .then(data => {
            console.log(data);

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

function handleResponse(response) {
    console.log(response);

    if (!response.ok) {
        // Handle error responses
        if (response.status === 403) {
            throw new Error("Forbidden - You must be signed in to add a point");
        } else if (response.status === 404) {
            throw new Error("Not Found - The requested resource was not found");
        } else if (response.status === 500) {
            throw new Error("Internal Server Error - Something went wrong on the server");
        } else {
            throw new Error("Network response was not ok with status:" + response.status);
        }
    }

    // Handle other successful responses
    console.log("Request successful with status:", response.status);
    return response.json();
}

function getLocation() {
    if (navigator.geolocation) {
        // Ask for permission to get the user's location
        navigator.geolocation.getCurrentPosition(
            (position) => {
                // Pass the location and other parameters to createPoint
                createPoint(position.coords.latitude, position.coords.longitude);
            },
            showError,
            { enableHighAccuracy: true }
        );
    } else {
        alert("Geolocation is not supported by this browser.");
    }
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

L.tileLayer( 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.github.com/imaginalis">@imaginalis</a>',
    subdomains: ['a','b','c']
}).addTo( map );
var controlLoader = L.control.loader().addTo(map);
