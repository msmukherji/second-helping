var individualApp = angular.module("individualApp", ["ui.router"])

individualApp.controller("IndividualDonationController", [ "$scope", "$http", function($scope, $http){

	$http.get("/donations").success(function(data){

		$scope.data = data;

	});

	$scope.clickDetailsButton = function(item) {

		console.log(item)
	}

}]);