gulp    = require 'gulp'
config  = require '../config'

gulp.task 'build', [
    'build:scripts'
    'build:styles'
    'build:images'
    'build:assets'
  ]
