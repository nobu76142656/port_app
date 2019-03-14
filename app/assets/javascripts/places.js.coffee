ready = ->

  if !window.google

    script = document.createElement('script')
    script.type = 'text/javascript';
    script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&' +
                  'language=ja&callback=triggerMap'
    document.body.appendChild(script)

  else
    triggerMap()

window.triggerMap = ->
  # your code

# For turbolinks
$(document).ready(ready)
$(document).on 'page:load', ready
