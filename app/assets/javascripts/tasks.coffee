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
    # task form selector
    $taskForm = $("#task_form")
    
    # on day's check/uncheck
    # update selected days in task days field
    $(".days_names").change (element) ->
      selected = selected_days()
      $("#task_days").val(selected)
    
    # getting values of selected days
    # return array of days
    selected_days = ->
      days = []
      $(".days_names:checked").each (index)->
        days.push $(this).val()
      days
    
    # client side validations on task form.
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
          "task[path]":
            required: true
          
      if $($taskForm).valid()
        return true
      # Prevent the form from being submitted:
      return false

