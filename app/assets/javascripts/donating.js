var donatingApp = angular.module("donatingApp", ["ui.router"])

donatingApp.controller("DonorController", [ "$scope", "$http", function($scope, $http){

	$scope.clickSubmit = function() {
		console.log($scope.donation)

		$http.post("/donors/donation", {

			name: $scope.donation.donor,
			description: $scope.donation.donation,
			requirements: $scope.donation.requirements,
			expiration: $scope.donation.expiration,
			"auto_confirm": $scope.donation.autoConfirm,

		}).success(function(data){
			$scope.donation = {}
	})
}
}]);

donatingApp.controller("DonorsDonationsController", [ "$scope", "$http", function($scope, $http){

	$http.get("/donor/donations").success(function(data){

		$scope.data = data;

		console.log($scope)

	});

}])