var donatingApp = angular.module("donatingApp", ["ui.router"])

donatingApp.controller("DonorController", [ "$scope", "$http", function($scope, $http){

	$scope.clickSubmit = function() {
		console.log($scope.donation)

		$http.post("/donors/donations", {
			// data to be sent to rails goes in this object

			donor: $scope.donation.donor,
			donor-contact: $scope.donation.donorContact,
			donation: $scope.donation.donation,
			requirements: $scope.donation.requirements,
			auto-confirm: $scope.donation.autoConfirm,

		}).success(function(data){
			// do something?
		})
	}
	/*$http.post("/donors/donations", data).success(function(data){

		$scope.data = data;

		console.log($scope)
	});*/

	


}]);

donatingApp.controller("RecipientController", [ "$scope", "$http", function($scope, $http){

	$http.get("/donations").success(function(data){

		$scope.data = data;

		console.log($scope)

	});

}])