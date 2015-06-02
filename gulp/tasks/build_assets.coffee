gulp    = require 'gulp'
config  = require '../config'

gulp.task 'build:assets', ->
  gulp.src("#{config.path.assets}/**/*.html")
    .pipe(gulp.dest(config.path.dest))
