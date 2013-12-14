$(document).ready ->
  $(".icon-arrow-right").bind "click", (event) ->
    event.preventDefault()
    target = $($(this).parent().attr("href"))
    $("html, body").stop().animate(scrollLeft: target.offset().left, scrollTop: target.offset().top, 1200)
