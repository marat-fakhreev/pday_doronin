class App.Views.MainView
  constructor: ->
    @initUi()
    @events()
    @initInputMask()
    @_detectBrowser()

  initUi: ->
    @ui =
      wind: $(window)
      onlyBody: $('body')
      popupForm: $('.pop-up form')

  events: ->
    @ui.popupForm.on 'submit', @onSubmitForm

  initInputMask: ->
    $('#user_phone').mask("(999) 999-99-99")

  onSubmitForm: (event) ->
    event.preventDefault()
    self = $(event.currentTarget)
    $input = self.find('.field input')
    flag = true
    data = {}

    $input.each ->
      flag = false if $(@).val() is ''

    if flag
      $input.each ->
        inp = $(@)
        data[inp.attr('name')] = inp.val()
      new App.Models.Form(form: self, data: data)
    else
      alert('Пожалуйста заполните все поля!')

  _detectBrowser: ->
    @ui.onlyBody.addClass('mozilla') if @_osDetection() is 'Windows'

  _osDetection: ->
    OSName = undefined

    if (navigator.appVersion.indexOf('Win') isnt -1) then OSName = 'Windows'
    if (navigator.appVersion.indexOf('Mac') isnt -1) then OSName = 'MacOS'
    if (navigator.appVersion.indexOf('X11') isnt -1) then OSName = 'UNIX'
    if (navigator.appVersion.indexOf('Linux') isnt -1) then OSName = 'Linux'

    OSName
