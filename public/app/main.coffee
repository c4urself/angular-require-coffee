require([
  'jquery'
  'angular',
  'app',
  'routes'
], ($, angular, app, routes) =>

  $html = angular.element(document.getElementsByTagName('html')[0])

  angular.element().ready =>
    $html.addClass('ng-app')
    angular.bootstrap($html, [app['name']])
    console.log('Done bootstrapping')
)
