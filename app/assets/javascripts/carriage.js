$(document).ready( function () {
    var carriage_type;

    $('#carriage_type').change(function () {
        carriage_type = $('#carriage_type option:selected').val();
        console.log(carriage_type);
        switch (carriage_type) {
            case 'SvCarriage':
                $('.carriages').hide();
                $('.sv_carr').show();
                break;
            case 'EconomyCarriage':
                $('.carriages').hide();
                $('.economy_carr').show();
                $('.coupe_carr').show();
                break;
            case 'CoupeCarriage':
                $('.carriages').hide();
                $('.coupe_carr').show();
                break;
            default:
                $('.carriages').hide();
                break;
        };
    });
});