class App.Tiding extends Spine.Model
  @configure 'Tiding', 'title', 'text'
  @extend Spine.Model.Ajax

  @url: "/tidings"

  validate: ->
    msgs = []
    unless @title? and @title isnt ''
      msgs.push "Анонс новости не може быть пустым"
    return msgs if msgs.length > 0
