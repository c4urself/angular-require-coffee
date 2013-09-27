// This is the main application configuration file.  It is a Grunt
// configuration file, which you can learn more about here:
// https://github.com/cowboy/grunt/blob/master/docs/configuring.md
//
module.exports = function(grunt) {

  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-concat');

  grunt.loadNpmTasks('grunt-shell');
  grunt.loadNpmTasks('grunt-requirejs');
  grunt.loadNpmTasks('grunt-targethtml');


  grunt.initConfig({
    // Load in package info
    pkg: grunt.file.readJSON('package.json'),

    // The clean task ensures all files are removed from the dist/ directory so
    // that no files linger from previous builds.
    clean: {
      initial: ['dist'],
      finish: ['dist/debug']
    },

    // The lint task will run the build configuration and the application
    // JavaScript through JSHint and report any errors.  You can change the
    // options for this task, by reading this:
    // https://github.com/cowboy/grunt/blob/master/docs/task_lint.md
    lint: {
      files: ['public/app/**/*.js']
    },

    // The jshint option for scripturl is set to lax, because the anchor
    // override inside main.js needs to test for them so as to not accidentally
    // route.
    jshint: {
      options: {
        scripturl: true,
        laxcomma: true,
        laxbreak: true
      },
      all: ['public/app/**/*.js']
    },

    // The concatenate task is used here to merge the almond require/define
    // shim and the templates into the application code.  It's named
    // dist/debug/require.js, because we want to only load one script file in
    // index.html.
    concat: {
      all: {
        options: {
          separator: ';'
        },
        src: [
          'public/libs/almond.js',
          'dist/debug/templates.js',
          'dist/debug/require.js'
        ],
        dest: 'dist/debug/require.js'
      }
    },

    // Uglify the javascript and add a banner to the top for who wrote all
    // the codez
    uglify: {
      all: {
        options: {
          // Banner that appears at the top of the require file
          banner: '/*\n*\n* <%= pkg.name %> - v<%= pkg.version %>\n*\n' +
            '* <%= pkg.description %>\n*\n' +
            '* Website: <%= pkg.homepage %>\n' +
            '* Author: <%= pkg.author.name %>\n' +
            '* Contributors: <% _.each(pkg.contributors, function(c) { %><%= c.name %>; <% }); %>\n' +
            '* Copyright (c) <%= grunt.template.today("yyyy") %>\n*\n' +
            '* Built on <%= grunt.template.today("dd-mmm-yyyy") %>\n*\n*/',
          compress: true,
          mangle: true
        },
        files: {
          'dist/public/require.js': ['dist/debug/require.js']
        }
      }
    },

    // This task uses James Burke's excellent r.js AMD build tool.  In the
    // future other builders may be contributed as drop-in alternatives.
    requirejs: {
      release: {
          options: {
            // Include the main configuration file
            mainConfigFile: 'public/app/config.js',

            // Output file
            out: 'dist/debug/require.js',

            // Root application module
            name: 'config',

            // Do not wrap everything in an IIFE
            wrap: false
          }
      },
      debug: {
          options: {
            // Include the main configuration file
            mainConfigFile: 'public/app/config.js',

            // Output file
            out: 'dist/debug/require.js',

            // No uglify for debug
            optimize: 'none',

            // Root application module
            name: 'config',

            // Do not wrap everything in an IIFE
            wrap: false
          }
      }
    },

    // produce html
    targethtml: {
      debug: {
        src: 'public/index.html',
        dest: 'dist/debug/index.html'
      },
      release: {
        src: 'public/index.html',
        dest: 'dist/public/index.html'
      }
    },

    // watch files and run tasks
    watch: {
      lint: {
        files: ['grunt.js', 'app/*.js', 'app/**/*.js', 'app/**/**/*.js', 'app/**/**/**/*.js'],
        tasks: 'lint'
      }
    },

  });

  grunt.registerTask('default', ['debug']);
  grunt.registerTask('debug', ['clean:initial', 'targethtml:release', 'jshint:all', 'requirejs:debug', 'concat', 'less']);

};
