class App.Models.Form
  constructor: (object) ->
    @$form = object.form
    @data = object.data
    @type = object.type
    str = ''

    if @type is 'email'
      subject = 'Email-Doronin'
    else if @type is 'mobile'
      subject = 'SMS-Doronin'

    for key, value of @data
      str += key + ": " + value + "\r\n"

    $.get 'php/sender.php', {data: str, subject: subject}, (message) =>
      if message is 0
        alert('Ошибка на сервере! Попробуйте заполнить еще раз')
      else
        @$form.trigger('reset')
        alert('Ваш запрос успешно отправлен')
