var donatingApp = angular.module("donatingApp", ["ui.router"])

// helperApp.config([ "$stateProvider", "$urlRouterProvider", function($stateProvider, $urlRouterProvider){

// 	$stateProvider
// 		.state("home", { url:"", views:{ "home":{ templateUrl:"partials/home.html"}}})

// 	$urlRouterProvider.otherwise("") 

// }])

donatingApp.controller("DonorController", [ "$scope", "getData", function($scope, getData){

	getData("http://localhost:3000/donors", function(data){

		$scope.data = data

	});

}]);