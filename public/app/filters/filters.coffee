define([
  'angular',
  'services'
], (angular, services) =>

    return angular
      .module('myApp.filters', ['myApp.services'])
      .filter('interpolate',
        ['version', (version)->
          (text)->
            return String(text).replace(/\%VERSION\%/mg, version)
        ])
)
