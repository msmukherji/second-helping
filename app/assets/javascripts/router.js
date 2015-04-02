var app = angular.module("routerApp", ["ui.router"])

app.config([ "$stateProvider", "$urlRouterProvider", function($stateProvider, $urlRouterProvider){

	$stateProvider
		.state("home", {
			views: {
				"panel": {templateUrl: "partials/home.html" }
			}
		})

	$stateProvider
		.state("donor-sign-in", {
			views: {
				"panel": {templateUrl: "partials/donor-sign-in.html" }
			}
		})

	$stateProvider
		.state("recipient-sign-in", {
			views: {
				"panel": {templateUrl: "partials/recipient-sign-in.html" }
			}
		})

	$stateProvider
		.state("new-donor", {
			views: {
				"panel": {templateUrl: "partials/new-donor.html" }
			}
		})

	$stateProvider
		.state("new-recipient", {
			views: {
				"panel": {templateUrl: "partials/new-recipient.html" }
			}
		})

	$stateProvider
		.state("donation", {
			views: {
				"panel": {templateUrl: "partials/donation.html" }
			}
		})

	$stateProvider
		.state("donations", {
			views: {
				"panel": {templateUrl: "partials/donations.html" }
			}
		})

	$stateProvider
		.state("confirm-donation", {
			views: {
				"panel": {templateUrl: "partials/confirm-donation.html" }
			}
		})

	$stateProvider
		.state("confirm-claim", {
			views: {
				"panel": {templateUrl: "partials/confirm-claim.html" }
			}
		})

	$urlRouterProvider.otherwise("home")

}])