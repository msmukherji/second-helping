var donatingApp = angular.module("donatingApp", ["ui.router"])

donatingApp.controller("DonorController", [ "$scope", "$http", function($scope, $http){

	$scope.clickSubmit = function() {
		console.log($scope.donation)

		$http.post("/donors/donation", {
			// data to be sent to rails goes in this object

			name: $scope.donation.donor,
			description: $scope.donation.donation,
			requirements: $scope.donation.requirements,
			expiration: $scope.donation.expiration,
			"auto_confirm": $scope.donation.autoConfirm,

		}).success(function(data){
			// do something?
		})
	}
	/*$http.post("/donors/donations", data).success(function(data){

		$scope.data = data;

		console.log($scope)
	});*/

	


}]);

donatingApp.controller("DonorsDonationsController", [ "$scope", "$http", function($scope, $http){

	$http.get("/donations").success(function(data){

		$scope.data = data;

		console.log($scope)

	});

}])