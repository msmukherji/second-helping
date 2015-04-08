var receivingApp = angular.module("receivingApp", ["ui.router"])

// helperApp.config([ "$stateProvider", "$urlRouterProvider", function($stateProvider, $urlRouterProvider){

// 	$stateProvider
// 		.state("home", { url:"", views:{ "home":{ templateUrl:"partials/home.html"}}})

// 	$urlRouterProvider.otherwise("") 

// }])

receivingApp.controller("RecipientController", [ "$scope", "getData", function($scope, getData){

	getData("http://localhost:3000/donations", function(data){

		$scope.data = data

	});

}]);