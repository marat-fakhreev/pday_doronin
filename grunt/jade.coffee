module.exports = (grunt) ->
  html:
    options:
      pretty: true
      client: false
    files: [
      cwd: '<%= grunt.appDir %>'
      src: '**/*.jade'
      dest: '<%= grunt.publicDir %>'
      expand: true
      ext: '.html'
    ]
