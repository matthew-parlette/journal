# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Task mark mapping:
# 0: Not Marked
# 1: Rescheduled
# 2: Progressed
# 3: Done
# 4: Cancelled

$(document).on 'click', '.item-icon', ->
  icon = $(this).find('i')
  currentMark = icon.data('currentMark')
  id = $(this).data('itemId')
  console.log currentMark
  switch currentMark
    when 'task-not-marked'
      console.log "Marking task #{id} as done"
      mark_task icon, id, "done"
    when 'task-done'
      console.log "Marking task #{id} as not_marked"
      mark_task icon, id, "not_marked"

mark_task = (icon, id, mark, type) ->
  $.ajax "/tasks/#{id}",
    type: 'PATCH',
    data: { task: {mark: mark} },
    dataType: 'json',
    beforeSend: ->
      icon.removeClass
      icon.addClass "fa fa-spinner fa-pulse fa-fw"
    error: (jqXHR, textStatus, errorThrown) ->
      console.log "Error updating task #{id}"
    success: (data, textStatus, jqXHR) ->
      console.log "Successfully updated task #{id}"
      $.get "/tasks/#{id}.js", ((responseText) ->
        $("##{id}").html responseText
        return
      ), 'html'
