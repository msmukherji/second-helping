var helperApp = angular.module("helperApp", ["ui.router"])

helperApp.controller("RecipientController", [ "$scope", "$http", function($scope, $http){
	$scope.recipient = {};
	$scope.loginRecipient = function() {
		$http({
			method: "POST",
			url: "/recipients/sign_in",
			data: $scope.recipient
		})
	}

}])

helperApp.controller("DonorController", [ "$scope", "$http", function($scope, $http){
	$scope.donor = {};
	$scope.loginDonor = function() {
		$http({
			method: "POST",
			url: "/donors/sign_in",
			data: $scope.donor
		})
	}
}])
