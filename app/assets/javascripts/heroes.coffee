$(document).ready ->
  $(".icon-arrow-right").bind "click", (event) ->
    event.preventDefault()
    target = $($(this).parent().attr("href"))
    $("html, body").stop().animate(scrollLeft: target.offset().left, scrollTop: target.offset().top, 1200)

  $(".icon-arrow-left").bind "click", (event) ->
    event.preventDefault()
    target = $($(this).parent().attr("href"))
    $("html, body").stop().animate(scrollLeft: target.offset().left, scrollTop: target.offset().top, 1200)

  $(".hero").bind "click", (event) ->
    hero_label = $(this).attr('for')
    selector = hero_label.replace('hero', 'enemy') if hero_label.indexOf("hero") != -1
    target = $("label[for='" + selector + "']")
    target.css(opacity: .1)
