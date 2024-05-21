// Card Payment Popup
document.getElementById("open-popup-btn").addEventListener("click", function() {
    document.querySelector(".popup").classList.add("active");
});

document.getElementById("dismiss-popup-btn").addEventListener("click", function() {
    document.querySelector(".popup").classList.remove("active");
});

// Cash Payment Popup
document.getElementById("cash-payment").addEventListener("click", function() {
    document.getElementById("cash-popup").classList.add("active");
});

document.getElementById("cash-dismiss-btn").addEventListener("click", function() {
    document.getElementById("cash-popup").classList.remove("active");
});

var cashConfirmBtn = document.getElementById("Confirm-popup-btn");
    cashConfirmBtn.addEventListener("click", function() {
        alert("Payment confirmed!");
        
    });

    var cashConfirmBtn = document.getElementById("cash-confirm-btn");
    cashConfirmBtn.addEventListener("click", function() {
        alert("Keep change on your hand");
        
    });

    // Make an AJAX request to fetch trip data from the server
var xhr = new XMLHttpRequest();
xhr.open('GET', 'fetch_trips.php', true);
xhr.onreadystatechange = function() {
    if (xhr.readyState === 4 && xhr.status === 200) {
        // Parse the JSON response
        var trips = JSON.parse(xhr.responseText);

        // Create table rows for each trip
        var tableBody = document.getElementById('trip-data');
        trips.forEach(function(trip) {
            var row = document.createElement('tr');
            row.innerHTML = `
                <td>${trip.start}</td>
                <td>${trip.destination}</td>
                <td>${trip.date}</td>
                <td>${trip.time}</td>
            `;
            tableBody.appendChild(row);
        });
    }
};
xhr.send();

