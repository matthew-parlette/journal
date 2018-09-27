# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '[data-action="mark-done"]', ->
  id = $(this).data('itemId')
  console.log "Marking #{id} as done..."
  mark_task $(this), id, "done"

$(document).on 'click', '[data-action="mark-nothing"]', ->
  id = $(this).data('itemId')
  console.log "Marking #{id} as not_marked..."
  mark_task $(this), id, "not_marked"

$(document).on 'click', '[data-action="mark-rescheduled"]', ->
  id = $(this).data('itemId')
  console.log "Marking #{id} as rescheduled..."
  mark_task $(this), id, "rescheduled"

$(document).on 'click', '[data-action="mark-progressed"]', ->
  id = $(this).data('itemId')
  console.log "Marking #{id} as progressed..."
  mark_task $(this), id, "progressed"

$(document).on 'click', '[data-action="mark-cancelled"]', ->
  id = $(this).data('itemId')
  console.log "Marking #{id} as cancelled..."
  mark_task $(this), id, "cancelled"

mark_task = (icon, id, mark) ->
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
