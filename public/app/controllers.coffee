define([
  'angular',
  'services'
], (angular) =>

  return angular.module('myApp.controllers', ['myApp.services'])
    .controller('MyCtrl1', ['$scope', 'version', ($scope, version) =>
      console.log('Loaded ctl 1')
      $scope.scopedAppVersion = version
    ])
    .controller('MyCtrl2', ['$scope', '$injector', ($scope, $injector) =>
      require(['controllers/myctrl2'], (myctrl2) =>
        console.log('Loaded ctl 2')
        # injector method takes an array of modules as the first argument
        # if you want your controller to be able to use components from
        # any of your other modules, make sure you include it together with 'ng'
        # Furthermore we need to pass on the $scope as it's unique to this controller
        $injector.invoke(myctrl2, this, '$scope': $scope)
      )
    ])
)
