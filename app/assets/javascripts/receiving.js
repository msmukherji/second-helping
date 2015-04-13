var receivingApp = angular.module("receivingApp", ["ui.router", "individualApp"])

receivingApp.controller("RecipientController", [ "$scope", "$http", function($scope, $http){

	$http.get("/donations").success(function(data){

		$scope.data = data;

		console.log($scope)

	});

	$scope.clickDetailsButton = function(item) {
		console.log(item)
		$scope.activeItem = item
	}

}]);