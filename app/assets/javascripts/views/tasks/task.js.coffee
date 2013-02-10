class Todos.Views.Task extends Backbone.View
  template: JST['tasks/task']

  tagName: 'li'

  events:
    'change input:checkbox': 'changeDone'
    'dblclick span.task_content': 'editTask'
    'blur input#edit_task_content': 'render'

  render: ->
    $(@el).html(@template(task: @model))
    this

  changeDone: (event) ->
    id = '#' + event.target.id
    # checkbox に change イベント発生時 checked=true なら
    # change イベントはチェックが外れた事を意味する
    if $(id).attr('checked')
      @model.set('done': false)
    else
      @model.set('done': true)
    @model.save()
    @render()

  editTask: (event) ->
    view = new Todos.Views.EditForm(model: @model)
    console.log $('#' + event.target.id)
    console.log $('#' + event.target.id).parent()
    $('#' + event.target.id).parent().html(view.render().el)
      .find('input').focus()
