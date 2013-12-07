jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()
  $('#carousel .carousel-inner').carousel()

  $('.books .book').hover( ->
    $(this).find('.caption').animate({
      bottom: 0
    })
  , ->
    $(this).find('.caption').animate({
      bottom: '-80px'
    })
  )
