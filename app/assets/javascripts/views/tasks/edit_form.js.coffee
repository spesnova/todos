class Todos.Views.EditForm extends Backbone.View
  template: JST['tasks/edit_form']

  events:
    'blur input:text': 'updateContent'

  render: ->
    console.log @model.get('content')
    $(@el).html(@template(value: @model))
    this

  updateContent: ->
    console.log "blur"
    value = event.target.value
    unless value is ''
      @model.set(content: value)
      @model.save()
