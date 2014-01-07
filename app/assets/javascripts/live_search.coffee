$(document).ready ->
  $("#filter").keyup ->
    filter = $(this).val()

    $(".character").each ->
      if ($(this).text().search(new RegExp(filter, "i")) < 0)
        $(this).css(opacity: 0.3)
      else
        $(this).css(opacity: 1)
