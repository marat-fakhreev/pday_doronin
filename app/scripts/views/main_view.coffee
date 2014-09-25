class App.Views.MainView
  constructor: ->
    @bindUi()
    @bindEvents()
    @_initInputMask()
    @_detectBrowser()

  bindUi: ->
    @ui =
      onlyBody: $('body')
      emailForm: $('#email_form')
      emailField: $('#user_email')
      emailFormButton: $('#email_form_button')
      mobileForm: $('#mobile_form')
      mobileField: $('#user_mobile')
      mobileFormButton: $('#mobile_form_button')

  bindEvents: ->
    @ui.emailForm.on 'submit', @onPreventForm
    @ui.mobileForm.on 'submit', @onPreventForm
    @ui.emailFormButton.on 'click', @onSubmitEmailForm
    @ui.mobileFormButton.on 'click', @onSubmitMobileForm

  onPreventForm: (event) ->
    event.preventDefault()

  onSubmitEmailForm: =>
    flag = true
    data = {}

    flag = false if @ui.emailField.val() is '' or not @_checkEmail(@ui.emailField.val())

    if flag
      data['Email'] = @ui.emailField.val()
      new App.Models.Form(form: @ui.emailForm, data: data, type: 'email')
    else
      if @ui.emailField.val() is ''
        @_showAlert()
      else
        @_showEmailAlert()

  onSubmitMobileForm: =>
    flag = true
    data = {}

    flag = false if @ui.mobileField.val() is ''

    if flag
      data['Мобильный телефон'] = '+7 ' + @ui.mobileField.val()
      new App.Models.Form(form: @ui.mobileForm, data: data, type: 'mobile')
    else
      @_showAlert()

  _checkEmail: (str) ->
    pattern = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/
    str.match(pattern)

  _showAlert: ->
    alert('Пожалуйста заполните все поля!')

  _showEmailAlert: ->
    alert('Пожалуйста введите корректный email!')

  _initInputMask: ->
    @ui.mobileField.mask("(999) 999-99-99")

  _detectBrowser: ->
    @ui.onlyBody.addClass('mozilla') if @_osDetection() is 'Windows'

  _osDetection: ->
    OSName = undefined

    if (navigator.appVersion.indexOf('Win') isnt -1) then OSName = 'Windows'
    if (navigator.appVersion.indexOf('Mac') isnt -1) then OSName = 'MacOS'
    if (navigator.appVersion.indexOf('X11') isnt -1) then OSName = 'UNIX'
    if (navigator.appVersion.indexOf('Linux') isnt -1) then OSName = 'Linux'

    OSName
