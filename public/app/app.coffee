define([
  'angular',
  'filters/filters',
  'services',
  'directives/directives',
  'controllers',
  'angularRoute',
  'angularUIRouter'
], (angular, filters, services, directives, controllers) =>

  app = angular.module('myApp', [
    'myApp.filters',
    'myApp.services',
    'myApp.directives',
    'myApp.controllers',
    'ngRoute',
    'ui.router',
  ])

  app.run(['$rootScope', '$state', '$stateParams', ($rootScope, $state, $stateParams) =>
    $rootScope.$state = $state
    $rootScope.$stateParams = $stateParams
    $state.transitionTo('app.home')
    console.log('transitioning state')
  ])

  return app
)
