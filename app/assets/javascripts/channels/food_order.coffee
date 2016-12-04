App.food_order = App.cable.subscriptions.create "FoodOrderChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#order table tbody tr:first-child').after data['food_order']

  