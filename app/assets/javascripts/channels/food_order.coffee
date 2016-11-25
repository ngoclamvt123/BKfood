App.food_order = App.cable.subscriptions.create "FoodOrderChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#order').append data['food_order']

  create: (food_order) ->
    @perform 'create', food_order: food_order

$(document).on 'keypress', '[data-behavior~=food_order_create]', (event) ->
  if event.keyCode is 13
    App.food_order.create event.target.value
    event.target.value = ''
    event.preventDefault()