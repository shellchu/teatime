# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

check_hot = ->
  if $('#order_hot').prop("checked")
    $('.ice_opt').hide()
  else
    $('.ice_opt').show()
ready = ->
  check_hot()
  $('#order_hot').click check_hot
  $('#new_order').submit ->
    if $('#order_hot').prop("checked")
      $('#order_ice').val('nil')
$(document).ready(ready)
$(document).on('page:load', ready)
