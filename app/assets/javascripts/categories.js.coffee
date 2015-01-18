initialize = ->
  if localStorage.category? and parseInt(localStorage.category)
    $(".category[data-id=#{localStorage.category}]").click()
  else
    $('.categories').click()

changeCategory = ->
  $(document).on 'click', '.category', ->
    $(document).ready(resetCategories).on('page:load',
      resetCategories)
    $(this).addClass('active')
    localStorage.setItem('category', $(this).data('id'))
    $('.title-news').html($(this).data('title'))
    $(document).ready(checkTidings).on('page:load',
      checkTidings)

setAllCategories = ->
  $(document).on 'click', '.categories', ->
    $(document).ready(resetCategories).on('page:load',
      resetCategories)
    $(this).addClass('active')
    localStorage.setItem('category', 'all')
    $('.title-news').html('Все Новоcти')
    $(document).ready(checkTidings).on('page:load',
      checkTidings)

resetCategories = ->
  $('.category').removeClass('active')
  $('.categories').removeClass('active')

checkTidings = ->
  $(document).ready(checkTidingsIsNull).on('page:load',
    checkTidingsIsNull)
  $(document).ready(checkTidingsInCategory).on('page:load',
    checkTidingsInCategory)

checkTidingsInCategory = ->
  @tiding_ids = $('.list-categories').find('.active').data('ids')
  $('.tiding').each (n, tiding) =>
    if _.contains @tiding_ids, ($(tiding).data('id'))
      $(tiding).show()
      $('.list-news').append($(tiding))
    else
      $(tiding).hide()
      $('.datatrash').append($(tiding))

checkTidingsIsNull = ->
  count = $('.list-categories').find('.active')
  if count.data('ids').length is 0
    $('.title-null').removeClass('hide')
    $('.list-news').append($('.title-null'))
  else
    $('.title-null').addClass('hide')
    $('.datatrash').append($('.title-null'))

$(document).ready(changeCategory).on('page:load', changeCategory)
$(document).ready(setAllCategories).on('page:load', setAllCategories)
$(document).ready(initialize).on('page:load', initialize)
