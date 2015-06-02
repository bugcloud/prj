gulp      = require 'gulp'
imagemin  = require 'gulp-imagemin'
config    = require '../config'

gulp.task 'build:images', ->
  gulp.src("#{config.path.images}/**/*")
    .pipe(imagemin {
      optimizationLevel: 3
      progressive: true
      interlaced: true
    })
    .pipe(gulp.dest("#{config.path.dest}/images"))
