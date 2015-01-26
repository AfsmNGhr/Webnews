AppCategories = ->
  class App.Categories extends Spine.Controller
    constructor: ->
      super
      App.Tiding.fetch()
      App.Category.fetch()
      App.Tag.fetch()
      App.Tiding.one 'refresh', () =>
        @renderTidings(App.Tiding.all(), tiding_ids)

    renderTidings: (tidings, tiding_ids) ->
      _.each tidings, (t) =>
      li = "<li class='tiding list-group-item' data-id=#{t.id}</li>"
      $('#tidings').append(li)
      new TidingOne(
        tiding: t,
        el: $('li').last())

  class TidingOne extends Spine.Controller
    constructor: ->
      super
      @render()

    render: ->

$(document).ready(AppCategories).on('page:load', AppCategories)
