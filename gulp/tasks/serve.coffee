gulp = require 'gulp'

gulp.task 'serve', ['build', 'connect'], ->
  require('opn')('http://localhost:9000')
