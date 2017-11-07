class App.Tasks extends App.Base

  beforeAction: (action) =>
    return


  afterAction: (action) =>
    return


  index: =>
    return

  new: =>
    new App.Tasks().taskFormHandler()
    return

  edit: =>
    new App.Tasks().taskFormHandler()
    return

  taskFormHandler: =>
    $taskForm = $("#task_form")
    
    $(".days_names").change (element) ->
      selected = selected_days()
      $("#task_days").val(selected)
    selected_days = ->
      days = []
      $(".days_names:checked").each (index)->
        days.push $(this).val()
      days
    $($taskForm).submit (event) ->
      $($taskForm).validate
        focusInvalid: false
        errorClass: 'invalid'
        validClass: 'valid'
        errorPlacement: (error, element) ->
          error.insertAfter $(element)

        rules:
          "task[name]":
            required: true
          "task[start_time]":
            required: true
          "task[end_time]":
            required: true
          
      if $($taskForm).valid()
        return true
      # Prevent the form from being submitted:
      return false

