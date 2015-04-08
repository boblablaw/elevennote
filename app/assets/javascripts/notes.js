$(function() {
  $('#notes > li').click(function(ev) {
    ev.preventDefault();
    location.href = $(this).data('url');
  });
});
