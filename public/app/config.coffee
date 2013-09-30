require.config(

  deps: ['main']

  paths:
    jquery: '//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min',
    angular: '../lib/angular/angular',
    angularRoute: '../lib/angular-route/angular-route',
    angularMocks: '../lib/angular-mocks/angular-mocks',
    angularUIRouter: '../lib/angular-ui-router/release/angular-ui-router',
    underscore: '../lib/underscore/underscore',
    text: '../lib/requirejs-text/text'

  shim:
    'angular':
      'exports': 'angular'
    'angularRoute': ['angular']
    'angularUIRouter': ['angular']
    'angularMocks':
      'deps': ['angular']
      'exports':'angular.mock'
    'jquery':
      'exports': 'jQuery'
    'underscore':
      'exports': '_'

  priority: ['angular']
)
