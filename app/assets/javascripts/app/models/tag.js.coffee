AppTag = ->
  window.App.TagUrl = ->
    '/tags'

  class App.Tag extends Spine.Model
    @configure 'Tag', 'id', 'title', 'tiding_ids'
    @extend Spine.Model.Ajax
    @url: window.App.TagUrl

$(document).ready(AppTag).on('page:load', AppTag)
