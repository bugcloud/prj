gulp        = require 'gulp'
config      = require '../config'

gulp.task 'watch', ['serve'], ->
  gulp.watch "#{config.path.scripts}/**/*.{js,coffee}", ['build:scripts']
  gulp.watch "#{config.path.styles}/**/*.{css,scss}", ['build:styles']
  gulp.watch "#{config.path.images}/**/*", ['build:images']
  gulp.watch "#{config.path.assets}/**/*", ['build:assets']
