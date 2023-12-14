document.querySelector('table').addEventListener('click', function(event) {
    if (event.target.classList.contains('remove-point-btn')) {
        event.preventDefault();

        const pointid = event.target.getAttribute('data-pointid');
        fetch(apiUrl + "delete/id/"+ pointid, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
        })
            .then(response => {
                if (response.ok) {
                    // Refresh the page on success
                    location.reload();
                } else {
                    // Display an alert box with the HTTP status on failure
                    alert(`Error: ${response.status} - ${response.statusText}`);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                // Handle errors if needed
                alert('An error occurred while processing your request.');
            });
    }
});