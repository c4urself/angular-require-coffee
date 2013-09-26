define([
  'angular',
  'services'
], (angular, services) =>

    return angular
      .module('tubular.filters', ['tubular.services'])
      .filter('interpolate',
        ['version', (version)->
          (text)->
            return String(text).replace(/\%VERSION\%/mg, version)
        ])
)
