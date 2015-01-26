AppCategory = ->
  window.App.CategoryUrl = ->
    '/categories'

  class App.Category extends Spine.Model
    @configure 'Category', 'id', 'title', 'text', 'tiding_ids'
    @extend Spine.Model.Ajax
    @url: window.App.CategoryUrl

$(document).ready(AppCategory).on('page:load', AppCategory)
