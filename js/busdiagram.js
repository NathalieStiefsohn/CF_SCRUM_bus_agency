// Bus diagram

var selectedSeats = new Set();

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
    var pictureDOM = $('<img class="seat-image rotateimg270" src="./pictures/seat.svg">');
    if (seat.booked) {
        if (selectedSeats.has(seat.number)) {
            selectedSeats.remove(seat.number);
            alertMusicalChairs(seat);
        }
        pictureDOM.attr('disabled', true);
        pictureDOM.attr('src', "./pictures/seat_company_purple.svg");

    } else {
        pictureDOM.addClass('clickable-image');
        if (selectedSeats.has(seat.number)) {
            pictureDOM.attr('src', "./pictures/seat_blue.svg");
        } else {
            pictureDOM.attr('src', "./pictures/seat_green.svg");
        }
        pictureDOM.click(function () {
            toggleSeat(seat, pictureDOM);
        });
    }
    targetDOM.append(
        pictureDOM
    );
}

function alertMusicalChairs(seat) {
    console.log('seat snatched away row: '+seat.row+', column: '+seat.col);
}
function deselectSeat(seat, pictureDOM) {
    selectedSeats.delete(seat.number);
    pictureDOM.attr('src', "./pictures/seat_green.svg");
    console.log('deselect seat row: '+seat.row+', column: '+seat.col);
}

function selectSeat(seat, pictureDOM) {
    selectedSeats.add(seat.number);
    pictureDOM.attr('src', "./pictures/seat_blue.svg");
    console.log('select seat row: '+seat.row+', column: '+seat.col);
}

function toggleSeat(seat, pictureDOM) {
    if (selectedSeats.has(seat.number)) {
        deselectSeat(seat, pictureDOM);

    } else {
        selectSeat(seat, pictureDOM);
    }
}

function updateSeats() {
    $.getJSON('get_seats.php', function (bus) {
        createSeatGrid($('.seats-diagram'), bus.rows, bus.columns, true);
        console.log('There are '+bus.seats.length+' seats in this bus.');
        bus.seats.forEach(function (seat) {
            createSeat(seat);
        });
        console.log('updated seats.');
        setTimeout(updateSeats, 3000);
    })
}

$(document).ready(function () {
        updateSeats();
    }
);

