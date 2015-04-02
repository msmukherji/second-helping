/*var helperApp = angular.module("helperApp", ["ui.router"])

helperApp.config([ "$stateProvider", "urlRouteProvider", function($stateProvider, $urlRouteProvider){

  console.log(1)
	$urlRouteProvider.otherwise("/")

	$stateProvider
		.state("index", {
			url: "/",
			views: {

				"home": { templateUrl: "partials/home.html" },
				"donor-sign-in": { templateUrl: "partials/donor-sign-in.html" },
				"new-donor": { templateUrl: "partials/new-donor.html" },
				"recipient-sign-in": { templateUrl: "partials/recipient-sign-in.html" },
				"new-recipient": { templateUrl: "partials/new-recipient.html" },
				"donation": { templateUrl: "partials/donation.html" },
				"donations": { templateUrl: "partials/donations.html" },
				"confirm-donation": { templateUrl: "partials/confirm-donation.html" },
				"confirm-claim": { templateUrl: "partials/confirm-claim.html" },
			}
		})
}])

trackerApp.controller("HomeController", [ "$scope", "getData", function($scope, getData){

  getData("/api/home", function(data){

    $scope.data = data

	});

}]);

trackerApp.controller("DonorSignInController", [ "$scope", "getData", function($scope, getData){

  getData("/api/donor-sign-in", function(data){

    $scope.data = data

  	});

}]);

trackerApp.controller("NewDonorController", [ "$scope", "getData", function($scope, getData){

  getData("/api/new-donor", function(data){

    $scope.data = data

    });

}]);

trackerApp.controller("RecipientSignInController", [ "$scope", "getData", function($scope, getData){

  getData("/api/recipient-sign-in", function(data){

    $scope.data = data

    });

}]);

trackerApp.controller("NewRecipientController", [ "$scope", "getData", function($scope, getData){

  getData("/api/new-recipient", function(data){

    $scope.data = data

	});

}]);


trackerApp.controller("DonationController", [ "$scope", "getData", function($scope, getData){

  getData("/api/donation", function(data){

    $scope.data = data

    });

}]);

trackerApp.controller("DonationsController", [ "$scope", "getData", function($scope, getData){

  getData("/api/donations", function(data){

    $scope.data = data

  	});

}]);

trackerApp.controller("ConfirmDonationController", [ "$scope", "getData", function($scope, getData){

  getData("/api/confirm-donation", function(data){

    $scope.data = data

    });

}]);

trackerApp.controller("ConfirmClaimController", [ "$scope", "getData", function($scope, getData){

  getData("/api/confirm-claim", function(data){

    $scope.data = data

    });

}]);

trackerApp.factory("getData", [ "$http", function($http){

	return function(url, callback) {

	}
	
}])

*/