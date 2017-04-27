// Bus diagram

var selectedSeats = new Set();
var basePrice;

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
            selectedSeats.remove(seat.number);
            alertMusicalChairs(seat);
        }
        targetDOM.attr('data-original-title', 'Seat taken');
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
    parentDOM.attr('data-original-title', 'Seat available');
    parentDOM.attr('data-content', 'Price: € '+getPrice(seat.discount));
    pictureDOM.attr('src', "./pictures/seat_green.svg");
    console.log('deselect seat row: '+seat.row+', column: '+seat.col);
}

function selectSeat(seat, pictureDOM, parentDOM) {
    parentDOM.attr('data-original-title', 'Seat selected');
    parentDOM.attr('data-content', 'Price: € '+getPrice(seat.discount));
    pictureDOM.attr('src', "./pictures/seat_blue.svg");
    console.log('select seat row: '+seat.row+', column: '+seat.col);
}

function toggleSeat(seat, pictureDOM, parentDOM) {
    if (selectedSeats.has(seat.number)) {
        selectedSeats.delete(seat.number);
        deselectSeat(seat, pictureDOM, parentDOM);

    } else {
        selectedSeats.add(seat.number);
        selectSeat(seat, pictureDOM, parentDOM);
    }
}

function updateSeats() {
    $.getJSON('get_seats.php', function (bus) {
        basePrice = bus.price;
        createSeatGrid($('.seats-diagram'), bus.rows, bus.columns, true);
        console.log('There are '+bus.seats.length+' seats in this bus.');
        bus.seats.forEach(function (seat) {
            createSeat(seat);
        });
        console.log('updated seats.');
        $('.diagram-col').popover({ trigger: "hover" });
        setTimeout(updateSeats, 3000);
    })
}

$(document).ready(function () {
        updateSeats();
    }
);

