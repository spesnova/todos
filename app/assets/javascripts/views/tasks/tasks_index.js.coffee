class Todos.Views.TasksIndex extends Backbone.View
  template: JST['tasks/index']

  events:
    'submit #new_task' : 'addTask'
  
  initialize: ->
    Backbone.Events.on('reload', @reload, this)
    @collection.on('reset', @render, this)
    @collection.on('add', @appendTasks, this)

  reload: ->
    console.log 'Reload !'
    @collection.fetch()
    @render
  
  render: ->
    $(@el).html(@template())
    @collection.each(@appendTasks)
    this

  appendTasks: (task) ->
    view = new Todos.Views.Task(model: task)
    $('#tasks').append(view.render().el)

  addTask: (event) ->
    event.preventDefault()
    @collection.create content: $('#new_task_content').val()
    $('#new_task')[0].reset()
