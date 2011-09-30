<%= view_namespace %> ||= {}

class <%= view_namespace %>.NewView extends Backbone.View
  template: (data) -> $("#<%= tmpl 'new' %>").tmpl(data)

  events:
    "submit #new-<%= singular_name %>": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (<%= singular_name %>) =>
        @model = <%= singular_name %>
        window.location.hash = "/#{@model.id}"

      error: (<%= singular_name %>, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(this.el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
