$(document).ready(function() {
    $('#winner').click(function(){
        $('#winner_list').show();
    });

    $('#call').click(function(){
        $('#curl').show();
        $('#call').hide();
    });

    $('#curl').click(function(){
        $('#call').show();
        $('#curl').hide();
    });
});

