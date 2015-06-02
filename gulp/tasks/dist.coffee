gulp    = require 'gulp'
config  = require '../config'

gulp.task 'dist:confg', ->
  config.debug = false
  config.path.dest = config.path.dist

gulp.task 'dist:build', [
    'dist:confg',
    'clean',
    'build'
  ]
