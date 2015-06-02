gulp        = require 'gulp'
config      = require '../config'
express     = require 'express'
serveStatic = require 'serve-static'
serveIndex  = require 'serve-index'

gulp.task 'connect', ->
  app = express()
        .use(serveStatic(config.path.src))
        .use(serveStatic(config.path.dest))
        .use(serveIndex(config.path.src))
        .listen(config.port)
        .on 'listening', ->
          console.log('Started connect web server on http://localhost:9000')
