<%= view_namespace %> ||= {}

class <%= view_namespace %>.EditView extends <%= js_app_name %>.Views.BaseView
  template: (data) -> $("#<%= tmpl 'edit' %>").tmpl(data)

  initialize: ->
    @model.bind("error", @renderErrors)

  events:
    _.extend( _.clone(@__super__.events),
      "submit #edit-<%= singular_name %>" : "update"
    )

  render: ->
    $(@el).html( @template( @model.toJSON() ) )
    this.$("form#edit-<%= singular_name %>").backboneLink(@model)
    return this

  remove: ->
    @model.unbind("error", @renderErrors)
    super()
