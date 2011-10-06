<%= js_app_name %>.Helpers =

  jsonData: (url, params = {}) ->
    return if !url
    responseDate = null
    $.ajax(
      url: url
      async: false
      dataType: "json"
      data: params
      success: (data, textStatus, jqXHR) -> responseDate = data
    )
    responseDate

  jsonCallback: (url, callback, params = {}) ->
    $.getJSON(url, params, (data) -> callback?(data) )

  # Renders For Alers Messages
  renderWarnings: (data) ->
    $("#alerts_container").html( $("#backboneWarningAlert").tmpl(data) )

  renderErrors: (data) ->
    $("#alerts_container").html( $("#backboneErrorAlert").tmpl(data) )

  renderSuccess: (data) ->
    $("#alerts_container").html( $("#backboneSuccessAlert").tmpl(data) )

  renderInfo: (data) ->
    $("#alerts_container").html( $("#backboneInfoAlert").tmpl(data) )

  errorsMessages:
    inclusion: "no está incluído en la lista"
    exclusion: "está reservado"
    invalid: "es inválido"
    record_invalid: "es inválido"
    invalid_date: "es una fecha inválida"
    confirmation: "no coincide con la confirmación"
    blank: "no puede estar en blanco"
    empty: "no puede estar vacío"
    not_a_number: "no es un número"
    taken: "ya ha sido tomado"
    less_than: "debe ser menor que %{count}"
    less_than_or_equal_to: "debe ser menor o igual que %{count}"
    greater_than: "debe ser mayor que %{count}"
    greater_than_or_equal_to: "debe ser mayor o igual que %{count}"
    too_short:
      one: "es demasiado corto (mínimo 1 caracter)"
      other: "es demasiado corto (mínimo %{count} caracteres)"
    too_long:
      one: "es demasiado largo (máximo 1 caracter)"
      other: "es demasiado largo (máximo %{count} caracteres)"
    equal_to: "debe ser igual a %{count}"
    wrong_length:
      one: "longitud errónea (debe ser de 1 caracter)"
      other: "longitud errónea (debe ser de %{count} caracteres)"
    accepted: "debe ser aceptado"
    even: "debe ser un número par"
    odd: "debe ser un número non"