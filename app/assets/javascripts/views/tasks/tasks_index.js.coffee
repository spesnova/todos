class Todos.Views.TasksIndex extends Backbone.View
  template: JST['tasks/index']

  events:
    'submit #new_task' : 'addTask'
  
  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendTasks, this)
  
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
