## ANGULAR MODULE NGAPP,CONTROLLER NGCONTROLLER
var scope = angular.element($(".ngcontroller")).scope();


angular.element($("#ngapp")).injector().invoke(function($compile) {
  var scope = angular.element($(".ngcontroller")).scope();
  $compile($(".ngcontroller").contents())(scope);
  scope.$apply();
});

