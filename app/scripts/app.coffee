Hello = require './hello/hello'

window.addEventListener 'DOMContentLoaded', ->
  document.body.innerHTML = Hello.msg
