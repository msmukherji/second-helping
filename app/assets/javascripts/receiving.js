var receivingApp = angular.module("receivingApp", ["ui.router"])

receivingApp.controller("RecipientController", [ "$scope", "$http", function($scope, $http){

	$http.get("/donations").success(function(data){

		$scope.data = data;

		console.log($scope)

	});

	$http.post("/recipients/donations").success(function(data){

		$scope.data = data;

		console.log($scope)
	});

}]);