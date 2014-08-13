gruntFunction = (grunt) ->

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    clean:
      css: "css/*.css"

    htmllint:
        all: ["*.html"]

    less:
      development:
        options:
          cleancss: true
          paths: ['less', 'bower_components/bootstrap/less']
        files:
          'css/style.css': 'less/vessel.less'

    watch:
      less:
        files: ['less/*.less']
        tasks: ['less']
      html:
        files: ['*.html']
        tasks: ['htmllint']
      options:
        livereload: 35729

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-html'

  grunt.registerTask 'default', ['less']

module.exports = gruntFunction
