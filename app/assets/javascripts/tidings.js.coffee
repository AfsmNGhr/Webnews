loadNextPageTidings = ->
  if $('.paginate').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      height = $(document).height() - $(window).height() - 50
      if url && $(window).scrollTop() > height
        $('.pagination').text("Подгружаю следующие новости...")
        $.getScript(url)
    $(window).scroll()

$(document).ready(loadNextPageTidings).on('page:load', loadNextPageTidings)
