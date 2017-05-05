// Bus diagram

var selectedSeats = new Set();
var basePrice;

$.urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    return results && results[1] || 0 ;
};

var scheduleId = $.urlParam('schedule_id');

function getPrice(discount) {
    return (basePrice * (1-discount)).toFixed(2);
}

function createSeatRow(targetDOM, startCol, endCol, rowNum, vertical) {

    for (var seatNum = startCol ; seatNum <= endCol; seatNum++) {
        var seatDOM = $('<div class="diagram-col">');
        if (vertical) {
            seatDOM.attr('id', 'seat-'+rowNum+'-'+seatNum);
        } else {
            seatDOM.attr('id', 'seat-'+seatNum+'-'+rowNum);
        }
        targetDOM.append(seatDOM);
    }
}

function createSeatGrid(targetDOM, rowCount, columnCount, vertical) {
    targetDOM.empty();
    if (vertical) {
        rowCount = [columnCount, columnCount = rowCount][0];
    }
    for (var rowNum = 1; rowNum <= rowCount; rowNum++) {
        var rowDOM = $('<div class="diagram-row">');
        createSeatRow(rowDOM, 1, columnCount, rowNum, vertical);
        targetDOM.append(rowDOM);
    }
}

function createSeat(seat) {
    var targetDOM = $('#seat-'+seat.col+'-'+seat.row);
    targetDOM.empty();
    targetDOM.addClass('seat-discounted-'+seat.discount_id);
    targetDOM.attr({
        "rel": "popover",
        "data-placement": "bottom"
    });
    var pictureDOM = $('<img class="seat-image rotateimg270" src="./pictures/seat.svg">');
    if (seat.booked) {
        if (selectedSeats.has(seat.number)) {
            selectedSeats.delete(seat.number);
            alertMusicalChairs(seat);
        }
        targetDOM.attr('data-original-title', 'Seat No. '+seat.number+' is already taken.');
        targetDOM.attr('data-content', 'Please pick another seat.');
        pictureDOM.attr('src', "./pictures/seat_company_purple.svg");

    } else {
        pictureDOM.addClass('clickable-image');
        if (selectedSeats.has(seat.number)) {
            selectSeat(seat, pictureDOM, targetDOM);

        } else {
            deselectSeat(seat, pictureDOM, targetDOM);
        }
        pictureDOM.click(function () {
            toggleSeat(seat, pictureDOM, targetDOM);
        });
    }
    targetDOM.append(
        pictureDOM
    );
}

function alertMusicalChairs(seat) {
    console.log('seat snatched away row: '+seat.row+', column: '+seat.col);
}
function deselectSeat(seat, pictureDOM, parentDOM) {
    parentDOM.attr('data-original-title', 'Seat No. '+seat.number+' is available.');
    parentDOM.attr('data-content', 'Price: € '+getPrice(seat.discount));
    pictureDOM.attr('src', "./pictures/seat_green.svg");
    //console.log('deselect seat row: '+seat.row+', column: '+seat.col);
}

function selectSeat(seat, pictureDOM, parentDOM) {
    parentDOM.attr('data-original-title', 'Seat No. '+seat.number+' is selected.');
    parentDOM.attr('data-content', 'Price: € '+getPrice(seat.discount));
    pictureDOM.attr('src', "./pictures/seat_blue.svg");
    //console.log('select seat row: '+seat.row+', column: '+seat.col);
}

function toggleSeat(seat, pictureDOM, parentDOM) {
    if (selectedSeats.has(seat.number)) {
        selectedSeats.delete(seat.number);
        deselectSeat(seat, pictureDOM, parentDOM);

    } else {
        selectedSeats.add(seat.number);
        selectSeat(seat, pictureDOM, parentDOM);
    }
    parentDOM.popover('show');
}

function updateSeats() {
    // FIXME: replace popover if there is a current one active
    var currentPopOver = $('.popover')[0];
    if (currentPopOver) {
        var currentPopOverParentId = $(currentPopOver).parent().attr('id');
    }
    $.getJSON('get_seats.php?schedule_id='+scheduleId, function (bus) {
        basePrice = bus.price;
        createSeatGrid($('.seats-diagram'), bus.rows, bus.columns, true);
        //console.log('There are '+bus.seats.length+' seats in this bus.');
        bus.seats.forEach(function (seat) {
            createSeat(seat);
        });
        //console.log('updated seats.');
        $('.diagram-col').popover({ trigger: "hover" });
        if (currentPopOverParentId) {
            $('#'+currentPopOverParentId).popover('show');
        }
        setTimeout(updateSeats, 10000);
    });
}

function showMessage(message) {
    var mainDOM = $('#booking_heading');
    var reserveMessageBoxDOM = $('<div class="col-xs-12 alert" id="alert_booking">');
    var reserveMessageTextDOM = $('<h3>').appendTo(reserveMessageBoxDOM);
    reserveMessageTextDOM.text(message);
    mainDOM.after(reserveMessageBoxDOM);
}

$('#btn-reserve_seats').click(function () {
    $.ajax({
        url: 'book_ride.php',
        dataType: 'json',
        type: 'post',
        contentType: 'application/json',
        data: JSON.stringify({
            'schedule': scheduleId,
            'seats': Array.from(selectedSeats)
        }),
        processData: false,
        statusCode: {
            400: function (response) {
                // for 400 responses the data is contained within the responseJSON property.
                var message = response.responseJSON.message;
                $('#alert_booking').remove();
                showMessage(message);
                $('#alert_booking').addClass('alert-danger');

            },
            409: function (response) {
                 // for 400 responses the data is contained within the responseJSON property.
                var message = response.responseJSON.message;
                $('#alert_booking').remove();
                showMessage(message);
                $('#alert_booking').addClass('alert-danger');


            },
            201: function (response) {
                // for 2XX responses the data is contained right in the object.
                var message = response.message;
                showMessage(message);
                $('#alert_booking').addClass('alert-success');
                $('#seat-picker').empty();

            }
        }
    });
});


$(document).ready(function () {
        if (scheduleId > 0) {
            updateSeats();
        }
    }
);

