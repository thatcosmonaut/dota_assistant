friendly_filled_count = 0
enemy_filled_count = 0

$(document).ready ->
  $("#friendly-autocomplete").autocomplete({
    source: [ "Abaddon", "Anti-mage" ],
    select: (event, ui) ->
      $('#friendly-' + hero_filled_count).text(ui.item.value)
      $('#friendly-' + hero_filled_count).data("filled", true)
      friendly_filled_count += 1
  })

  $(".friendly").click ->
    if $(this).data("filled")
      $(this).text("")
      $(this).data("filled", false)
      friendly_filled_count -= 1

  $(".enemy").click ->
    if $(this).data("filled")
      $(this).text("")
      $(this).data("filled", false)
      enemy_filleD_count -= 1
