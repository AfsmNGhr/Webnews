loadNextPageTidings = ->
  if $('.paginate').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      height = $(document).height() - $(window).height() - 50
      if url && $(window).scrollTop() > height
        $('.pagination').text("Подгружаю следующие новости...")
        $.getScript(url)
    $(window).scroll()

disabledSubmit = ->
  $(document).on 'upload:start', 'form', ->
  $(this).find("input[type=submit]").attr("disabled", true)
  $(document).on 'upload:complete', 'form', ->
    unless $(this).find("input.uploading").length
      $(this).find("input[type=submit]").removeAttr("disabled")

chosen = ->
  $('.tiding-select select').chosen
    allow_single_deselect: true
    no_results_text: 'Нет результатов поиска'
    width: '320px'

$(document).ready(loadNextPageTidings).on('page:load', loadNextPageTidings)
$(document).ready(chosen).on('page:load', chosen)
$(document).on 'click', 'input#tiding_image', ->
  $(document).ready(disabledSubmit).on('page:load', disabledSubmit)
