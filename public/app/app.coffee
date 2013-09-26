define([
  'angular',
  'filters/filters',
  'services',
  'directives/directives'
  'controllers'
  'angularRoute'
], (angular, filters, services, directives, controllers) =>

  return angular.module('tubular', [
    'ngRoute',
    'tubular.controllers',
    'tubular.filters',
    'tubular.services',
    'tubular.directives'
  ])
)
