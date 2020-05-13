$('nav>a').each(function(i) {
    $(this).removeClass('active-link');
});

$('nav>a:eq(2)').addClass('active-link');

$('.profile>img').on('click', function(evt) {
    
});