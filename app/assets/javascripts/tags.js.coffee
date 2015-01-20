selectTag = ->
  $(document).on 'click', '.one-tag', ->
    $(document).ready(resetTag).on('page:load',
      resetTag)
    $(this).addClass('active')
    localStorage.setItem('tag', $(this).data('id'))
    $('.title-news').html($(this).data('title'))
    $(document).ready(checkTag).on('page:load',
      checkTag)

resetTag = ->
  $('.one-tag').removeClass('active')
  $('.category').removeClass('active')
  $('.categories').removeClass('active')

checkTag = ->
  $(document).ready(checkTidingsIsNullTag).on('page:load',
    checkTidingsIsNullTag)
  $(document).ready(checkTidingsInTag).on('page:load',
    checkTidingsInTag)

checkTidingsInTag = ->
  @tag_ids = $('.list-tags').find('.active').data('ids')
  $('.tiding').each (n, tiding) =>
    if _.contains @tag_ids, ($(tiding).data('id'))
      $(tiding).show()
      $('.list-news').append($(tiding))
    else
      $(tiding).hide()
      $('.datatrash').append($(tiding))

checkTidingsIsNullTag = ->
  if location.pathname is '/' or '/tidings'
    count = $('.list-tags').find('.active')
    if count.data('ids').length is 0
      $('.title-null').removeClass('hide')
      $('.list-news').append($('.title-null'))
      $('.page-tidings').hide()
    else
      $('.title-null').addClass('hide')
      $('.datatrash').append($('.title-null'))
      $('.page-tidings').show()

$(document).ready(selectTag).on('page:load', selectTag)
