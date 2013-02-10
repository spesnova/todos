class Todos.Routers.Tasks extends Backbone.Router
  routes:
    '':'index'

  initialize: ->
    @collection = new Todos.Collections.Tasks()
    @collection.fetch()

  index: ->
    view = new Todos.Views.TasksIndex(collection: @collection)
    $('body').html(view.render().el)
