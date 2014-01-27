class @Submittable

  submit_form: ->
    $.ajax({
      url: '/pick_assistant',
      data: $('#hero-form').serialize(),
      dataType: 'json',
      type: 'POST',
      success: (data) ->
        update_recommendations(data)
    })

  update_recommendations: (data) ->
    recommend_list.populate(data.recommendations)
    avoid_list.populate(data.worst)
    ban_recommend_list.populate(data.ban_recommendations)

    if data.needed_roles? && data.filled_roles?
      roles.populate_needed(data.needed_roles)
      roles.populate_filled(data.filled_roles)
    else
      roles.empty()
