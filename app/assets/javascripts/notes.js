$(function() {
  $('#notes > li').click(function(ev) {
    ev.preventDefault();
    location.href = $(this).data('url');
  });
  $(window).resize(function() {
    $('#sidebar').height($(window).height() - 55);
    $('.bootsy_text_area').height($(window).height() - 260);
  }).trigger('resize');
});
