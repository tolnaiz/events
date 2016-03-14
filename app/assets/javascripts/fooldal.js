var current_page = 1;
$(function () {
    $("#meg_tobb").click(function (e) {
        $.ajax({
            url: '/',
            type: 'GET',
            dataType: 'html',
            data: {page: current_page}
        })
        .done(function(html) {
            current_page++;
            $("#events tbody").append(html);
        })
        .fail(function() {
            alert("Hiba történt, próbáld újra!");
        });
        e.preventDefault();
    });

    $('#from').datetimepicker({
        inline: true,
        sideBySide: true,
        format: "YYYY MM DD",
        locale: "hu",
        dayViewHeaderFormat: "YYYY MMMM"
    });

    $('#to').datetimepicker({
        inline: true,
        sideBySide: true,
        format: "YYYY MM DD",
        locale: "hu",
        dayViewHeaderFormat: "YYYY MMMM",
        defaultDate: moment().add(14, 'days')
    });

    $("#from, #to").on('dp.change', function(event) {
        var d_from = $("#from").data("DateTimePicker").date().format("YYYY-MM-DD");
        var d_to = $("#to").data("DateTimePicker").date().format("YYYY-MM-DD");
        $.ajax({
            url: '/',
            type: 'GET',
            dataType: 'html',
            data: {from: d_from, to: d_to}
        })
        .done(function(html) {
            $("#events tbody").html(html);
        })
        .fail(function() {
            alert("Hiba történt, próbáld újra!");
        });
    });

    $('#filter_button').click(function(event) {
        $("#filter").toggleClass('open');
    });
});
