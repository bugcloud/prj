_           = require 'lodash'
gulp        = require 'gulp'
gulpif      = require 'gulp-if'
uglify      = require 'gulp-uglify'
streamify   = require 'gulp-streamify'
sourcemaps  = require 'gulp-sourcemaps'
source      = require 'vinyl-source-stream'
buffer      = require 'vinyl-buffer'
browserify  = require 'browserify'
notifier    = require "node-notifier"
config      = require '../config'

swallowError = (error) ->
  (error)->
    console.log error
    notifier.notify(
      title: "Error in building scripts"
      message: error
    )
    @emit('end')

gulp.task 'build:scripts', ->
  ENTRY_FILES = ['app']

  _.each ENTRY_FILES, (filename) ->
    browserify(
      entries: ["#{config.path.scripts}/#{filename}.coffee"]
      extensions: ['.coffee']
      transform: ['coffeeify']
      debug: config.debug
    )
    .bundle()
    .on('error', swallowError)
    .pipe(source("#{filename}.js"))
    .pipe(buffer())
    .pipe(sourcemaps.init
      loadMaps: true
    )
    .pipe(gulpif(!config.debug, streamify(uglify())))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest("#{config.path.dest}/scripts"))
