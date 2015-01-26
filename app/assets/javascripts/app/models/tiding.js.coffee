AppTiding = ->
  window.App.TidingUrl = ->
    '/tidings'

  class App.Tiding extends Spine.Model
    @configure 'Tiding', 'id', 'title', 'text', 'preview',
      'image', 'category_ids', 'tag_ids', 'url'
    @extend Spine.Model.Ajax
    @url: window.App.TidingUrl

$(document).ready(AppTiding).on('page:load', AppTiding)
