cbpAnimatedHeader = (->
  f = ->
    window.addEventListener "scroll", ((h) ->
      unless e
        e = true
        setTimeout d, 250
    ), false
  d = ->
    h = c()
    if h < a
      g.addClass("navbar-big")
      body.addClass('navbar-big')
    else
      g.removeClass("navbar-big")
      body.removeClass('navbar-big')
    e = false
  c = ->
    window.pageYOffset or b.scrollTop
  b = document.documentElement
  g = $("#top-nav")
  body = $('body')
  e = false
  a = 300
  f()
  d()
)()
