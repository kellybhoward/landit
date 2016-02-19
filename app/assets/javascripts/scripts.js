$(document).ready(function(){
    $('select').material_select();

    $('.collapsible').collapsible({
      accordion : true
    });
    //scroll to top functions
    $(window).scroll(function() {
        if ($(this).scrollTop() > 3 || $(this).scrollTop() === $(this).height()) {
            $('#toTop:hidden').stop(true, true).fadeIn();
        } else {
            $('#toTop').stop(true, true).fadeOut();
        }
    });
    $('a[href="#top"]').click(function() {
        $('html,body').animate({ scrollTop: 0 }, 'slow');
        return false;
    });
    $('.scrollspy').scrollSpy();
});
